package ua.com.meraya.grouper.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import ua.com.meraya.grouper.controller.utils.ControllerUtils;
import ua.com.meraya.grouper.database.entity.Group;
import ua.com.meraya.grouper.database.entity.Message;
import ua.com.meraya.grouper.database.entity.User;
import ua.com.meraya.grouper.database.repository.MessageRepository;
import ua.com.meraya.grouper.database.repository.UserRepository;
import ua.com.meraya.grouper.database.service.GroupService;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

@Controller
public class MainController {

    private final MessageRepository messageRepository;
    private final UserRepository userRepository;
    private final GroupService groupService;

    public MainController(MessageRepository messageRepository, UserRepository userRepository, GroupService groupService) {
        this.messageRepository = messageRepository;
        this.userRepository = userRepository;
        this.groupService = groupService;
    }

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/")
    public String greeting(String name, Map<String, Object> model) {
        model.put("name", name);
        return "index";
    }

    @GetMapping("/main")
    public String main(
            @AuthenticationPrincipal User u,
            @RequestParam(required = false, defaultValue = "") String filter,
            Model model) {
        User user = userRepository.findByUsername(u.getUsername());
        Iterable<Message> messages = Collections.emptyList();
        Date d = new Date();
        SimpleDateFormat format = new SimpleDateFormat("dd.MM.yyyy");
        String date = format.format(d);

        if (user.getGroup() != null) {
            if (filter != null && !filter.isEmpty()) {
                messages = messageRepository.findByTagAndGroup(filter, user.getGroup());
            } else {
                messages = messageRepository.findByGroup(user.getGroup());
            }
        }

        model.addAttribute("date", date);
        model.addAttribute("university", user.getUniversity());
        model.addAttribute("group", user.getGroup());
        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);

        return "main";
    }

    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User u,
            @Valid Message message,
            BindingResult bindingResult,
            Model model
    ) throws IOException {
        MultipartFile file = null;
        Date d = new Date();
        SimpleDateFormat format = new SimpleDateFormat("dd.MM.yyyy");
        String date = format.format(d);
        User user = userRepository.findByUsername(u.getUsername());
        Group group = user.getGroup();
        message.setAuthor(user);
        message.setGroup(group);

        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errorsMap);
            model.addAttribute("message", message);
        } else {
            if (file != null && !file.getOriginalFilename().isEmpty()) {
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                String uuidFile = UUID.randomUUID().toString();
                String resultFileName = uuidFile + "." + file.getOriginalFilename();
                file.transferTo(new File(uploadPath + "/" + resultFileName));
                message.setFilename(resultFileName);
            }
            model.addAttribute("message", null);
            messageRepository.save(message);
            group.setMessages(group.getMessages() + 1);
            groupService.updateGroup(group);
        }

        Iterable<Message> messages = Collections.emptyList();
        if (user.getGroup() != null) {
            messages = messageRepository.findByGroup(user.getGroup());
        }

        model.addAttribute("date", date);
        model.addAttribute("university", user.getUniversity());
        model.addAttribute("group", user.getGroup());
        model.addAttribute("messages", messages);
        return "main";
    }
}
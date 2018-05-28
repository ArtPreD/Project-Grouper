package ua.com.meraya.grouper.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ua.com.meraya.grouper.database.entity.User;
import ua.com.meraya.grouper.database.repository.UserRepository;
import ua.com.meraya.grouper.database.service.GroupService;
import ua.com.meraya.grouper.database.service.UniversityService;
import ua.com.meraya.grouper.database.service.UserService;



@Controller
@RequestMapping("/user")
public class UserController {

    private final UserService userService;
    private final UniversityService universityService;
    private final UserRepository userRepository;
    private   final GroupService groupService;

    public UserController(UserService userService, UniversityService universityService,
                          UserRepository userRepository, GroupService groupService) {
        this.userService = userService;
        this.universityService = universityService;
        this.userRepository = userRepository;
        this.groupService = groupService;
    }

    @GetMapping("/profile")
    public String getProfile(Model model, @AuthenticationPrincipal User u){
        User user = userRepository.findByUsername(u.getUsername());
        model.addAttribute("username", user.getUsername());
        model.addAttribute("email", user.getEmail());
        model.addAttribute("univer", user.getUniversity());
        model.addAttribute("universities", universityService.findAll());
        if(user.getUniversity() != null) {
            if (!user.getUniversity().getGroups().isEmpty()){
                model.addAttribute("groups", user.getUniversity().getGroups());
            }
        }
        model.addAttribute("group", user.getGroup());
        model.addAttribute("stat", user.isStat());

        return "profile";
    }

    @PostMapping("/profile")
    public String updateProfile(
            @AuthenticationPrincipal User u,
            @RequestParam String password,
            @RequestParam String email,
            @RequestParam String university,
            @RequestParam String group
    ){
        User user = userRepository.findByUsername(u.getUsername());
        if (user.getUniversity() == null){
            userService.updateProfile(user, password, email, university);
        }else {
            universityService.deleteUserFromUniversity(user);
            userService.updateProfile(user, password, email, university);
        }

        if(user.getGroup() == null){
            if(!group.equals("Выбери...")){
//                user.setGroup(groupService.findByNameAndUniversity(group, user.getUniversity()));
                groupService.addStatUserIntoGroup(group, user);
            }
        }

        return "redirect:/user/profile";
    }
}

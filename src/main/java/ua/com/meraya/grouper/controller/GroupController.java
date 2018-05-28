package ua.com.meraya.grouper.controller;

import jdk.nashorn.internal.objects.annotations.Getter;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ua.com.meraya.grouper.database.entity.Group;
import ua.com.meraya.grouper.database.entity.User;
import ua.com.meraya.grouper.database.repository.UserRepository;
import ua.com.meraya.grouper.database.service.GroupService;
import ua.com.meraya.grouper.database.service.UniversityService;

import java.util.Map;

@Controller
@PreAuthorize("hasAuthority('TEACHER')")
public class GroupController {

    private final UniversityService universityService;
    private final GroupService groupService;
    private final UserRepository userRepository;

    public GroupController(UniversityService universityService, GroupService groupService, UserRepository userRepository) {
        this.universityService = universityService;
        this.groupService = groupService;
        this.userRepository = userRepository;
    }

    @PostMapping("/create")
    public String createGroup(
            @AuthenticationPrincipal User u,
            @RequestParam String name,
            @RequestParam String abbreviation,
            @RequestParam String university,
            Model model){
        User user = userRepository.findByUsername(u.getUsername());
        model.addAttribute("university", user.getUniversity());
        model.addAttribute("group", user.getGroup());
        model.addAttribute("teacher", user.isTeacher());
        model.addAttribute("message", "111");

        groupService.addGroup(name, abbreviation, user, university);


        return "redirect:/group/control";
    }

    @GetMapping("/group/control")
    public String groupControl(@AuthenticationPrincipal User u, Model model){
        User user = userRepository.findByUsername(u.getUsername());
        model.addAttribute("university", user.getUniversity());
        model.addAttribute("group", user.getGroup());
        model.addAttribute("teacher", user.isTeacher());
        if (user.getGroup() != null) {
            if (!user.getGroup().getStudents().isEmpty()) {
                model.addAttribute("users", user.getGroup().getStudents());
            }
            model.addAttribute("countUsers", String.valueOf(user.getGroup().getStudents().size()));
            model.addAttribute("countStat", String.valueOf(user.getGroup().getStatements().size()));
            if (!user.getGroup().getStatements().isEmpty()) {
                model.addAttribute("statements", user.getGroup().getStatements());
            }
        }

        return "groupControl";
    }

    @GetMapping("group/{user}")
    public String acceptState(@PathVariable User user,
                              @AuthenticationPrincipal User o){
        User owner = userRepository.findByUsername(o.getUsername());
        System.out.println(owner.getUsername());
        System.out.println(owner.getGroup().getName());

        System.out.println("===========================");
        System.out.println(user.getUsername());


        Group group = owner.getGroup();
        groupService.deleteStutUserIntoGroup(group, user);
        groupService.addUserIntoGroup(group, user);
        return "redirect:/group/control";
    }
    }

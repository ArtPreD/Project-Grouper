package ua.com.meraya.grouper.controller;

import jdk.nashorn.internal.objects.annotations.Getter;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ua.com.meraya.grouper.database.entity.Group;
import ua.com.meraya.grouper.database.entity.User;
import ua.com.meraya.grouper.database.service.GroupService;
import ua.com.meraya.grouper.database.service.UniversityService;

import java.util.Map;

@Controller
public class GroupController {

    private final UniversityService universityService;
    private final GroupService groupService;

    public GroupController(UniversityService universityService, GroupService groupService) {
        this.universityService = universityService;
        this.groupService = groupService;
    }

    @GetMapping("/group/create")
    public String createGroup(Model model, @AuthenticationPrincipal User user){
        model.addAttribute("university", user.getUniversity());
        model.addAttribute("teacher", user.getGroup());
        return "create";
    }

    @PostMapping("/create")
    public String createGroup(
            @AuthenticationPrincipal User user,
            @RequestParam String name,
            @RequestParam String abbreviation,
            @RequestParam String university,
            Model model){
        model.addAttribute("university", user.getUniversity());
        model.addAttribute("message", "111");

            groupService.addGroup(name, abbreviation, user, university);


            return "redirect:/group/control";
    }

    @GetMapping("/group/control")
    public String groupControl(@AuthenticationPrincipal User user, Model model){
        model.addAttribute("university", user.getUniversity());
        model.addAttribute("teacher", user.getGroup());
        return "groupControl";
    }
    }

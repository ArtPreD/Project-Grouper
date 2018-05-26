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
import ua.com.meraya.grouper.database.service.UniversityService;
import ua.com.meraya.grouper.database.service.UserService;

import java.util.Collections;

@Controller
@RequestMapping("/user")
public class UserController {

    private final UserService userService;
    private final UniversityService universityService;
    private final UserRepository userRepository;

    public UserController(UserService userService, UniversityService universityService, UserRepository userRepository) {
        this.userService = userService;
        this.universityService = universityService;
        this.userRepository = userRepository;
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
        model.addAttribute("teacher", user.getGroup());

        return "profile";
    }

    @PostMapping("/profile")
    public String updateProfile(
            @AuthenticationPrincipal User u,
            @RequestParam String password,
            @RequestParam String email,
            @RequestParam String university
    ){
        User user = userRepository.findByUsername(u.getUsername());
        if (user.getUniversity() == null){
            userService.updateProfile(user, password, email, university);
        }else {
            universityService.deleteUserFromUniversity(user);
            userService.updateProfile(user, password, email, university);
        }

        return "redirect:/user/profile";
    }
}

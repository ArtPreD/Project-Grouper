package ua.com.meraya.grouper.controller;

import  org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.com.meraya.grouper.database.entity.University;
import ua.com.meraya.grouper.database.entity.User;
import ua.com.meraya.grouper.database.entity.enums.UserRole;
import ua.com.meraya.grouper.database.service.UniversityService;
import ua.com.meraya.grouper.database.service.UserService;

import java.util.Comparator;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/data")
public class DataController {

    @Autowired
    private UserService userService;

    @Autowired
    private UniversityService universityService;

    private int swith = 0;

    @PreAuthorize("hasAuthority('SUPERUSER')")
    @GetMapping
    public String userList(Model model){
        switch (swith){
            case 0:
                model.addAttribute("select", "users");
                List<User> users = userService.findAll();
                users.sort(new Comparator<User>() {
                    @Override
                    public int compare(User o1, User o2) {
                        return (int) (o1.getId() - o2.getId());
                    }
                });
                model.addAttribute("users", users);
                break;
            case 1:
                model.addAttribute("select", "university");
                List<University> universities = universityService.findAll();
                universities.sort(new Comparator<University>() {
                    @Override
                    public int compare(University o1, University o2) {
                        return (int) (o1.getId() - o2.getId());
                    }
                });
                model.addAttribute("universities", universities);
                break;
            case 2:
                model.addAttribute("select", "group");
                break;
        }


        return "dataList";
    }

    @PreAuthorize("hasAuthority('SUPERUSER')")
    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model){
        model.addAttribute("user", user);
        model.addAttribute("roles", UserRole.values());
        return "editUser";
    }

    @PreAuthorize("hasAuthority('SUPERUSER')")
    @PostMapping()
    public String userSave(
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("UserID") User user){

        userService.saveUser(user, username, form);
        return "redirect:/data";
    }

    @PreAuthorize("hasAuthority('SUPERUSER')")
    @GetMapping("user")
    public String getUsers(){
        swith = 0;
        return "redirect:/data";
    }

    @PreAuthorize("hasAuthority('SUPERUSER')")
    @GetMapping("university")
    public String getUniversity(){
        swith = 1;
        return "redirect:/data";
    }

    @PreAuthorize("hasAuthority('SUPERUSER')")
    @GetMapping("group")
    public String getGroup(){
        swith = 2;
        return "redirect:/data";
    }
}

package uz.pdp.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import uz.pdp.entity.User;
import uz.pdp.exception.DataAlreadyExistsException;
import uz.pdp.service.UserService;

@Controller
@RequestMapping("/user-profile")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping()
    public String myProfile() {
        return "my-profile";
    }

    @PostMapping()
    public String update(@ModelAttribute User user, Model model, HttpSession session) {
        try {
            user.setId(((User) session.getAttribute("user")).getId());
            User res = userService.updateUser(user);
            model.addAttribute("user", res);
        } catch (Exception e) {
            model.addAttribute("message", e.getMessage());
            return "my-profile";
        }
        model.addAttribute("message", "User updated successfully");
        return "my-profile";
    }

    @RequestMapping("/back-patient-page")
    public String backPatientPage() {
        return "patient-page";
    }
}


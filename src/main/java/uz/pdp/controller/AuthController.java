package uz.pdp.controller;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import uz.pdp.entity.User;

import uz.pdp.service.UserService;
import uz.pdp.service.VerificationService;

@Controller
@AllArgsConstructor
public class AuthController {
    @Autowired
    private final VerificationService verificationService;
    private UserService userService;

    @RequestMapping("/register")
    public String registerPage() {
        return "register";
    }

//    @RequestMapping(value = "/register", method = RequestMethod.POST)
//    public String register(User user, Model model) {
//        userService.save(user);
//        return "index";
//   }

    @RequestMapping("/register")
    public String sendCode(@RequestParam("email") String email, Model model) {
        try {
            verificationService.sendVerificationCode(email);

            model.addAttribute("message", "Enter verification code");
        } catch (RuntimeException e) {
            model.addAttribute("error", e.getMessage() + " " + email);
        }

        return "register";

    }


}

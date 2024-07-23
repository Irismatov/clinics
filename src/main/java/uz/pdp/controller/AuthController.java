package uz.pdp.controller;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import uz.pdp.DTO.LoginDTO;
import uz.pdp.entity.User;
import uz.pdp.enumerators.UserRole;
import uz.pdp.service.UserService;

import java.time.LocalDateTime;
import java.util.Objects;

@Controller
@RequestMapping("/auth")
//@Setter
@AllArgsConstructor
public class AuthController {

    @Autowired
    private final UserService userService;

    @RequestMapping("/login")
    public String loginPage() {
///      userService.test();
        return "login";
    }

    @RequestMapping("/register")
    public String registerPage() {
        return "register";
    }



    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@ModelAttribute LoginDTO loginDto, HttpSession session) {
        User userEntity = userService.signIn(loginDto.username(), loginDto.password());
        session.setAttribute("user", userEntity);
        if (userEntity.getRole() == UserRole.PATIENT) {
            return "patient-page";
        }else if (userEntity.getRole() == UserRole.MAIN_DOCTOR) {
            return "admin-page";
        }else if(Objects.nonNull(userEntity.getRole())) {
            return "doctor-page";
        }
        return "login";
    }


    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String Register(@ModelAttribute User userEntity, HttpSession session) {
        // sign in logica
        User user = userService.save(userEntity);
        session.setAttribute("userId", user.getId());
        return "login";
    }


    @PostMapping("/create-doctors")
    public String create(@ModelAttribute User userEntity, Model model , HttpSession session) {
        userEntity.setCreatedAt(LocalDateTime.now());
        userEntity.setUpdatedAt(LocalDateTime.now());
        userService.save(userEntity);
        model.addAttribute("users", userService.getAllDoctors());
        return "admin-page";
    }

}

package uz.pdp.controller;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import uz.pdp.DTO.LoginDTO;
import uz.pdp.entity.User;
import uz.pdp.entity.UserEntity;
import uz.pdp.service.UserService;

import java.util.Objects;

@Controller
@RequestMapping("/auth")
//@Setter
@AllArgsConstructor
public class AuthController {


    private final UserService userService;

    @RequestMapping("/login")
    public String loginPage() {
//        userService.test();
        return "login";
    }

    @RequestMapping("/register")
    public String registerPage() {
        return "register";
    }



    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@ModelAttribute LoginDTO loginDto, HttpSession session) {
//        UserEntity userEntity = userService.signIn(loginDto.username(), loginDto.password());
//        session.setAttribute("user", userEntity);
//        if (Objects.equals(userEntity.getRole(),"USER")) {
//            return "event-page";
//        }else if (Objects.equals(userEntity.getRole(),"ORGANIZER")) {
//            return "organizationMenu";
//        }
        return "login";
    }


    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String Register(@ModelAttribute User userEntity, HttpSession session) {
        // sign in logica
        User user = userService.save(userEntity);
        session.setAttribute("userId", user.getId());
        return "login";
    }

}

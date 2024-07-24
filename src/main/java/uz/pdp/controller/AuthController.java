package uz.pdp.controller;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import uz.pdp.DTO.LoginDTO;
import uz.pdp.entity.User;
import uz.pdp.enumerators.UserRole;
import uz.pdp.exception.DataAlreadyExistsException;
import uz.pdp.exception.InvalidInputException;
import uz.pdp.service.UserService;

import java.time.LocalDateTime;
import java.util.Objects;
import java.util.UUID;

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
    public String login(@ModelAttribute LoginDTO loginDto, HttpSession session , Model model) {
        User userEntity = userService.signIn(loginDto.username(), loginDto.password());
        session.setAttribute("user", userEntity);
        if (userEntity.getRole() == UserRole.PATIENT) {
            return "patient-page";
        }else if (userEntity.getRole() == UserRole.MAIN_DOCTOR) {
            model.addAttribute("users", userService.getAllDoctors());
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

    @GetMapping("create" )
    public String create(Model model) {
        model.addAttribute("users", userService.getAllDoctors());
        return "auth/create";
    }

    @RequestMapping("/delete-doctor")
    public String delete(@RequestParam(name = "userId") UUID userId, Model model) {
        userService.delete(userId);
        model.addAttribute("users", userService.getAllDoctors());
        return "admin-page";
   }

    @RequestMapping(value = "/update-doctor", method = RequestMethod.POST)
    public String update(@RequestParam(name = "userId") UUID userID , @ModelAttribute User updatedUser, Model model) {
        updatedUser.setId(userID);
        userService.update(updatedUser);
        model.addAttribute("message", "Doctor updated successfully");
        model.addAttribute("users", userService.getAllDoctors());
        return "admin-page";
    }





}

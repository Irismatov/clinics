package uz.pdp.controller;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import uz.pdp.DTO.LoginDTO;
import uz.pdp.DTO.RegisterDTO;
import uz.pdp.entity.User;
import uz.pdp.enumerators.UserRole;
import uz.pdp.service.UserService;
import uz.pdp.service.VerificationService;

import java.time.LocalDateTime;
import java.util.UUID;

@Controller
@RequestMapping("/auth")
//@Setter
@AllArgsConstructor
public class AuthController {

    @Autowired
    private final UserService userService;

    @Autowired
    private final VerificationService verificationService;

    @RequestMapping("/login")
    public String loginPage() {
///      userService.test();
        return "login";
    }

    @RequestMapping("/register")
    public String registerPage() {
        return "register";
    }

    @RequestMapping("/balance")
    public String balancePage(Model model, HttpSession session) {
        User user = (User)session.getAttribute("user");
        model.addAttribute("user", user);
        model.addAttribute("balance", user.getBalance());
        return "balance";
    }

    @RequestMapping("/back-balance")
    public String backBalancePage(Model model, HttpSession session) {
        User user = (User)session.getAttribute("user");
        model.addAttribute("user", user);
        model.addAttribute("balance", user.getBalance());
        return "patient-page";
    }


    @PostMapping("add-balance")
    public String addBalance(@RequestParam(name = "amount") double amount, Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        if(amount <= 0){
            model.addAttribute("message", "Amount must be greater than 0");
            model.addAttribute("balance", user.getBalance());
            return "balance";
        }

        user.setBalance(user.getBalance() + amount);
        userService.update(user);
        model.addAttribute("balance", user.getBalance());
        return "balance";
    }




    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@ModelAttribute LoginDTO loginDto, HttpSession session, Model model) {
        User userEntity = userService.signIn(loginDto.username(), loginDto.password());
        session.setAttribute("user", userEntity);
        if (userEntity.getRole() == UserRole.PATIENT) {
            return "patient-page";
        }else if (userEntity.getRole() == UserRole.MAIN_DOCTOR) {
            model.addAttribute("users", userService.getAllDoctors());
            return "admin-page";
        }else if(userEntity.getRole() == UserRole.ADMINISTRATOR){
            return "patient-page";
        } else if(userEntity.getRole() != null) {
            return "doctor-page";
        }
        model.addAttribute("error", "Username or password incorrect");
        return "login";
    }


    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String Register(@ModelAttribute RegisterDTO registerDTO, Model model, HttpSession session) {
        if (userService.checkMail(registerDTO.getEmail(), registerDTO.getUsername())) {
            model.addAttribute("message", "This email address or username is already in use!");
            return "register";
        }
        User user = User.builder()
                .age(registerDTO.getAge())
                .address(registerDTO.getAddress())
                .email(registerDTO.getEmail())
                .role(UserRole.PATIENT)
                .gender(registerDTO.getGender())
                .lastname(registerDTO.getLastname())
                .firstname(registerDTO.getFirstname())
                .phoneNumber(registerDTO.getPhoneNumber())
                .password(registerDTO.getPassword())
                .username(registerDTO.getUsername())
                .build();

       // User user = userService.registerDto(registerDTO);

        String code = verificationService.sendVerificationCode(registerDTO.getEmail());


        session.setAttribute("user", registerDTO);
        session.setAttribute("code", code);
        return "registration-code";
    }

    @PostMapping("/registration-code")
    public String registrationCode(@ModelAttribute RegisterDTO registerDTO, Model model, HttpSession session) {
         String code = (String) session.getAttribute("code");
        RegisterDTO user = (RegisterDTO) session.getAttribute("user");
        if (code.equals(registerDTO.getCode())) {
            userService.registerDto(user);
            return "index";
        }
        model.addAttribute("message", "Invalid code");
        return "registration-code";

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

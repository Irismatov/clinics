package uz.pdp.controller;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import uz.pdp.DTO.PatientAppointmentDTO;
import uz.pdp.entity.User;
import uz.pdp.service.AppointmentService;
import uz.pdp.service.UserService;

import java.util.*;

@Controller
public class TestController {

    private final AppointmentService appointmentService;
    private final UserService userService;

    @Autowired
    public TestController(AppointmentService appointmentService, UserService userService) {
        this.appointmentService = appointmentService;
        this.userService = userService;
    }

    @RequestMapping("/test")
    public String test(Model model, HttpSession session) throws JsonProcessingException {
        User user = userService.findById(UUID.fromString("306de677-c762-41fc-b058-a1777786d476"));
        List<PatientAppointmentDTO> data = appointmentService.getPatientAppointmentDTOs(user.getId());
        model.addAttribute("data", data);
        return "test";
    }
}

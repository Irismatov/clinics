package uz.pdp.controller;

import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import uz.pdp.entity.Appointment;
import uz.pdp.entity.User;
import uz.pdp.service.AppointmentService;
import uz.pdp.service.UserService;

import java.util.List;

@AllArgsConstructor
@Controller
@RequestMapping("/accepted-requests")
public class DiagnoseController {

    @Autowired
    private final AppointmentService service;

    @Autowired
    private final UserService userService;


    @RequestMapping("/show")
    public String showAcceptedRequestsPage(Model model, HttpSession session) {
        List<Appointment> appointments = service
                .findAcceptedAppointmentsByDoctor((User) session.getAttribute("user"));
        model.addAttribute("appointments", appointments);
        return "accepted-requests";
    }

    @RequestMapping(value = "/show", method = RequestMethod.POST)
    public String showAcceptedRequests(Model model, HttpSession session) {
        List<Appointment> appointments = service
                .findAcceptedAppointmentsByDoctor((User) session.getAttribute("user"));
        model.addAttribute("appointments", appointments);
        return "accepted-requests";
    }


    @RequestMapping("/selected-appointment")
    public String showSelectedAppointmentPage(@RequestParam("appointment") Appointment selectedAppointment, Model model, HttpSession session) {
        model.addAttribute("appointment", selectedAppointment);
        return "selected-appointment-page";
    }

    @RequestMapping(value = "/selected-appointment", method = RequestMethod.POST)
    public String showSelectedAppointment(@RequestParam("appointment") Appointment selectedAppointment,Model model, HttpSession session) {
        model.addAttribute("appointment", selectedAppointment);
        return "selected-appointment-page";
    }

}

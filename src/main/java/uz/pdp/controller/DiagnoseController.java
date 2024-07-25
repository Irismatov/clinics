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

import java.time.ZoneId;
import java.util.*;

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
        List<Map<String, Object>> formattedAppointments = new ArrayList<>();

        for (Appointment appointment : appointments) {
            Map<String, Object> appointmentData = new HashMap<>();
            appointmentData.put("patientFirstname", appointment.getPatient().getFirstname());
            appointmentData.put("patientLastname", appointment.getPatient().getLastname());
            appointmentData.put("startTime", Date.from(appointment.getStartTime().atZone(ZoneId.systemDefault()).toInstant()));
            appointmentData.put("endTime", Date.from(appointment.getEndTime().atZone(ZoneId.systemDefault()).toInstant()));
            appointmentData.put("id", appointment.getId()); // Если понадобится id для формы
            formattedAppointments.add(appointmentData);
        }

        model.addAttribute("appointments", formattedAppointments);
        return "accepted-requests";
    }

    @RequestMapping(value = "/show", method = RequestMethod.POST)
    public String showAcceptedRequests(Model model, HttpSession session) {
        List<Appointment> appointments = service.findAcceptedAppointmentsByDoctor((User) session.getAttribute("user"));
        List<Map<String, Object>> formattedAppointments = new ArrayList<>();

        for (Appointment appointment : appointments) {
            Map<String, Object> appointmentData = new HashMap<>();
            appointmentData.put("patientFirstname", appointment.getPatient().getFirstname());
            appointmentData.put("patientLastname", appointment.getPatient().getLastname());
            appointmentData.put("startTime", Date.from(appointment.getStartTime().atZone(ZoneId.systemDefault()).toInstant()));
            appointmentData.put("endTime", Date.from(appointment.getEndTime().atZone(ZoneId.systemDefault()).toInstant()));
            formattedAppointments.add(appointmentData);
        }
        model.addAttribute("appointments", formattedAppointments);
        return "accepted-requests";
    }



    @RequestMapping("/selected-appointment")
    public String showSelectedAppointmentPage(@RequestParam("appointmentId") UUID selectedAppointmentId, Model model, HttpSession session) {
        Appointment byId = service.findById(selectedAppointmentId);
        model.addAttribute("appointment", byId);
        return "selected-appointment-page";
    }


    @RequestMapping(value = "/selected-appointment", method = RequestMethod.POST)
    public String showSelectedAppointment(@RequestParam("appointmentId") UUID selectedAppointmentId,Model model, HttpSession session) {
        Appointment byId = service.findById(selectedAppointmentId);
        model.addAttribute("appointment", byId);
        return "selected-appointment-page";
    }

}

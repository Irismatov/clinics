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

import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@Controller
@RequestMapping("/appointment")
public class AppointmentController {

    @Autowired
private final AppointmentService service;

    @Autowired
    private final UserService userService;

    @RequestMapping("/show")
    public String showPage(Model model, HttpSession session) {
        List<Appointment> all = service.getUserAppointments((User) session.getAttribute("user"));
        if (all.isEmpty()) {
            model.addAttribute("message", "Нет записей");
        } else {
            model.addAttribute("appointments", all);
        }
        return "appointment-page";
    }

    @RequestMapping(value = "/show", method = RequestMethod.POST)
    public String showUserAppointments(HttpSession session, Model model) {
        List<Appointment> all = service.getUserAppointments((User) session.getAttribute("user"));
        if(!all.isEmpty()) {
            model.addAttribute("appointments", all);
        } else {
            model.addAttribute("message", "no appointments found");
        }
        return "appointment-page";
    }

    @RequestMapping("/choose-specialties")
     public String chooseSpecialtiesPage() {
        return "doctor-specialties";
    }

    @RequestMapping(name = "/doctors", method = RequestMethod.POST)
    public String getDoctorsBySpecialties(@RequestParam("specialty") String specialty, Model model) {
        List<User> doctors = userService.getAllDoctorsBySpecialty(specialty);
        model.addAttribute("doctors", doctors);
        return "doctor-specialties";
    }

    @RequestMapping("/doctors")
    public String chooseDoctor(@RequestParam("specialty") String specialty, Model model) {
        List<User> doctors = userService.getAllDoctorsBySpecialty(specialty);
        model.addAttribute("doctors", doctors);
    return "doctor-specialties";
    }

    @RequestMapping("/create")
    public String firstCreateMenuPage() {
        return "create-appointment";
    }

  /*  @RequestMapping(value = "/create", method = RequestMethod.POST)
   public String getAllDoctors(){
        return "create-appointment";
    }*/


}

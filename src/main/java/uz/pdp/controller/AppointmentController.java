package uz.pdp.controller;

import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import uz.pdp.DTO.AppointmentRequestDTO;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.*;
import uz.pdp.entity.Appointment;
import uz.pdp.entity.TimeSlot;
import uz.pdp.entity.User;
import uz.pdp.enumerators.AppointmentStatus;
import uz.pdp.repository.UserRepository;
import uz.pdp.service.AppointmentService;
import uz.pdp.service.MessageService;
import uz.pdp.service.UserService;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@AllArgsConstructor
@Controller
@RequestMapping("/appointment")
public class AppointmentController {

    @Autowired
    private final AppointmentService service;

    @Autowired
    private final UserService userService;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private AppointmentService appointmentService;
    @Autowired
    private MessageService messageService;

//    @GetMapping()
//    public String appointment(Model model) {
//
//    }



    @RequestMapping("/show")
    public String showPage(Model model, HttpSession session) {
        List<Appointment> all = service.getUserAppointments((User) session.getAttribute("user"));
        if (all.isEmpty()) {
            model.addAttribute("message", "no appointments found");
        } else {
            model.addAttribute("appointments", all);
        }
        return "appointment-page";
    }

    @RequestMapping(value = "/show", method = RequestMethod.POST)
    public String showUserAppointments(HttpSession session, Model model) {
        List<Appointment> all = service.getUserAppointments((User) session.getAttribute("user"));
        if (!all.isEmpty()) {
            model.addAttribute("appointments", all);
        } else {
            model.addAttribute("message", "no appointments found");
        }
        return "appointmen-page";
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

    @RequestMapping(value = "/select-doctor", method = RequestMethod.POST)
    public String showAvailableDays(@RequestParam("doctorId") UUID id, Model model, HttpSession session) {
        List<LocalDate> next7Days = IntStream.range(0, 7)
                .mapToObj(i -> LocalDate.now().plusDays(i))
                .collect(Collectors.toList());
        session.setAttribute("doctorId", id);
        model.addAttribute("doctorId", id);
        model.addAttribute("days", next7Days);
        return "available-days";
    }


    @RequestMapping("/select-doctor")
    public String showTimeTablePage() {
        return "available-days";
    }



    @RequestMapping("select-day")
    public String showTimeSlotsPage(@RequestParam("doctorId") UUID doctorId, @RequestParam("date") LocalDate date, Model model, HttpSession session) {
        List<TimeSlot> timeSlots = service.getAvailableTimeSlots(doctorId, date);
        session.setAttribute("date", date);
        model.addAttribute("timeSlots", timeSlots);
        model.addAttribute("selectedDate", date);
        return "available-time-slots";
    }


    @RequestMapping(value = "/select-day", method = RequestMethod.POST)
    public String showTimeSlots(@RequestParam("doctorId") UUID doctorId, @RequestParam("date") LocalDate date, Model model) {
        List<TimeSlot> timeSlots = service.getAvailableTimeSlots(doctorId, date);
        model.addAttribute("timeSlots", timeSlots);
        model.addAttribute("selectedDate", date);
        return "available-time-slots";
    }


    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createAppointment(@RequestParam("start") String startStr, @RequestParam("end") String endStr,
                                    HttpSession session , Model model) {

        User doctor = userService.findById((UUID) session.getAttribute("doctorId"));
        LocalDate date = (LocalDate) session.getAttribute("date");

        User user = (User) session.getAttribute("user");

        if(user.getBalance() < 0){
            model.addAttribute("message", "you have not enough balance");
            return "balance";
        }

        user.setBalance(user.getBalance() - 10000);
        userService.update(user);
        if(user.getBalance() < 0){
            model.addAttribute("message", "you have not enough money");
            return "balance";
        }

        LocalTime start = LocalTime.parse(startStr);
        LocalTime end = LocalTime.parse(endStr);

        LocalDateTime startTime = LocalDateTime.of(date, start);
        LocalDateTime endTime = LocalDateTime.of(date, end);

        service.save(Appointment.builder()
                .doctor(doctor)
                .patient((User) session.getAttribute("user"))
                .endTime(endTime)
                .startTime(startTime)
                .status(AppointmentStatus.BOOKED)
                .build());

        return "doctor-specialties";
    }


    @RequestMapping(value = "/requests")
    public String showRequests(HttpSession session, Model model) {
        User doctor = (User) session.getAttribute("user");
        List<AppointmentRequestDTO> appointmentRequests = appointmentService.findAppointmentRequests(doctor.getId());
        model.addAttribute("appointmentRequests", appointmentRequests);
        return "doctor-appointment-requests";
    }

    @RequestMapping(value = "/requests", method = RequestMethod.POST)
    public String updateAppointment(@RequestParam("appointment_id") UUID appointmentRequestId, @RequestParam("action") String action, @RequestParam(value = "reason", required = false) String reason ,Model model, HttpSession session) {
        User doctor = (User) session.getAttribute("user");
        if (action.equals("1")) {
            appointmentService.updateAppointmentRequest(appointmentRequestId, true);
        } else {
            messageService.save(doctor.getId(), appointmentService.findById(appointmentRequestId).getPatient().getId(), reason);
        }
        List<AppointmentRequestDTO> appointmentRequests = appointmentService.findAppointmentRequests(doctor.getId());
        model.addAttribute("appointmentRequests", appointmentRequests);
        return "doctor-appointment-requests";
    }
}

package uz.pdp.service;

import org.springframework.stereotype.Service;
import uz.pdp.entity.Appointment;
import uz.pdp.entity.TimeSlot;
import uz.pdp.entity.User;
import uz.pdp.repository.AppointmentRepository;
import uz.pdp.repository.UserRepository;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class AppointmentService extends BaseService<Appointment, AppointmentRepository>{

    public AppointmentService(AppointmentRepository appointmentRepository) {
        repository = appointmentRepository;
    }

    public List<Appointment> getUserAppointments(User patient) {
        return repository.getAllUserAppointments(patient.getId());
    }

    public List<TimeSlot> getAvailableTimeSlots(UUID doctorId, LocalDate date) {
        List<Appointment> appointments = repository.findByDoctorIdAndDate(doctorId, date);

        LocalTime startOfDay = LocalTime.of(9, 0);
        LocalTime endOfDay = LocalTime.of(17, 0);
        int intervalMinutes = 30;
        int breakMinutes = 20;

        List<TimeSlot> allTimeSlots = createTimeSlots(startOfDay, endOfDay, intervalMinutes, breakMinutes);

        for (Appointment appointment : appointments) {
            LocalTime startTime = appointment.getStartTime().toLocalTime();
            LocalTime endTime = appointment.getEndTime().toLocalTime();
            for (TimeSlot timeSlot : allTimeSlots) {
                if (timeSlot.overlapsWith(startTime, endTime)) {
                    timeSlot.setAvailable(false);
                }
            }

        }
        return allTimeSlots;
        }



    public List<Appointment> findAppointmentsByUser(UUID userId) {
        return repository.findAppointmentsByUser(userId);
    }


    private List<TimeSlot> createTimeSlots(LocalTime start, LocalTime end, int intervalMinutes, int breakMinutes) {
        List<TimeSlot> timeSlots = new ArrayList<>();
        LocalTime current = start;
        int intervalsBeforeBreak = 2;

        while (current.isBefore(end)) {
            for (int i = 0; i < intervalsBeforeBreak && current.isBefore(end); i++) {
                LocalTime endTime = current.plusMinutes(intervalMinutes);
                if (endTime.isAfter(end)) {
                    break;
                }
                timeSlots.add(new TimeSlot(current, endTime));
                current = endTime;
            }
            current = current.plusMinutes(breakMinutes);
        }
        return timeSlots;
    }

}

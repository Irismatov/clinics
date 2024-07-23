package uz.pdp.service;

import org.springframework.stereotype.Service;
import uz.pdp.entity.Appointment;
import uz.pdp.entity.TimeSlot;
import uz.pdp.entity.User;
import uz.pdp.repository.AppointmentRepository;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class AppointmentService extends BaseService<Appointment, AppointmentRepository> {

    public List<Appointment> getUserAppointments(User patient) {
        return repository.getAllUserAppointments(patient.getId());
    }

    public List<TimeSlot> getAvailableTimeSlots(UUID doctorId) {
        List<Appointment> appointments = repository.findByDoctorIdAndDate(doctorId, LocalDate.now());

        LocalTime startOfDay = LocalTime.of(9, 0); // рабочий день начинается с 9:00
        LocalTime endOfDay = LocalTime.of(17, 0); // рабочий день заканчивается в 17:00

        List<TimeSlot> allTimeSlots = createTimeSlots(startOfDay, endOfDay, 30); // 30-минутные интервалы

        for (Appointment appointment : appointments) {
            LocalTime startTime = appointment.getStartTime().toLocalTime();
            LocalTime endTime = appointment.getEndTime().toLocalTime();
            allTimeSlots.removeIf(slot -> slot.overlapsWith(startTime, endTime));
        }

        return allTimeSlots;
    }

    private List<TimeSlot> createTimeSlots(LocalTime start, LocalTime end, int intervalMinutes) {
        List<TimeSlot> timeSlots = new ArrayList<>();
        LocalTime current = start;
        while (current.isBefore(end)) {
            timeSlots.add(new TimeSlot(current, current.plusMinutes(intervalMinutes)));
            current = current.plusMinutes(intervalMinutes);
        }
        return timeSlots;
    }
}

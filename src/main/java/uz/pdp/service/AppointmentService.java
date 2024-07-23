package uz.pdp.service;

import org.springframework.stereotype.Service;
import uz.pdp.entity.Appointment;
import uz.pdp.repository.AppointmentRepository;

import java.util.List;
import java.util.UUID;

@Service
public class AppointmentService extends BaseService<Appointment, AppointmentRepository> {

    public AppointmentService(AppointmentRepository appointmentRepository) {
        repository = appointmentRepository;
    }


    public List<Appointment> findAppointmentsByUser(UUID userId) {
        return repository.findAppointmentsByUser(userId);
    }


}

package uz.pdp.service;

import org.springframework.stereotype.Service;
import uz.pdp.entity.Appointment;
import uz.pdp.repository.AppointmentRepository;

@Service
public class AppointmentService extends BaseService <Appointment, AppointmentRepository> {

    public AppointmentService(AppointmentRepository appointmentRepository) {
        repository = appointmentRepository;
    }

}

package uz.pdp.service;

import uz.pdp.entity.Appointment;
import uz.pdp.entity.User;
import uz.pdp.repository.AppointmentRepository;

import java.util.List;
import java.util.UUID;

public class AppointmentService extends BaseService<Appointment, AppointmentRepository> {

    public List<Appointment> getUserAppointments(User patient) {
        return repository.getAllUserAppointments(patient.getId());
    }
}

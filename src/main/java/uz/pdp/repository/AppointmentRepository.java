package uz.pdp.repository;

import org.springframework.stereotype.Repository;
import uz.pdp.entity.Appointment;

@Repository
public class AppointmentRepository extends BaseRepository<Appointment> {
    public AppointmentRepository() {
        this.type = Appointment.class;
    }

}

package uz.pdp.repository;

import org.springframework.stereotype.Repository;
import uz.pdp.entity.Appointment;
import java.util.List;
import java.util.UUID;

@Repository
public class AppointmentRepository extends BaseRepository<Appointment> {
    public AppointmentRepository() {
        this.type = Appointment.class;
    }



    public List<Appointment> findAppointmentsByUser(UUID userId) {

        return entityManager.createQuery("from Appointment where patient.id = :userId", Appointment.class)
                .setParameter("userId", userId)
                .getResultList();
    }
}

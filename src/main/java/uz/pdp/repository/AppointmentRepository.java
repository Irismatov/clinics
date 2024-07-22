package uz.pdp.repository;

import jakarta.persistence.Query;
import org.springframework.stereotype.Repository;
import uz.pdp.entity.Appointment;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Repository
public class AppointmentRepository extends BaseRepository<Appointment>{


    public List<Appointment> getAll() {
        List<Appointment> appointments = new ArrayList<>();
        Query query = entityManager.createQuery("from Appointment");
        appointments = query.getResultList();
        return appointments;
    }

    public List<Appointment> getAllUserAppointments(UUID patientId) {
        Query query = entityManager.createQuery("SELECT a FROM Appointment a WHERE a.patient.id = :patient_id", Appointment.class);
        query.setParameter("patient_id", patientId);
        return query.getResultList();
    }

}

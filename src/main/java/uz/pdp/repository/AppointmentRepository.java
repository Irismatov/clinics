package uz.pdp.repository;

import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import org.springframework.stereotype.Repository;
import uz.pdp.entity.Appointment;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Repository
public class AppointmentRepository extends BaseRepository<Appointment> {


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

    public List<Appointment> findByDoctorIdAndDate(UUID doctorId, LocalDate date) {
        Query query = entityManager.createQuery
        ("SELECT a FROM Appointment a WHERE a.doctor.id = :doctor_id AND DATE(a.startTime) = :date", Appointment.class);
        query.setParameter("doctor_id", doctorId);
        query.setParameter("date", date);
        return query.getResultList();
    }
}

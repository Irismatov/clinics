package uz.pdp.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import org.springframework.stereotype.Repository;
import uz.pdp.entity.Appointment;
import uz.pdp.enumerators.AppointmentStatus;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;
import java.util.UUID;

@Repository
public class AppointmentRepository extends BaseRepository<Appointment> {
    public AppointmentRepository() {
        this.type = Appointment.class;
    }

    @PersistenceContext
    private EntityManager entityManager;

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
        Query query = entityManager.createQuery(
                "SELECT a FROM Appointment a WHERE a.doctor.id = :doctor_id AND DATE(a.startTime) = :date " +
                        "AND a.status NOT IN (:excludedStatuses)", Appointment.class);
        query.setParameter("doctor_id", doctorId);
        query.setParameter("date", date);
        query.setParameter("excludedStatuses", EnumSet.of(AppointmentStatus.CANCELLED));
        return query.getResultList();
    }

    public List<Appointment> findAppointmentsByUser(UUID userId) {
        return entityManager.createQuery("from Appointment where patient.id = :userId", Appointment.class)
                .setParameter("userId", userId)
                .getResultList();
    }

    public List<Appointment> findAcceptedAppointmentsByDoctor(UUID doctorId) {
        Query query = entityManager.createQuery("SELECT a FROM Appointment a WHERE a.doctor.id = :doctor_id" +
             //   " and a.status = :desired_status" +
                " and a.endTime >= :current_time", Appointment.class);
        query.setParameter("doctor_id", doctorId);
       // query.setParameter("desired_status", AppointmentStatus.ACCEPTED);
        query.setParameter("current_time", LocalDateTime.now());
        return query.getResultList();
    }

}

package uz.pdp.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import uz.pdp.entity.Appointment;

import java.util.ArrayList;
import java.util.List;

public class AppointmentRepository extends BaseRepository<Appointment>{


    public List<Appointment> getAll() {
        List<Appointment> appointments = new ArrayList<>();
        Query query = entityManager.createQuery("from Appointment");
        appointments = query.getResultList();
        return appointments;
    }

}

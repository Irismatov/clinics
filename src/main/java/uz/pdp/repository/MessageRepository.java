package uz.pdp.repository;

import org.springframework.stereotype.Repository;
import uz.pdp.entity.Message;

import java.util.UUID;

@Repository
public class MessageRepository extends BaseRepository<Message>{

    public Message findMessageByAppointmentId(UUID appointmentId) {
        try {
            return entityManager.createQuery("from Message where appointment.id = :appointmentId", Message.class)
                    .setParameter("appointmentId", appointmentId)
                    .getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}

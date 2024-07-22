package uz.pdp.repository;

import jakarta.persistence.Query;
import uz.pdp.entity.User;
import uz.pdp.enumerators.UserRole;

import java.util.List;

public class UserRepository extends BaseRepository<User> {

    public List<User> getAllDoctors(UserRole specialties) {
    Query query = entityManager.createQuery("select u from User u where u.role = : special", User.class);
        query.setParameter("special", specialties);
        return query.getResultList();
    }

}

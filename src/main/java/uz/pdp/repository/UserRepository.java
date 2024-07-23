package uz.pdp.repository;

import org.springframework.stereotype.Repository;
import uz.pdp.entity.User;

@Repository
public class UserRepository extends BaseRepository<User> {
    public UserRepository() {
        type = User.class;
    }

    public void checkMail(String mail) {
        entityManager.createQuery("from User where email = :mail", User.class)
                .setParameter("mail", mail)
                .getSingleResult();
    }
}

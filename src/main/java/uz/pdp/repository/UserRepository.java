package uz.pdp.repository;

import uz.pdp.entity.User;

import java.util.List;

public class UserRepository extends BaseRepository<User> {

    public List<User> getAllDoctors() {
    return entityManager.createQuery("select u from User u where role != 'PATIENT' ", User.class).getResultList();
    }

}

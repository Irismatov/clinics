package uz.pdp.service;
import org.springframework.stereotype.Service;
import uz.pdp.entity.User;
import uz.pdp.repository.UserRepository;

import java.util.List;


@Service
public class UserService extends BaseService<User, UserRepository>{


    public UserService(UserRepository userRepository) {
        repository = userRepository;
    }


    public void test(){
//        repository.test();
    }


    public User signIn(String username, String password) {
        return repository.signIn(username, password);
    }

    public List<User> getAllDoctors(){
        return repository.getDoctors();
    }

    public void checkMail(String email) {
        repository.checkMail(email);
    }
}

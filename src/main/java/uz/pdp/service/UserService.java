package uz.pdp.service;

import org.springframework.stereotype.Service;
import uz.pdp.entity.User;
import uz.pdp.repository.UserRepository;

@Service
public class UserService extends BaseService <User, UserRepository> {
    public UserService(UserRepository repository) {
        super(repository);
    }


    public void checkMail(String email) {
        repository.checkMail(email);
    }
}

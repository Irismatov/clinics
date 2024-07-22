package uz.pdp.service;
import uz.pdp.entity.User;
import uz.pdp.repository.UserRepository;

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
}

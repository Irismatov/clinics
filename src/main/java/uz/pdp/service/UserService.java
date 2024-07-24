package uz.pdp.service;
import org.springframework.stereotype.Service;
import uz.pdp.DTO.RegisterDTO;
import uz.pdp.entity.User;
import uz.pdp.enumerators.UserRole;
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


    public List<User> getAllDoctorsBySpecialty(String specialties) {
        return repository.getAllDoctors(UserRole.valueOf(specialties));
    }

    public boolean checkMail(String email, String username) {
        return repository.checkMail(email, username);
    }

    public User registerDto(RegisterDTO registerDTO) {
        User user = User.builder()
                .age(registerDTO.getAge())
                .address(registerDTO.getAddress())
                .email(registerDTO.getEmail())
                .role(UserRole.PATIENT)
                .gender(registerDTO.getGender())
                .lastname(registerDTO.getLastname())
                .firstname(registerDTO.getFirstname())
                .phoneNumber(registerDTO.getPhoneNumber())
                .password(registerDTO.getPassword())
                .username(registerDTO.getUsername())
                .build();
        save(user);
        return user;
    }

}

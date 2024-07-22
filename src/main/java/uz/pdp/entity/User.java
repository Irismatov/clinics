package uz.pdp.entity;


import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;
import uz.pdp.enumerators.UserRole;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
@Entity
@Table(name = "users")

public class User extends BaseEntity {
    private UserRole role;
    private String firstname;
    private String lastname;
    private String username;
    private String password;
    private String email;
    private Integer age;
    private String gender;
    private String phoneNumber;
    private String address;
}

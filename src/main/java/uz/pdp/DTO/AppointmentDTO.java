package uz.pdp.DTO;

import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import uz.pdp.entity.User;
import uz.pdp.enumerators.AppointState;
import uz.pdp.enumerators.AppointmentStatus;

import java.time.LocalDateTime;

public class AppointmentDTO {
    private String firstname;
    private String username;
    private String email;
    private String phone;
    private LocalDateTime startTime;
    private LocalDateTime endTime;
}

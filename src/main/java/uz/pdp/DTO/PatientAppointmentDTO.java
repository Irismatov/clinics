package uz.pdp.DTO;
import lombok.*;

import java.time.LocalDateTime;


@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
public class PatientAppointmentDTO {
    private String doctor_fio;
    private String img;
    private String doctor_specialty;
    private LocalDateTime appointment_start;
    private LocalDateTime appointment_end;
    private String status;
}

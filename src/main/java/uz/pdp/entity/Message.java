package uz.pdp.entity;


import jakarta.persistence.*;
import lombok.*;
import uz.pdp.enumerators.MessageState;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
@Entity
@Table(name = "messages")
public class Message extends BaseEntity {
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User patient;
    @ManyToOne
    @JoinColumn(name = "doctor_id")
    private User doctor;
    private String text;
    @Enumerated(EnumType.STRING)
    MessageState messageState;
}

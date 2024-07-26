package uz.pdp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import uz.pdp.entity.Message;
import uz.pdp.enumerators.MessageState;
import uz.pdp.repository.MessageRepository;

import java.util.UUID;


@Service
public class MessageService extends BaseService<Message, MessageRepository>{

    private final UserService userService;

    public MessageService(MessageRepository repository, UserService userService) {
        super(repository);
        this.userService = userService;
    }

    public Message save(UUID doctorId, UUID patientId, String text) {
        return save(
                Message.builder()
                        .doctor(userService.findById(doctorId))
                        .patient(userService.findById(patientId))
                        .messageState(MessageState.NEW)
                        .text(text)
                        .build()
        );
    }
}

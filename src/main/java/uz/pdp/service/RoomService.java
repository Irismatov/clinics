package uz.pdp.service;

import org.springframework.stereotype.Service;
import uz.pdp.entity.Room;
import uz.pdp.repository.RoomRepository;

import java.util.List;
@Service
public class RoomService extends BaseService<Room, RoomRepository> {
    public RoomService(RoomRepository roomRepository) {
        repository = roomRepository;
    }

    public List<Room> getAllRooms() {
        return repository.getAllRooms();
    }
}

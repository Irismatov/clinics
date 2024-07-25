package uz.pdp.service;

import uz.pdp.entity.Room;
import uz.pdp.repository.RoomRepository;

public class RoomService extends BaseService<Room, RoomRepository> {
    public RoomService(RoomRepository roomRepository) {
        repository = roomRepository;
    }
}

package uz.pdp.service;

import uz.pdp.entity.RoomOccupant;
import uz.pdp.repository.RoomOccupantRepository;

public class RoomOccupantService extends BaseService<RoomOccupant, RoomOccupantRepository> {

    public RoomOccupantService(RoomOccupantRepository roomOccupantRepository) {
        repository = roomOccupantRepository;
    }
}

package uz.pdp.repository;

import org.springframework.stereotype.Repository;
import uz.pdp.entity.Room;

@Repository
public class RoomRepository extends BaseRepository<Room> {
    public RoomRepository() {
        this.type = Room.class;
    }


}

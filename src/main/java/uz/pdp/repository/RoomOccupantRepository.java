package uz.pdp.repository;

import org.springframework.stereotype.Repository;
import uz.pdp.entity.RoomOccupant;

@Repository
public class RoomOccupantRepository extends BaseRepository<RoomOccupant> {

    public RoomOccupantRepository() {
        this.type = RoomOccupant.class;
    }
}

package uz.pdp.repository;

import org.springframework.stereotype.Repository;
import uz.pdp.entity.Prescription;

@Repository
public class PrescriptionRepository extends BaseRepository<Prescription> {
    public PrescriptionRepository() {
        this.type = Prescription.class;
    }

}

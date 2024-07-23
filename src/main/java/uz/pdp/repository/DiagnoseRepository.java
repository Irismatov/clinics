package uz.pdp.repository;

import org.springframework.stereotype.Repository;
import uz.pdp.entity.Diagnose;

@Repository
public class DiagnoseRepository extends BaseRepository<Diagnose> {
    public DiagnoseRepository() {
        this.type = Diagnose.class;
    }
}

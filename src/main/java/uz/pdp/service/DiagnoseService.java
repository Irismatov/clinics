package uz.pdp.service;

import org.springframework.stereotype.Service;
import uz.pdp.entity.Diagnose;
import uz.pdp.repository.DiagnoseRepository;

@Service
public class DiagnoseService extends BaseService <Diagnose, DiagnoseRepository> {

    public DiagnoseService(DiagnoseRepository diagnoseRepository) {
        repository = diagnoseRepository;
    }

}

package uz.pdp.service;

import org.springframework.stereotype.Service;
import uz.pdp.entity.Prescription;
import uz.pdp.repository.PrescriptionRepository;
@Service
public class PrescriptionService extends BaseService <Prescription, PrescriptionRepository> {

    public PrescriptionService(PrescriptionRepository prescriptionRepository) {
        repository = prescriptionRepository;
    }

}

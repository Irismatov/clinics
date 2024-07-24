package uz.pdp.util;

import com.itextpdf.io.font.constants.StandardFonts;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import uz.pdp.entity.Appointment;
import uz.pdp.entity.User;
import uz.pdp.service.AppointmentService;
import uz.pdp.service.DiagnoseService;
import uz.pdp.service.PrescriptionService;
import uz.pdp.service.UserService;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Component
public class Utils {
    private final UserService userService;
    private final AppointmentService appointmentService;
    private final DiagnoseService diagnoseService;
    private final PrescriptionService prescriptionService;

    @Autowired
    public Utils(UserService userService, AppointmentService appointmentService, DiagnoseService diagnoseService, PrescriptionService prescriptionService) {
        this.userService = userService;
        this.appointmentService = appointmentService;
        this.diagnoseService = diagnoseService;
        this.prescriptionService = prescriptionService;
    }

    public void createMedicalRecordForUser(UUID id) throws IOException {
        User patient = userService.findById(id);
        List<Appointment> appointments = appointmentService.findAppointmentsByUser(id);

        PdfWriter writer = new PdfWriter("files/" + patient.getFirstname() + " " + patient.getLastname() + ".pdf");
        PdfDocument pdf = new PdfDocument(writer);
        Document document = new Document(pdf);

        // Add title
        document.add(new Paragraph("Patient Diagnosis Details")
                .setFont(PdfFontFactory.createFont(StandardFonts.HELVETICA_BOLD))
                .setFontSize(20));

        // Add patient name
        document.add(new Paragraph("Patient Full Name: " + patient.getFirstname() + " " + patient.getLastname())
                .setFont(PdfFontFactory.createFont(StandardFonts.HELVETICA))
                .setFontSize(14));

        for (Appointment appointment : appointments) {
            document.add(new Paragraph("Appointment at: " + )
                    .setFont(PdfFontFactory.createFont(StandardFonts.HELVETICA))
                    .setFontSize(14));
        }



    }
}

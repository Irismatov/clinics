package uz.pdp.controller;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import uz.pdp.entity.Room;
import uz.pdp.service.RoomService;


@Controller
@AllArgsConstructor
@RequestMapping("/create-room")
public class RoomController {

    @Autowired
    private RoomService roomService;

    @GetMapping
    public String createRoom() {
        return "create-room";
    }

    @PostMapping
    public String createRoom(@ModelAttribute Room room, Model model ) {
        roomService.save(room);
        model.addAttribute("rooms", room);
        model.addAttribute("root", roomService.getAllRooms());
        return "create-room";
    }

    @RequestMapping("/back-administrator-page")
    public String backAdministratorPage() {
        return "administrator-page";
    }


    @GetMapping("/all-rooms")
    public String showRoom() {
        return "all-rooms";
    }

    @PostMapping("/all-rooms")
    public String allRooms(Model model, HttpSession session) {
        model.addAttribute("room", roomService.getAllRooms());
        session.setAttribute("room", roomService.getAllRooms());
        return "all-rooms";
    }


}

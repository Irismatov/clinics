package uz.pdp.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class TimeSlot {
    private LocalTime start;
    private LocalTime end;

    public boolean overlapsWith(LocalTime otherStart, LocalTime otherEnd) {
        return !(end.isBefore(otherStart) || start.isAfter(otherEnd));
    }

    @Override
    public String toString() {
        return start + " - "+ end;
    }

}

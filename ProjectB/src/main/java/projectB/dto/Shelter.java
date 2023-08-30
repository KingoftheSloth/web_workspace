package projectB.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Shelter {
    private Long careidx; // Assuming "careidx" is of type NUMBER in the database
    private String careTel;
    private String careAddr;
    private String careName;

    // Getter and Setter methods
}
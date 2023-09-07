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
public class adopt {
	
	private int adoptidx;
    private String aniid;
    private String userid;
    private String adoptdate;
    private String filename;
}



package dto;

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
public class Animal {

	private String desertionNo;
	private String kind;
	private String breed;
	private String neuterYn;
	private String weight;
	private String age;
	private String processState;
	private String happenDt;
	private String filename;

}
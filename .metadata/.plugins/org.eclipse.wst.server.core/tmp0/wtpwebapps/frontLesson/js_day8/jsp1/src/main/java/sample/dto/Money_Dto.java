package sample.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@ToString
@Getter
@Setter
@AllArgsConstructor
@Builder
public class Money_Dto {
		
	private int custno;
	private String custname;
	private String grade;
	private int total;
}

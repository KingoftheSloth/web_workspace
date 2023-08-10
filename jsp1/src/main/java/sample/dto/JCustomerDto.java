package sample.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@Builder
public class JCustomerDto {
private String custom_ID;
private String Name;
private String Email;
private int age;
private Date date;
private String password;



public JCustomerDto() {
	
}



}


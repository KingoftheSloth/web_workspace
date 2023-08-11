package sample.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class OrderDto {

	
private String email;
private String pcode;
private int quantity;
private Date  orderdate;
}

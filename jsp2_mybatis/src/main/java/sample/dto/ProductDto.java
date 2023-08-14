package sample.dto;

import java.sql.Date;
//@Date //haschode 재정의 필요할 떄

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString

public class ProductDto {
	private String pname;
	private int price;
	private Date createAt;
	private String picture;
}

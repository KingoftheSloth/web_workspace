package sample.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@AllArgsConstructor
@Builder
@ToString
public class MyPageBuy {

	private Date buy_date;
	private String	customid;
	private String pcode;
	private String pname;
	private int quantity;
	private int price;
	private long total;
	
}

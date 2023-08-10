package sample.dao;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Builder
@Getter
@AllArgsConstructor
@ToString
@Setter
public class JCustomer {
// DTO : Jbuy, JProduct
	
	private String custom_id;
	private String name;
	private String email;
	private int age;
	private Date regDate;
	private String password;
	public JCustomer() {};
	public String getCustom_id() { return custom_id; }
	public String getName() { return name; }
	public String getEmail() { return email; }
	public int getAge() { return age; }
	
}
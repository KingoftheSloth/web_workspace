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
public class Member_Dto {

int custNo; 
String custName;
String phone;
String address;
Date join_date;
String grade;
String city;

public Member_Dto() {}

}


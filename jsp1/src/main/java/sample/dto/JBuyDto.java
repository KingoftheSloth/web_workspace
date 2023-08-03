package sample.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Builder
@AllArgsConstructor
@ToString

public class JBuyDto {
private int Buy_seq;
private String CustomID;
private String Pcode;
private int quantity;
private Date Buy_date;

}

//필드 값이 모두 같으면 equals 로 true 이 되도록하고 싶다.
//-> equals와 hashcode를 재정의해야 합니다. (불변객체)
//=> VO 입니다. VO는 테스트 케이스에서 객체를 비교할 때 사용할 
// 수 있습니다.  assertEquals 비교.

package day1226;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * mybatis framework에서 조회되든 레코드가있을 때 기본생성자로 생성하고 
 * 1.기본생성자로 생성해주고
 * 2.조회되는ㄴ 컬럼명과 일치하는 settermethod를 호출하여값을설정
 * 3.jsp el에서 ${getter명}으로 사용
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class EmpDomain {
	private String ename;
	private int sal,comm;
	private Date hiredate;
	
	
}
//class

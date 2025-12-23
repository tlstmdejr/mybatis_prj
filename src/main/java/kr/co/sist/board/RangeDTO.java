package kr.co.sist.board;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class RangeDTO {
	private int startNum,endNum;
	private String field,keyword;
	private String fieldStr;//검색필드 값에 대응되는 컬럼명의 문자열
	private String url;
	private int currentPage=1;//이동할 url,현제페이지
	int totalPage=0;
	

	public String getFieldStr() {
		String[] fieldTitle= {"title","content","id"};
		int tempField=Integer.parseInt(field);
		if(!(tempField>0 && tempField<4)) {//1~3사이가 아닌경우
			tempField=1;
		}
		fieldStr=fieldTitle[Integer.parseInt(field)-1];
		return fieldStr;
	}

}
//class

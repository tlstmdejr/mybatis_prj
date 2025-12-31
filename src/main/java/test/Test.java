package test;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.DisplayName;

import day1226.EmpDTO;
import day1226.EmpDomain;
import day1226.SelectDAO2;
import day1229.SelectDAO3;
import day1229.SelectService3;
import day1231.MemberDTO;
import day1231.SelectDAO5;
import kr.co.sist.board.BoardDAO;
import kr.co.sist.board.RangeDTO;
import kr.co.sist.car.CarDAO;
import kr.co.sist.car.CarService;
import day1224.SelectService;

public class Test {

@org.junit.Test
@DisplayName("select 테스트")
public void test() {
//SelectService ss=SelectService.getInstance();
////assertNotNull(ss.scsr(10));
////assertNotNull(ss.scmr(10));
//SelectDAO sDAO=SelectDAO.getInstance();
////EmpDTO eDTO=sDAO.mcsr(7788);
//List<EmpDTO> list=sDAO.mcmr(10);
//System.out.println(list);
////assertNotNull(list);
//assertEquals(list.size(),3);
//day1226.EmpDTO eDTO=new day1226.EmpDTO();
//eDTO.setEmpno(7521);
//eDTO.setDeptno(30);
//
//CarService cs=CarService.getInstance();
//System.out.println(cs.searchMaker("국산"));
//System.out.println(cs.searchModel("현대"));
//CarDAO cDAO=CarDAO.getInstance();
//EmpDomain ed=sDAO.useDomain(eDTO);
//assertNotNull(ed);
	SelectDAO5 sd5=SelectDAO5.getInstance();
//	SelectService3 sc3=SelectService3.getInstance();
//	BoardDAO bDAO=BoardDAO.getInstance();
try {
	//assertNotNull(cDAO.selectMaker("수입"));
//	assertNotNull(cDAO.selectModel("현대"));
//	assertNotNull(cDAO.selectCar("K5"));
//	assertNotNull(sd3.dollar("cp_emp5"));
//	assertNotNull(sd3.dynamicIf(10));
//	assertNotNull(sc3.dynamicIf(10));
//	RangeDTO rDTO=new RangeDTO();
//	rDTO.setField("1");
//	rDTO.setKeyword("오늘은");
//	rDTO.setStartNum(1);	
//	rDTO.setEndNum(10);
	//assertNotNull(bDAO.selectBoardTotalCnt(rDTO));
//	assertNotNull(bDAO.selectRangeBoard(rDTO));
//	MemberDTO mDTO=new MemberDTO()	;
//	mDTO.setNum(65);
//	mDTO.setName("rkskek");
//	mDTO.setAge(25);
//	mDTO.setGender("남자");
//	mDTO.setTel("010-5555-5678");
	
//	sd5.insertMember(mDTO);
//	sd5.updateMember(mDTO);
//	sd5.deleteMember(mDTO);
//	int cnt=mDTO.getCnt();
//	assertSame(cnt, 1);
	HashMap<String, Object> map=new HashMap<String, Object>();
//	map.put("num", 64);
	
//	sd5.selectOneMember(map);
	sd5.selectAllMember(map);
	
	List<Map<String, Object>> data=(List<Map<String, Object>>)map.get("searchAllMember");
//	System.out.println(data.get(0).get("NAME"));
	System.out.println(data);
	assertNotNull(data);
}catch(Exception e) {
	e.printStackTrace();
}

}


}
package test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.jupiter.api.DisplayName;

import day1226.EmpDTO;
import day1226.EmpDomain;
import day1226.SelectDAO2;
import day1229.SelectDAO3;
import day1229.SelectService3;
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
///	SelectDAO3 sd3=SelectDAO3.getInstance();
//	SelectService3 sc3=SelectService3.getInstance();
	BoardDAO bDAO=BoardDAO.getInstance();
try {
	//assertNotNull(cDAO.selectMaker("수입"));
//	assertNotNull(cDAO.selectModel("현대"));
//	assertNotNull(cDAO.selectCar("K5"));
//	assertNotNull(sd3.dollar("cp_emp5"));
//	assertNotNull(sd3.dynamicIf(10));
//	assertNotNull(sc3.dynamicIf(10));
	RangeDTO rDTO=new RangeDTO();
//	rDTO.setField("1");
//	rDTO.setKeyword("오늘은");
	rDTO.setStartNum(1);	
	rDTO.setEndNum(10);
	//assertNotNull(bDAO.selectBoardTotalCnt(rDTO));
	assertNotNull(bDAO.selectRangeBoard(rDTO));
}catch(Exception e) {
	e.printStackTrace();
}

}

private void rDTO(String string) {
	// TODO Auto-generated method stub
	
}
}
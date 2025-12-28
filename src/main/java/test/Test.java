package test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.jupiter.api.DisplayName;

import day1226.EmpDTO;
import day1226.EmpDomain;
import day1226.SelectDAO2;
import kr.co.sist.car.CarDAO;
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
CarDAO cDAO=CarDAO.getInstance();
//EmpDomain ed=sDAO.useDomain(eDTO);
//assertNotNull(ed);
try {
	String country = "국산"; 
	assertNotNull(cDAO.carMaker(country));
}catch(Exception e) {
	e.printStackTrace();
}

}
}
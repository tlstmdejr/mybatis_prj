package day1224;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import day1219.DeptDTO;
import kr.co.sist.dao.MyBatisHandler;

public class TestMyBatisDAO2{
	public void updateNonParameter(int num)throws PersistenceException{
	//1.mybatis handler 얻기
	SqlSession ss=MyBatisHandler.getInstance().getMyBatisHandler(true);//업데이트하나로트랜지션완료 오토커밋
	//2.쿼리문을 찾아서  parsing 한후실행
	int cnt=ss.update("day1224.updateParameter",num);
	//3.실행결과 받기
	System.out.println(cnt+"추가되었습니다");
	//4.mybatis handler 닫기
	if(ss!=null) {ss.close();}
	}
	public void updateParameter(DeptDTO dDTO)throws PersistenceException{
		//1.mybatis handler 얻기
		SqlSession ss=MyBatisHandler.getInstance().getMyBatisHandler(true);//업데이트하나로트랜지션완료 오토커밋
		//2.쿼리문을 찾아서  parsing 한후실행
		int cnt=ss.update("day1224.updateCpDept",dDTO);
		//3.실행결과 받기
		System.out.println(cnt+"추가되었습니다");
		//4.mybatis handler 닫기
		if(ss!=null) {ss.close();}
	
}
	public void deleteNonParameter()throws PersistenceException{
		//1.mybatis handler 얻기
		SqlSession ss=MyBatisHandler.getInstance().getMyBatisHandler(true);//업데이트하나로트랜지션완료 오토커밋
		//2.쿼리문을 찾아서  parsing 한후실행
		int cnt=ss.update("day1224.deleteCpDept");
		//3.실행결과 받기
		System.out.println(cnt+"추가되었습니다");
		//4.mybatis handler 닫기
		if(ss!=null) {ss.close();}
		
	}
	public void deleteParameter(int deptno)throws PersistenceException{
		//1.mybatis handler 얻기
		SqlSession ss=MyBatisHandler.getInstance().getMyBatisHandler(true);//업데이트하나로트랜지션완료 오토커밋
		//2.쿼리문을 찾아서  parsing 한후실행
		int cnt=ss.update("day1224.deleteCpDept",deptno);
		//3.실행결과 받기
		System.out.println(cnt+"추가되었습니다");
		//4.mybatis handler 닫기
		if(ss!=null) {ss.close();}
		
	}
	public static void main(String[] args) {
		
		try {
			/*
			 * new TestMyBatisDAO2().(dDTO); new TestMyBatisDAO2().();
			 */
			//new TestMyBatisDAO2().updateParameter(84);
			DeptDTO dDTO=new DeptDTO(50,"sm","인천");
			new TestMyBatisDAO2().updateParameter(dDTO);
//			new TestMyBatisDAO2().deleteNonParameter();
//			new TestMyBatisDAO2().deleteParameter(90);
		}catch(PersistenceException pe){
			System.err.println("문제발생");
			pe.printStackTrace();
		}
	}//main
}
//class

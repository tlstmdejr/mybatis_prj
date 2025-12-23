package day1223;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import day1219.DeptDTO;
import kr.co.sist.dao.MyBatisHandler;

public class TestMyBatisDAO {
	public void insertBoard()throws PersistenceException{
		
		//1.mybatis handler얻기
		SqlSession ss=MyBatisHandler.getInstance().getMyBatisHandler(true);//true=auto commit
		
		//2.method 호출 
		int cnt=ss.insert("day1223.nonParameter");
	   //3. 결과받기
		System.out.println(cnt+"추가되었습니다");
//		if(cnt==1) { 		SqlSession ss=MyBatisHandler.getInstance().getMyBatisHandler(true);//true=auto commit
//							false일경우에 쓴다

//			ss.commit();
//		}
		//4.mybtis handler 닫기
		if(ss!=null) {ss.close();}
	}
	public void insertCpDept(DeptDTO dDTO) {
		SqlSession ss=MyBatisHandler.getInstance().getMyBatisHandler(true);
		int cnt=ss.insert("day1223.insertDept",dDTO);
		System.out.println(cnt+" 건 추가되었습니디");
		if(ss!=null){ss.close();}
	}
	public void insertCpDept2(DeptDTO dDTO) {
		SqlSession ss=MyBatisHandler.getInstance().getMyBatisHandler(true);
		int cnt=ss.insert("day1223.insertDept2",dDTO);
		System.out.println(cnt+" 건 추가되었습니디");
		if(ss!=null){ss.close();}
	}
	
	
	public static void main(String[] args) {
		
		try {
			DeptDTO dDTO=new DeptDTO(50,"QA","경기");
			new TestMyBatisDAO().insertCpDept2(dDTO);
			new TestMyBatisDAO().insertBoard();
		}catch(PersistenceException pe){
			System.err.println("문제발생");
			pe.printStackTrace();
		}
	}//main
}
//class

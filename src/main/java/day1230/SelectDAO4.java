package day1230;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import day1224.EmpDTO;
import day1226.CarModelDomain;
import day1226.EmpAllDomain;
import kr.co.sist.dao.MyBatisHandler;

public class SelectDAO4 {
	private static SelectDAO4 sDAO;
	
	private SelectDAO4() {
	}
	
	public static SelectDAO4 getInstance() {
		if( sDAO == null ) {
			sDAO=new SelectDAO4();
		}//end if
		return sDAO;
	}//getInstance
	
	
	public List<EmpAllDomain> dynamicChoose(int deptno)throws PersistenceException{
		List<EmpAllDomain> empList=null;
		
		SqlSession ss=MyBatisHandler.getInstance().getMyBatisHandler(false);
		empList=ss.selectList("day1230.dynamicChoose", deptno );
		if(ss != null ) { ss.close(); }//end if
		
		return empList;
	}//dynamicChoose
	
	public List<Integer> selectAllEmpno()throws PersistenceException{
		List<Integer> empList=null;
		
		SqlSession ss=MyBatisHandler.getInstance().getMyBatisHandler(false);
		empList=ss.selectList("day1230.selectAllEmpno" );
		if(ss != null ) { ss.close(); }//end if
		
		return empList;
	}//selectAllEmpno
	

	public List<EmpAllDomain> dynamicForeach(Map<String, Object> empMap)throws PersistenceException{
		List<EmpAllDomain> empList=null;
		
		SqlSession ss=MyBatisHandler.getInstance().getMyBatisHandler(false);
		empList=ss.selectList("day1230.dynamicForEach", empMap );
		if(ss != null ) { ss.close(); }//end if
		
		return empList;
	}//dynamicForeach
	
	public int dynamicSet(EmpDTO eDTO)throws PersistenceException {
		int cnt=0;
		
		SqlSession ss=MyBatisHandler.getInstance().getMyBatisHandler(true);
		cnt=ss.update("day1230.dynamicSet", eDTO );
		if(ss != null ) { ss.close(); }//end if
		
		return cnt;
	}//dynamicSet
	
	public int transaction(TransactionDTO tDTO)throws PersistenceException {
		int cnt=0;
		int cnt2=0;
		//autocommit을 해제한 상태로 MyBatis Handler 얻기
		SqlSession ss=MyBatisHandler.getInstance().getMyBatisHandler(false);
		
		//transaction관련 쿼리를 한번에 실행
		cnt=ss.insert("day1230.trans1", tDTO );
		cnt2=ss.insert("day1230.trans2", tDTO );
		
		//각각 실행한 행수가 목표로한 행수라면
		//insert => commit 아니면 예외
		//update, delete => commit, rollback아니면 예외
		if( (cnt + cnt2) == 2) {
			System.out.println("insert commit");
			ss.commit(); 
		}//end if
		
		if(ss != null ) { ss.close(); }//end if
		
		return cnt+cnt2;
	}//transaction
	
	public int transaction2(TransactionDTO tDTO)throws PersistenceException {
		int cnt=0;
		int cnt2=0;
		//autocommit을 해제한 상태로 MyBatis Handler 얻기
		SqlSession ss=MyBatisHandler.getInstance().getMyBatisHandler(false);
		
		//transaction관련 쿼리를 한번에 실행
		cnt=ss.update("day1230.upTrans1", tDTO ); //변경
		cnt2=ss.update("day1230.upTrans2", tDTO );//변경 x
		
		//각각 실행한 행수가 목표로한 행수라면
		//insert => commit 아니면 예외
		//update, delete => commit, rollback 아니면 예외
		if( (cnt + cnt2) == 2) {
			System.out.println("update commit");
			ss.commit(); 
		}else {
			System.out.println("update rollback");
			ss.rollback();
		}//end if
		
		if(ss != null ) { ss.close(); }//end if
		
		return cnt+cnt2;
	}//transaction
	
	
	
}//class










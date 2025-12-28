package day1226;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.dao.MyBatisHandler;

public class SelectDAO2 {
	private static SelectDAO2 sDAO;

	private SelectDAO2() {
	}

	public static SelectDAO2 getInstance() {
		if (sDAO == null) {
			sDAO = new SelectDAO2();
		} // end if
		return sDAO;
	}// getInstance

	/**
	 * 컬럼하나에 한행 조회
	 * 
	 * @param deptno 부서번호
	 * @return 부서명
	 */


	
	/**
	 * 사원번호와 부서번호에대한 사원정보조회
	 * @param empno
	 * @return
	 * @throws PersistenceException
	 */
	public EmpDomain useDomain(EmpDTO empDTO) throws PersistenceException {
		EmpDomain empDomain=null;

		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(false);
		empDomain = ss.selectOne("day1226.useDomain", empDTO);

		if (ss != null) {
			ss.close();
		}
		return empDomain;

	}// useDomain
	public List<ZipcodeDomain> useLike(String dong) throws PersistenceException {
		List<ZipcodeDomain> zipList=null;
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(false);
		zipList = ss.selectList("day1226.like", dong);
		
		if (ss != null) {
			ss.close();
		}
		return zipList;
		
	}// useLike
	public List<EmpDomain> lessThan(int sal) throws PersistenceException {
		List<EmpDomain> empList=null;
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(false);
		empList = ss.selectList("day1226.lessThan", sal);
		
		if (ss != null) {
			ss.close();
		}
		return empList;
		
	}// lessThan
	public List<EmpDomain> greaterThan(int sal) throws PersistenceException {
		List<EmpDomain> empList=null;
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(false);
		empList = ss.selectList("day1226.greaterThan", sal);
		
		if (ss != null) {
			ss.close();
		}
		return empList;
		
	}// lessThan
	public List<EmpDomain> subquery() throws PersistenceException {
		List<EmpDomain> empList=null;
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(false);
		empList = ss.selectList("day1226.subquery");
		
		if (ss != null) {
			ss.close();
		}
		return empList;
		
	}// lessThan
	public List<EmpAllDomain> union() throws PersistenceException {
		List<EmpAllDomain> empList=null;
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(false);
		empList = ss.selectList("day1226.union");
		
		if (ss != null) {
			ss.close();
		}
		return empList;
		
	}// union
	public List<CarModelDomain> join() throws PersistenceException {
		List<CarModelDomain> carList=null;
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(false);
		carList = ss.selectList("day1226.join");
		
		if (ss != null) {
			ss.close();
		}
		return carList;
		
	}// join

	
}
//class

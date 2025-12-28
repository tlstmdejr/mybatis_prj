package kr.co.sist.car;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import day1226.CarModelDomain;
import day1226.EmpAllDomain;
import day1226.EmpDTO;
import day1226.EmpDomain;
import day1226.SelectDAO2;
import day1226.ZipcodeDomain;
import kr.co.sist.dao.MyBatisHandler;

public class CarDAO {
	private static CarDAO cDAO;

	private CarDAO() {
	}

	public static CarDAO getInstance() {
		if (cDAO == null) {
			cDAO = new CarDAO();
		} // end if
		return cDAO;
	}// getInstance

	public List<CarMakerDomain> carMaker(String country) throws PersistenceException {
		List<CarMakerDomain> carList=null;
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(false);
		carList = ss.selectList("kr.co.sist.car.carMaker", country);
		
		if (ss != null) {
			ss.close();
		}
		return carList;
		
	}// carMaker

	
}
//class


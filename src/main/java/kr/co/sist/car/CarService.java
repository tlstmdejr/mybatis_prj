package kr.co.sist.car;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;



public class CarService {
		private static CarService cs; 
		
		private CarService(){
		}

		public static CarService getInstance() {
		if(cs == null) {
		cs=new CarService();
		}//end if
		return cs;
		}//getInstance
		
		public List<CarMakerDomain> carMaker(String maker){
			List<CarMakerDomain> list=null;
			
			CarDAO cDAO=CarDAO.getInstance();
			try {
				list=cDAO.carMaker(maker);
			}catch(PersistenceException pe) {
				pe.printStackTrace();
				
			}
			
			return list;
		}
		
}
//class

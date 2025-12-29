package kr.co.sist.car;

import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import day1226.CarModelDomain;



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
		
		public String searchMaker(String country){
			JSONObject jsonObj=new JSONObject();
			jsonObj.put("result", false);
			jsonObj.put("cnt", 0);
			
			CarDAO cDAO=CarDAO.getInstance();
			try {
				List<String> makerList=cDAO.selectMaker(country);
				jsonObj.put("result", true);
				jsonObj.put("makerCnt", makerList.size());
				JSONObject jsonTemp=null;
				JSONArray jsonArr=new JSONArray();
				for(String maker : makerList	) {
					jsonTemp=new JSONObject();
					jsonTemp.put("maker", maker);
					jsonArr.add(jsonTemp);
				}
				jsonObj.put("data", jsonArr);
			}catch(PersistenceException pe) {
				pe.printStackTrace();
				
			}
			
			return jsonObj.toJSONString();
		}
		public String searchModel(String maker){
			JSONObject jsonObj=new JSONObject();
			jsonObj.put("result", false);
			jsonObj.put("modelcnt", 0);
			
			CarDAO cDAO=CarDAO.getInstance();
			try {
				List<String> modelList=cDAO.selectModel(maker);
				jsonObj.put("result", true);
				jsonObj.put("modelcnt", modelList.size());
				JSONObject jsonTemp=null;
				JSONArray jsonArr=new JSONArray();
				for(String model : modelList	) {
					jsonTemp=new JSONObject();
					jsonTemp.put("model", model);
					jsonArr.add(jsonTemp);
				}
				jsonObj.put("data", jsonArr);
			}catch(PersistenceException pe) {
				pe.printStackTrace();
			}
			return jsonObj.toJSONString();
		}
		
		public String searchCar(String model){
			JSONObject jsonObj=new JSONObject();
			jsonObj.put("result", false);
			jsonObj.put("carCnt", 0);
			
			CarDAO cDAO=CarDAO.getInstance();
			try {
				List<CarModelDomain> carList=cDAO.selectCar(model);
				jsonObj.put("result", true);
				jsonObj.put("carCnt", carList.size());
				JSONObject jsonTemp=null;
				JSONArray jsonArr=new JSONArray();
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd kk:mm");
				String carOption="";
				for(CarModelDomain cmd : carList	) {
					
					carOption=cmd.getCar_option();
					if(carOption != null && carOption.length() >20) {
						carOption=carOption.substring(0,19)+"...";
					}
					jsonTemp=new JSONObject();
					jsonTemp.put("car_img", cmd.getCar_img());
					jsonTemp.put("car_option", cmd.getCar_option());
					jsonTemp.put("car_year", cmd.getCar_year());
					jsonTemp.put("price", cmd.getPrice());
					jsonTemp.put("cc", cmd.getCc());
					jsonTemp.put("hiredate",sdf.format(cmd.getHiredate()));
					jsonArr.add(jsonTemp);
				}
				jsonObj.put("data", jsonArr);
			}catch(PersistenceException pe) {
				pe.printStackTrace();
			}
			return jsonObj.toJSONString();
		}
		
}
//class

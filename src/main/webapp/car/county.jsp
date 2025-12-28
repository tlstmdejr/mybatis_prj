<%@page import="kr.co.sist.car.CarMakerDomain"%>
<%@page import="kr.co.sist.car.CarModelDomain"%>
<%@page import="kr.co.sist.car.CarService"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="day1226.SelectService2"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 1. 파라미터 받기 (국산 or 수입)
    String country = request.getParameter("country");

    // 2. 서비스 호출 (DB 조회)
    CarService cs= CarService.getInstance();
    // MyBatis 호출: ss.selectList("day1226.selectMaker", country); 형태로 구현되어 있다고 가정
    // 반환 타입은 List<CarMakerDomain> 이어야 합니다.
    List<CarMakerDomain> list = cs.carMaker(country); 

    // 3. JSON 만들기 (json-simple 라이브러리 사용)
    JSONArray jsonArr = new JSONArray();
    
    if(list != null){
        for(CarMakerDomain cmd : list){ // 향상된 for문 사용
            JSONObject json = new JSONObject();
            json.put("maker", cmd.getMaker());
            jsonArr.add(json);
        }
    }
    out.print(jsonArr.toJSONString());
%>
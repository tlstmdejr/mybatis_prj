<%@page import="day1230.SelectService4"%>
<%@page import="day1229.SelectService3"%>
<%@page import="day1226.EmpAllDomain"%>
<%@page import="day1226.EmpDomain"%>
<%@page import="day1226.SelectService2"%>
<%@page import="day1224.EmpDTO"%>
<%@page import="java.util.List"%>
<%@page import="day1224.SelectService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<h3>foreach 사용 조회</h3>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		$("#frm").submit();
	});//click
	
	$("[value='${ param.deptno}']").prop("checked",true);
	
	$("#flag").click(function(){
		var flagChk=$("#flag").prop("checked");
		$.each($("[name='empno']"),function(i, chk){
			$(chk).prop("checked",flagChk);
		});//end each
		
	});//click
	
	<c:forEach var="empno" items="${ paramValues.empno }">
		$("[value='${empno}']").prop("checked",true);
	</c:forEach>
	
});//ready
</script>
사원 검색<br>
<form id="frm" action="index.jsp">
<input type="hidden" name="url" value="${ param.url }"/>
<% SelectService4 ss4=SelectService4.getInstance(); 
	pageContext.setAttribute("empList", ss4.searchAllEmpno());
%>
<input type="checkbox" name="flag" id="flag"/>전체선택
<c:forEach var="empno" items="${ empList }" varStatus="i">
<input type="checkbox" name="empno" value="${ empno }"/>
<c:out value="<strong>${ i.count}</strong>. ${ empno }" escapeXml="false"/>
</c:forEach>

<input type="button" value="검색" class="btn btn-sm btn-info" id="btn"/>
</form>
<div id="output">
<c:if test="${ not empty paramValues.empno }">
<%
String[] empno=request.getParameterValues("empno");

List<EmpAllDomain> empList=ss4.dynamicForeach( empno );

pageContext.setAttribute("empList",  empList);
%>
<table class="table table-hover">
<thead>
<tr>
<th>사원번호</th>
<th>사원명</th>
<th>연봉</th>
<th>직무</th>
<th>부서번호</th>
<th>입사일</th>
</tr>
</thead>
<tbody>
	<c:if test="${ empty empList }">
	<tr>
	<td colspan="6" style="text-align: center">
	<img src="images/na.jpg" style="width: 300px; height: 260px"/>
	</td>
	</tr>
	</c:if>
	
	<c:forEach var="emp" items="${ empList }" varStatus="i">
	<tr>
		<td><c:out value="${ emp.empno }"/></td>	
		<td><c:out value="${ emp.ename }"/></td>	
		<td><c:out value="${ emp.sal }"/></td>	
		<td><c:out value="${ emp.job }"/></td>	
		<td><c:out value="${ emp.deptno }"/></td>	
		<td><fmt:formatDate value="${ emp.hiredate }" pattern="yyyy-MM-dd EEEE"/></td>	
	</tr>
	</c:forEach> 
</tbody>
</table>
</c:if>

</div>

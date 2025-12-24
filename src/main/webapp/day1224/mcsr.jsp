<%@page import="day1224.EmpDTO"%>
<%@page import="day1224.SelectService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- <style type="text/css">
body{
	color:#000;
}
</style> -->
<h2>컬럼 여러개에 한행 조회</h2>

<script type="text/javascript">
	$(function() {
		$("#btn").click(function() {
			console.log("btn action");
			$("#frm").submit();
		});//click
	});//ready
</script>
<form name="frm" id="frm" action="index.jsp">
	<input type="hidden" name="url" value="${param.url }" />
	<label for="empno">사원번호</label> 
	<input type="text" name="empno" />
	<input	type="button" value="검색" class="btn btn-info btn-sm" id="btn" />
</form>
<div id="output">
	<c:if test="${not empty param.empno}">
		<%
		String empno = request.getParameter("empno");
		SelectService ss = SelectService.getInstance();
		EmpDTO eDTO = ss.mcsr(Integer.parseInt(empno));
		pageContext.setAttribute("eDTO", eDTO);
		%>
		<c:out value="${param.empno }" />번사원정보 검색결과
<br>
		<c:choose>
			<c:when test="${not empty eDTO }">
			사원명 : <c:out value="${eDTO.ename }" />
			연봉	: <fmt:formatNumber pattern="#,###.##" value="${eDTO.sal }" /><br>
			직무	: <c:out value="${eDTO.job }" />
			매니저번호	: <c:out value="${eDTO.mgr }" />
			부서번호 : <c:out value="${eDTO.deptno }" />
			입사일 : <c:out value="${eDTO.strHiredate }" />(
					<fmt:formatDate value="${eDTO.hiredate }" pattern="yyyy-MM-dd kk:mm:ss"/>)<br>
			</c:when>
			<c:otherwise>
해당사원은 존재하지않습니다
</c:otherwise>
		</c:choose>
	</c:if>
</div>
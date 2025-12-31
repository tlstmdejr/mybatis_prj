<%@page import="day1231.MemberDomain"%>
<%@page import="day1231.SelectService5"%>
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
<h3>procedure를 사용한 insert</h3>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		$("#frm").submit();
	});//click
});//ready
</script>
전체회원검색<br>
<div id="output">
<% SelectService5 ss5=SelectService5.getInstance(); 
List<MemberDomain> md=ss5.searchAllMember();
pageContext.setAttribute("mdList", md);
%>
<table class="table table-hover">
<thead>
<tr>
<th>번호</th>
<th>이름</th>
<th>나이</th>
<th>성별</th>
<th>전화번호</th>
<th>가입일</th>
</tr>
</thead>
<tbody>
<c:if test="${empty mdList }"/>
<tr>
<td colspan="6">회원정보가존재하지않습니다</td>
</tr>
<c:forEach var="md" items="${mdList }"> 
<tr>
<td><c:out value="${ md.num }"/></td>
<td><c:out value="${ md.name }"/></td>
<td><c:out value="${ md.age }"/></td>
<td><c:out value="${ md.gender }"/></td>
<td><c:out value="${ md.tel }"/></td>
<td>Timestamp<fmt:formatDate value="${ md.inputDate }"
pattern="yyyy-MM-dd EEEE kk:mm: ss" /> /
Date <fmt:formatDate value="${ md.input_date }"
pattern="yyyy-MM-dd EEEE kk:mm: ss"/>
</tr>
</c:forEach>
</tbody>
</table>
<c:choose>
<c:when test="${ md eq null }">
회원정보가 존재하지 않습니다.
</c:when>
<c:otherwise>
이름 : <c:out value="${ md.name }"/><br>
나이 : <c:out value="${ md.age }"/><br>
성별: <c:out value="${ md.gender }"/><br>
전화번호 : <c:out value="${ md.tel }"/><br>
가입일 : <fmt:formatDate value="${ md.inputDate}"
pattern="yyyy-MM-dd EEEE kk:mm:ss"/><br>
</c:otherwise>
</c:choose>
</div>

<%@page import="oracle.net.aso.b"%>
<%@page import="kr.co.sist.board.BoardService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="bDTO" class="kr.co.sist.board.BoardDTO" scope="page"/>
<jsp:setProperty name="bDTO" property="*"/>

<%
// num 파라미터를 명시적으로 int로 파싱하여 설정
String numStr = request.getParameter("num");
if(numStr != null && !numStr.isEmpty()) {
    bDTO.setNum(Integer.parseInt(numStr));
}
//web parameter로title,content입력되고
//그외 ip-request내장객체 id session에서 얻어야 한다
bDTO.setId((String)session.getAttribute("userId"));

BoardService bs=BoardService.getInstance();
boolean flag=bs.removeBoard(bDTO);
pageContext.setAttribute("flag", flag);
%>
<script type="text/javascript">
<c:choose>
<c:when test="${flag}">
var msg="글삭제성공";
alert(msg);
location.href="board_list.jsp?currentPage=${param.currentPage}";
</c:when>
<c:otherwise>
var msg="글삭제 중 문제가 발생했습니다";
alert(msg);
history.back();
</c:otherwise>
</c:choose>
</script>
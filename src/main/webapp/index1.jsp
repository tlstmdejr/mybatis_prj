<%@page import="day1224.UrlVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>MyBatis 실습</title>
<link rel="shortcut icon"
	href="http://localhost/mybatis_prj/common/images/favicon.ico">

<script src="http://localhost/mybatis_prj/common/js/color-modes.js"></script>
<!-- bootstrap CDN 시작 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
	crossorigin="anonymous"></script>

<meta name="theme-color" content="#712cf9">
<link href="http://localhost/mybatis_prj/common/css/carousel.css"
	rel="stylesheet">
<c:import url="http://localhost/mybatis_prj/fragments/bootstrap_css.jsp" />
<style type="text/css">
#wrap{ margin: Opx auto; width: 1200px; height: 1000px; background-color:#ffffff }
#left{width: 180px; height: 1000px; float: left;background-color:#ffffff	 }
#right{width: 980px; height: 1000px;float: right;background-color:#ff0000 }

a { color:#333; text-decoration: none }
a:hover { color:#ff0000; text-decoration: underline; }
#header {
	height: 150px;
}

#container {
	height: 700px;
}

#footer {
	height: 150px;
}
</style>
<!-- jQuery CDN 시작 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">

$(function(){
	
});//ready
</script>


</head>
<body>
	<header data-bs-theme="dark">
		<c:import url="http://localhost/mybatis_prj/fragments/header.jsp" />
	</header>
	<main>
		<!-- Wrap the rest of the page in another container to center all the content. -->
		<div class="container marketing">
			<hr class="featurette-divider">
			<div class="row featurette">
	 <%
          UrlVO[] urlArr={
        		  new UrlVO("컬럼하나에 한행 조회","day1224/scsr"),
        		  new UrlVO("컬럼여러개 한행 조회",""),
        		  new UrlVO("컬럼하나에 여러행 조회",""),
        		  new UrlVO("컬럼여러개 여러행 조회",""),
        		  new UrlVO("like",""),
        		  new UrlVO(">작다",""),
        		  new UrlVO("<크다",""),
        		  new UrlVO("subquery",""),
        		  new UrlVO("union ",""),
        		  new UrlVO("join",""),
        		  new UrlVO("subquery&join",""),
        		  new UrlVO("$의사용",""),
        		  new UrlVO("dynamic query : if",""),
        		  new UrlVO("dynamic query : choose",""),
        		  new UrlVO("dynamic query : forEach",""),
        		  new UrlVO("dynamic query : set",""),
        		  new UrlVO(" PL/SQL insert",""),
        		  new UrlVO(" PL/SQL update",""),
        		  new UrlVO(" PL/SQL delete",""),
        		  new UrlVO(" PL/SQL cursor","")
          };
     		     
          pageContext.setAttribute("urlArr",urlArr);
          %>
		  <div id="wrap">
          <div id="left">
          <table>
          <c:forEach var="url" items="${urlArr }" varStatus="i">
            <tr>
          <td><a href="index.jsp?url=${url.url }"><c:out value="${url.title }"/></a></td>
          <c:out value="${url.title }"/>
          </tr>
          </c:forEach>
          </table>
          <%-- </div> --%>
         </div>
         <div id="right">
         <c:if test="${not empty param.url }">
         <c:import url="${param.url }.jsp">
         </c:import>
         </c:if>
         </div>
         <hr class="featurette-divider">
		</div>
		<hr class="featurette-divider">
		<!-- /END THE FEATURETTES -->
		<!-- /.container -->
		</div>
		<!-- FOOTER -->
		<footer class="container">
			<c:import url="http://localhost/mybatis_prj/fragments/footer.jsp" />
		</footer>
	</main>

</body>
</html>
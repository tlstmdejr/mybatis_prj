<%@page import="day1224.UrlVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>JSP템플릿</title>
<link rel="shortcut icon" href="http://192.168.10.68/mybatis_prj/common/images/favicon.ico">

<script src="http://192.168.10.68/mybatis_prj/common/js/color-modes.js"></script>
<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

<meta name="theme-color" content="#712cf9">
<link href="http://192.168.10.68/mybatis_prj/common/css/carousel.css" rel="stylesheet">
<c:import url="http://192.168.10.68/mybatis_prj/fragments/bootstrap_css.jsp"/>
<style type="text/css">
#wrap{  margin: 0px auto; width: 1200px; height: 1000px; }	
#left{   width: 180px; height: 1000px;float: left; }	
#right{   width: 980px; height: 1000px;float: right;}
	
a { color:#333; text-decoration: none }
a:hover { color:#0000FF; text-decoration: underline; }
</style>
<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	
});//ready

</script>


</head>
<body>
	<header data-bs-theme="dark">
	<c:import url="http://192.168.10.68/mybatis_prj/fragments/header.jsp"/>
	</header>
	<main>

		<!-- Marketing messaging and featurettes
  ================================================== -->
		<!-- Wrap the rest of the page in another container to center all the content. -->
		<div class="container marketing">
			<!-- Three columns of text below the carousel -->
			<!-- /.row -->
			<!-- START THE FEATURETTES -->
			<hr class="featurette-divider">
			<div class="row featurette">
			<%
			UrlVO[] urlArr={
					new UrlVO("컬럼하나에 한행 조회","day1224/scsr"),
					new UrlVO("컬럼하나에 여러행 조회","day1224/scmr"),
					new UrlVO("컬럼여러개 한행 조회","day1224/mcsr"),
					new UrlVO("컬럼여러개 여러행 조회","day1224/mcmr"),
					new UrlVO("domain사용","day1226/domain"),
					new UrlVO("like","day1226/like"),
					new UrlVO("작다의 조회","day1226/lessThan"),
					new UrlVO("크다의 조회","day1226/greaterThan"),
					new UrlVO("subquery","day1226/subquery"),
					new UrlVO("union","day1226/union"),
					new UrlVO("join","day1226/join"),
					new UrlVO("subquery & join","day1229/subqueryNjoin"),
					new UrlVO("dollar sign","day1229/dollar"),
					new UrlVO("dynamic query : if","day1229/dynamicIf"),
					new UrlVO("dynamic query : choose","day1230/dynamicChoose"),
					new UrlVO("dynamic query : forEach","day1230/dynamicForEach"),
					new UrlVO("dynamic query : set","day1230/dynamicSet"),
					new UrlVO("transaction","day1230/transaction"),
					new UrlVO("PL/SQL insert","day1231/plInsert"),
					new UrlVO("PL/SQL update","day1231/plUpdate"),
					new UrlVO("PL/SQL delete","day1231/plDelete"),
					new UrlVO("PL/SQL cursor","day1231/plCursor")
			};
		

			
			pageContext.setAttribute("urlArr",urlArr);
			%>
			<div id="wrap">
			<div id="left">
			<table>
			<c:forEach var="url" items="${ urlArr }" varStatus="i">
			<tr>
			<td><a href="index.jsp?url=${ url.url }"><c:out value="${ url.title }"/></a></td>
			</tr>
			</c:forEach>
			</table>			
			</div>
			<div id="right">
			<c:if test="${ not empty param.url }">
			<c:import url="${ param.url }.jsp"/>
			</c:if>
			</div>

			</div>
				
			</div>
			<hr class="featurette-divider">
			<!-- /END THE FEATURETTES -->
		</div>
		<!-- /.container -->
		<!-- FOOTER -->
		<footer class="container">
		<c:import url="http://192.168.10.68/mybatis_prj/fragments/footer.jsp"/>
		</footer>
	</main>
	
</body>
</html>
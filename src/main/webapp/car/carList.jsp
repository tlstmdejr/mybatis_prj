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
#wrap {
	margin: 0px auto;
	width: 1200px;
	height: 1000px;
}

#header {
	height: 150px;
}

#container {
	height: 700px;
}

#footer {
	height: 150px;
}

body {
	/* 헤더의 높이만큼 윗부분에 여백을 줍니다. */
	/* 60px, 80px 등 헤더 크기에 맞춰 숫자를 조절하세요 */
	padding-top: 70px;
}
</style>
<!-- jQuery CDN 시작 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
	$(function(){
		$("#carCountry").change(function(){
			var selModel=$("#carModel")[0];
			selModel.length=1;
			if($("#carCountry")[0].selectedIndex!=0){
				var param={country : $("#carCountry").val()};
				
				$.ajax({
					url:"searchMaker.jsp",
					type:"get",
					data:param,
					dataType:"json",
					error:function(xhr){
						alert("제조사 조회시 문제발생")
						console.log(xhr.status);
					},
					success:function(jsonObj){
						if(jsonObj.result && jsonObj.makerCnt !=0){
							//제조사를 설정할 select을 가져와준다
							var selMaker=$("#carMaker")[0];
							selMaker.length=1;
							var jsonArr=jsonObj.data;
							for(var i=0; i<jsonObj.data.length; i++){
								selMaker.options[i+1]=new Option(jsonObj.data[i].maker,jsonArr[i].maker)											
						}
						}
					}
				});
			}		
		});
		$("#carMaker").change(function(){
			if($("#carMaker")[0].selectedIndex!=0){
				var param={maker : $("#carMaker").val()};
				
				$.ajax({
					url:"searchModel.jsp",
					type:"get",
					data:param,
					dataType:"json",
					error:function(xhr){
						alert("제조사 조회시 문제발생")
						console.log(xhr.status);
					},
					success:function(jsonObj){
						if(jsonObj.result && jsonObj.modelCnt !=0){
							//제조사를 설정할 select을 가져와준다
							var selModel=$("#carModel")[0];
							selModel.length=1;
							var jsonArr=jsonObj.data;
							for(var i=0; i<jsonObj.data.length; i++){
								selModel.options[i+1]=new Option(jsonArr[i].model,jsonArr[i].model)											
						}
						}
					}
				});
			}		
		});
		$("#btn").click(function(){
			if($("#carModel")[0].selectedIndex!=0){
				var param={ model : $("#carModel").val() };
					$.ajax({
						url:"searchCar.jsp",
						type:"get",
						data:param,
						dataType:"json",
						error:function(xhr){
							alert("제조사 조회시 문제발생")
							console.log(xhr.status);
						},
						success:function(jsonObj){
							if(jsonObj.result){
								//조회결과를 보여줄 tbale을 가져와준다
								var carTab=$("#carList tbody").empty();
								
					
								var jsonArr=jsonObj.data;
								var createTr="";
								var jsonObjCar;
								for(var i=0; i<jsonObj.data.length; i++){
									jsonObjCar=jsonArr[i];
									createTr="<tr>"
									createTr+="<td><img src='http://localhost/mybatis_prj/day1226/car_img/"+jsonObjCar.car_img+"'style='width:80px;height:60px'/></td>";
									createTr+="<td>"+(jsonObjCar.car_option !=null? jsonObjCar.car_option:"옵셔없음")+"</td>";
									createTr+="<td>"+jsonObjCar.car_year+"</td>";
									createTr+="<td>"+jsonObjCar.price+"</td>";
									createTr+="<td>"+jsonObjCar.cc+"</td>";
									createTr+="<td>"+jsonObjCar.hiredate+"</td>";
									createTr+="</tr>";
									
									$("#carList tbody:last").append(createTr);
								}//endfor
								if(jsonObj.carCnt==0){
									createTr="<tr><td colspan='5'>보유중인차량이없습니다.</td></tr>";
									$("#carList tbody:last").append(createTr);
								}//endif
							}//endif
						}
					});
			}		
		});
		
	});
</script>
</head>
<header data-bs-theme="dark">
	<c:import url="http://localhost/mybatis_prj/fragments/header.jsp" />
</header>
<body>
	<main>
		<!-- Wrap the rest of the page in another container to center all the content. -->
		<div class="container marketing">
			<hr class="featurette-divider">
			<div class="row featurette">
				<div>
					<div id="selectDiv">
						<select id="carCountry">
							<option value="N/A">-----제조국선택------</option>
							<option value="국산">국산</option>
							<option value="수입">수입</option>
						</select> <select id="carMaker">
							<option value="N/A">-----제조사선택------</option>
						</select> <select id="carModel">
							<option value="N/A">-----모델선택------</option>
						</select> <input type="button" value="조회" id="btn" class="btn btn-info btn-sm">
					</div>
					<div id="carListDiv">
						<table class="table table-hover" id="carList">
							<thead>
								<tr>
									<th>이미지</th>
									<th>옵션</th>
									<th>연식</th>
									<th>가격</th>
									<th>배기량</th>
									<th>입력일</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
				</div>
				<hr class="featurette-divider">
				<!-- /END THE FEATURETTES -->
			</div>
			<!-- /.container -->
		</div>
		<!-- FOOTER -->
		<footer class="container">
			<c:import url="http://localhost/mybatis_prj/fragments/footer.jsp" />
		</footer>
	</main>

</body>
</html>
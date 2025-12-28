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
	$(function() {
		// 국산/수입 선택이 바뀔 때 실행
		$("#country").change(function() {

			var selectedCountry = $(this).val(); // 선택된 값 (국산/수입)
			var $makerSel = $("#maker"); // 제조사 셀렉트 박스

			// 1. 기존 제조사 목록 비우기
			$makerSel.empty();
			$makerSel.append(new Option("선택하세요", ""));

			// "선택하세요"를 고른 경우 더 이상 진행 안 함
			if (selectedCountry === "")
				return;

			// 2. AJAX 요청
			$.ajax({
				url : "county.jsp", // 아까 만든 데이터 주는 JSP 경로
				type : "GET",
				data : {
					country : selectedCountry
				}, // 파라미터 전송
				dataType : "json", // 응답을 JSON으로 받음
				success : function(jsonArr) {
					// 3. 받아온 데이터로 옵션 생성
					$.each(jsonArr, function(i, item) {
						// item.maker는 JSON의 key값
						$makerSel.append(new Option(item.maker, item.maker));
					});
				},
				error : function(xhr) {
					console.log(xhr.status + " : " + xhr.statusText);
					alert("제조사 목록을 불러오는데 실패했습니다.");
				}
			});
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
					<!-- 여기서부터 작성 시작-->
					
					국가 선택: <select id="country">
						<option value="">선택하세요</option>
						<option value="국산">국산</option>
						<option value="수입">수입</option>
					</select> 제조사 선택: <select id="maker" style="width: 150px;">
						<option value="">선택하세요</option>
					</select>
					차량선택 : <select id="model" style="width:150px;">
					 	<option value="">선택하세요</option>
					 	반복
					
					</select>
					<input	type="button" value="검색" class="btn btn-info btn-sm" id="btn" />
	 			</div>

			</div>
			<hr class="featurette-divider">
			<!-- /END THE FEATURETTES -->
		</div>
		<!-- /.container -->
		<!-- FOOTER -->
		<footer class="container">
			<c:import url="http://localhost/mybatis_prj/fragments/footer.jsp" />
		</footer>
	</main>

</body>
</html>
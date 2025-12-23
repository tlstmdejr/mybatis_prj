<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Astro v5.13.2">
<title>게시판글쓰기</title>

<link rel="shortcut icon" href="${pageContext.request.contextPath}/common/images/favicon.ico">
<script src="${pageContext.request.contextPath}/common/js/color-modes.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<meta name="theme-color" content="#712cf9">
<link href="${pageContext.request.contextPath}/common/css/carousel.css" rel="stylesheet">

<style>
.bd-placeholder-img {
   font-size: 1.125rem;
   text-anchor: middle;
   -webkit-user-select: none;
   -moz-user-select: none;
   user-select: none
}

@media ( min-width : 768px) {
   .bd-placeholder-img-lg {
      font-size: 3.5rem
   }
}

.b-example-divider {
   width: 100%;
   height: 3rem;
   background-color: #0000001a;
   border: solid rgba(0, 0, 0, .15);
   border-width: 1px 0;
   box-shadow: inset 0 .5em 1.5em #0000001a, inset 0 .125em .5em #00000026
}

.b-example-vr {
   flex-shrink: 0;
   width: 1.5rem;
   height: 100vh
}

.bi {
   vertical-align: -.125em;
   fill: currentColor
}

.nav-scroller {
   position: relative;
   z-index: 2;
   height: 2.75rem;
   overflow-y: hidden
}

.nav-scroller .nav {
   display: flex;
   flex-wrap: nowrap;
   padding-bottom: 1rem;
   margin-top: -1px;
   overflow-x: auto;
   text-align: center;
   white-space: nowrap;
   -webkit-overflow-scrolling: touch
}

.btn-bd-primary {
   --bd-violet-bg: #712cf9;
   --bd-violet-rgb: 112.520718, 44.062154, 249.437846;
   --bs-btn-font-weight: 600;
   --bs-btn-color: var(--bs-white);
   --bs-btn-bg: var(--bd-violet-bg);
   --bs-btn-border-color: var(--bd-violet-bg);
   --bs-btn-hover-color: var(--bs-white);
   --bs-btn-hover-bg: #6528e0;
   --bs-btn-hover-border-color: #6528e0;
   --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
   --bs-btn-active-color: var(--bs-btn-hover-color);
   --bs-btn-active-bg: #5a23c8;
   --bs-btn-active-border-color: #5a23c8
}

.bd-mode-toggle {
   z-index: 1500
}

.bd-mode-toggle .bi {
   width: 1em;
   height: 1em
}

.bd-mode-toggle .dropdown-menu .active .bi {
   display: block !important
}
</style>
<style type="text/css">
#wrap{  margin: 0px auto; width: 1200px; height: 1000px; }	
#header{ height: 150px;	 }	
#container{ height: 700px;	 }	
#footer{ height: 150px;}	
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<!-- summnerNote 시작 -->
 <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- summernote-lite 삽입 -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.js"></script>
<!--JS 실습 파트-->
<script type="text/javascript">

$(function () {
	$('#content').summernote({
	    placeholder: '힐 사용료를 걷겠어요',
	    tabsize: 2,
	    width:500,
	    height: 300,
	    toolbar: [
	          ['style', ['style']],
	          ['font', ['bold', 'underline', 'clear']],
	          ['color', ['color']],
	          ['para', ['ul', 'ol', 'paragraph']],
	          ['table', ['table']],
	          ['insert', ['link', 'picture', 'video']],
	          ['view', ['fullscreen', 'codeview', 'help']]
	        ]
	  });
});
</script>
<meta name="theme-color" content="#712cf9">
<link href="${CommonURL}/common/css/carousel.css" rel="stylesheet">
<jsp:include page="../fragments/bootstrap_css.jsp"></jsp:include>
<style type="text/css">
#wrap{  margin: 0px auto; width: 1200px; height: 1000px; }	
#header{ height: 150px;	 }	
#container{ height: 700px;	 }	
#footer{ height: 150px;}	
</style>
<script type="text/javascript">

/* <!--로그인 체크(text/javascript, alert 됨)  -->
if( ${ sessionScope.userId == null } ){
	alert("로그인한 사용자만 글을 쓸 수 있습니다.");
	location.href="${ commonURL }/login/loginFrm.jsp";
}//end if */

$(function(){
	$("#btnWrite").click(function(){
		//제목과 내용에 값이 있는지 유효성 검증.
		console.log( $("#content").val() )
		
		if($("#title").val()==""){
			alert("제목은 필수입력");
			$("#title").focus();
			return;
		}//end if
		if( $("#content").val() == "" || $("#content").val() == "<p></p>"){
			alert("내용은 필수 입력 입니다.");
			return;
		}//end if

		$("#frm").submit();
		
		
		});//click
});//ready
</script>

</head>
<body>
   <header data-bs-theme="dark">
      <jsp:include page="../fragments/header.jsp" /> 
   </header>
   <main>
      <jsp:include page="../fragments/carousel.jsp" /> 
      
      <div class="container marketing">
         <hr class="featurette-divider">
         <div class="row featurette">
            <div class="col-md-7">
              <h2>아무말 대잔치 글쓰기</h2>
              <form action="boardWriteFrmProcess.jsp" method="post" name="frm" id="frm">
              <table>
              <tr>
              <td style="width:100px">제목</td>
              <td><input type="text" name="title" id="title" style="width:500px"/></td>
              </tr>
              <tr>
              <td>내용</td>
              <td><textarea name="content" id="content"></textarea></td>
              </tr>
              <tr>
              <td>id/ip</td>
              <td><c:out value="${userId }"/>/<%=request.getRemoteAddr() %></td>
              </tr>
              <tr>
              <td colspan="2" style="text-align:center;	">
              <button onclick="return false" class="btn btn-success" id="btnWrite">글쓰기</button>
              <a href="board_list.jsp?currentPage=${param.currentPage}" class="btn btn-info">리스트</a>
              </td>
              </tr>
              </table>
              </form>
            </div>
         </div>
         <hr class="featurette-divider">
      </div>
      
      <footer class="container">
       <jsp:include page="../fragments/footer.jsp" />
      </footer>
   </main>
   
</body>
</html>
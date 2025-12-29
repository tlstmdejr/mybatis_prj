<%@page import="kr.co.sist.board.BoardService"%>
<%@page import="kr.co.sist.board.BoardDomain"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Astro v5.13.2">
<title>게시판 리스트</title>

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

a{color:#000000; text-decoration: none}
a:hover{text-decoration: none}

/* 게시판 pagination 디자인 */
.prevMark{color:#ff0000}
.currentPage{font-size: 20px; font-weight: bold;};
.notCurrentPage{font-size: 18px; font-weight: normal;};
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
/* [수정됨] jQuery 부분도 $로 처리 */
$(function(){
	$(function () {
		$("#btnWrite").click(function () {
			checkLogin();
		});
		$("#btnSearch").click(function () {
			searchBoard();
		});//click
		$("#keyword").keyup(function (evt) {
			if(evt.which == 13){//enter
				searchBoard();			
			}//end if
		});//keyup
		<c:if test="${ not empty param.keyword}">
		//<select>의 option을 선택상태로
		$("#field").val("${param.field}")
		//<input에 값 설정
		$("#keyword").val("${param.keyword}")
		</c:if>
	});
});


function searchBoard() {
	if($("#keyword").val().trim() != ""){
		$("#boardSearchFrm").submit();
	}//end if

		
	
}
function checkLogin(){
	location.href="boardWriteFrm.jsp?currentPage=${param.currentPage}";
}//checkLogin
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
            <div >
               <strong>아무말 대잔치 게시판</strong>
               <jsp:useBean id="rDTO" class="kr.co.sist.board.RangeDTO" scope="page"></jsp:useBean>
               <jsp:setProperty property="*" name="rDTO"/>
               <%
               BoardDAO bDAO=BoardDAO.getInstance();
                              BoardService bs=BoardService.getInstance();
                              //1.총 게시글의수
                              int totalCount=bs.totalCnt(rDTO);
                              //2.한하면에 보여줄 게시물의 수
                              int pageScale=bs.pageScale();
                      /*         //3.총 페이지 수
                              int totalPage=0;
                             
                              int totalPage=totalCount/pageScale;
                              if(totalCount%pageScale!=0){
                           	  totalPage++;
                              } */
                              int totalPage=bs.totalPage(totalCount, pageScale);
                           	   
                              
                              //4. 시작번호
                              String tempPage=request.getParameter("currentPage");
                              int currentPage=1;
                              if (tempPage != null) {
               			try {
               				//사용자가 pagination을 클릭하여 정상적인 값이 립력됨
               				currentPage = Integer.parseInt(tempPage);
               			} catch (NumberFormatException nfe) {
               			} //end catch
               		} //end if

                              int startNum=bs.startNum(currentPage,pageScale);
                              //5. 끝번호
                              int endNum=bs.endNum(startNum, pageScale);
               	             //rDTO는 시작번호와 끋번호를 web parameter로 받지 않고,
               	             //연산된 값(1항~5항)으로 설정 한다.

               	             rDTO.setStartNum(startNum);
               	             rDTO.setEndNum(endNum);
               	             //6. 시작번호와 끝 번호사이에 해당하는 게시글을 조회
               	             List<BoardDomain> boardList=bs.searchBoardList(rDTO);
               	             //글제목이 20글자를초과하면 19자 까지만 보여주고 나머지는 ...으로 처리
               		bs.titleSubStr(boardList);	
               	             rDTO.setUrl("board_list.jsp");	
               	             rDTO.setTotalPage(totalPage);
               	             String pagination=bs.pagination(rDTO);
                              //6.시작번호와 끝번호사이의 해당하는 모든게시물을가져온다
                              //7 pagenation
                             pageContext.setAttribute("totalCount", totalCount);
               		pageContext.setAttribute("pageScale", pageScale);
               		pageContext.setAttribute("totalPage", totalPage);
               		pageContext.setAttribute("currentPage", currentPage);
               		pageContext.setAttribute("startNum", startNum);
               		pageContext.setAttribute("endNum", endNum);
               		pageContext.setAttribute("boardList", boardList);
               		pageContext.setAttribute("pagination", pagination);
               %>
               <%-- 총 게시글의 수 : ${ totalCount }<br>
               한 화면에 보여줄 게시글 수 : ${ pageScale }건<br>
               총 페이지 수 : ${ totalPage }장<br>
               현재페이지 pagination번호 : ${ currentPage }<br>
               시작번호 : ${ startNum }<br>
               끝번호 : ${ endNum }<br> --%>
               
               <div id="boardList">
               <a href="${pageContext.request.contextPath}/board/boardWriteFrm.jsp" class="btn btn-info">글쓰기</a>
               <table class="table table-hover">
				<thead>
				<tr>
				<th style="width: 80px">번호</th>
				<th style="width: 450px">제목</th>
				<th style="width: 150px">작성자</th>
				<th style="width: 80px">조회수</th>
				<th style="width: 200px">작성일</th>
				</tr>
				</thead>
				<tbody>
				<c:if test="${ empty boardList }">
				<tr>
				<td colspan="6" style="text-align:center">
				작성된게시글이없습니다
				</tr>
				</c:if>
				<c:forEach var="bDTO" items="${ boardList }" varStatus="i">
				<tr>
				<td><c:out value="${totalCount-(currentPage-1)*pageScale-i.count }"/></td>
				<td><a href="boardDetailFrm.jsp?num=${bDTO.num }"><c:out value="${bDTO.title }"/></a></td>
				<td><c:out value="${bDTO.id }"/></td>
				<td><c:out value="${bDTO.cnt }"/></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${bDTO.input_date }"/></td>
				</tr>
				</c:forEach>
				</tbody>
				</table>
               </div>
               <div id="boardSearchDiv" style="text-align: center">
               <form action="board_list.jsp" id="boardSearchFrm">
               <select name="field" id="field"  style="height:30px">
               <option value="1">제목</option>
               <option value="2">내용</option>
               <option value="3">작성자</option>
               </select>
               <input type="text" name="keyword" id="keyword" style="height:30px; "/>
               <input type="hidden" name="currentPage" style="height:30px" value="${tempPage }"/>
               <input type="text" style="display:none"/>
               <input type="button" value="검색" id="btnSearch" class="btn btn-success" style="height:30px"/>
               </form>
               </div>
               <div id="pagination">
               <c:forEach var="tPage" begin="1" end="${ totalPage }" step="1">
				[ <a class="a" href="board_list.jsp?currentPage=${ tPage }&field=${param.field}&keyword=${param.keyword}">${ tPage }</a>]
				</c:forEach>
               </div>
               <div id="pagination"style="text-align:center">
             	<c:out  value="${pagination }" escapeXml="false"/>
               </div>
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
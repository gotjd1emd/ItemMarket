<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %> 

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>ItemMarket</title>
 	 <link rel="stylesheet" href="<c:url value="/"/>jquery/jquery-ui-1.11.4.custom/jquery-ui.min.css">
     <link rel="stylesheet" href="<c:url value="/"/>style/bootstrap-3.3.7-dist/css/bootstrap.css">
	<link rel="stylesheet" href="<c:url value="/"/>style/css.css">

		<jsp:include page="header.jsp"></jsp:include>
</head>
<body>


		<section id="board">
			<div class="container">

				<div class="boardtitle">${requestScope.category }  ${requestScope.subCategory } 카테고리</div>
				<input type='hidden' value='${requestScope.category }' name='category'/>
				<input type='hidden' value='${requestScope.subCategory }' name='subCategory'/>
				<input type='hidden' value="<c:url value='/'/>" name='location'/>

				<div class="noticeboard">
				<c:forEach var='list' items="${requestScope.list}">
					<ul>
					
					<c:forEach var="imagelist" items="${requestScope.imagelist}" varStatus="index">
						<li>
							
							<img src="<c:url value='/'/>img/${imagelist.img}" alt="${index.index+1}">
						
						</li>
					</c:forEach>	
						<li>작성자 : <span> ${list.borderNumber}</span> </li>
						<li>제품 : <span>${list.itemName }</span></li>
						<li>가격 : <span>${list.money }원</span></li>
						<li><a href="<c:url value="/"/>/front?command=read&border_number=${list.borderNumber}&id=${list.id}"><button>상세설명</button></a></li>
					
					</ul>
				</c:forEach>
	

				</div>
			</div>
		</section>
		<nav aria-label="Page navigation">
			<ul class="pagination">
				<c:forEach var="index" begin="1" end="${requestScope.pageNumber }">
				<c:choose>
					<c:when test="${index == 1 }">
					<li class="active"><a href="#" class="page">${index }</a></li>
					</c:when>
					<c:when test="${index < 6 }">
					<li><a href="#" class="page">${index }</a></li>
					</c:when>
					<c:when test="${index == 6 }">
					<li>
						<a href="#" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
					</c:when>
					<c:otherwise>
					
					</c:otherwise>
				</c:choose>
				</c:forEach>
			</ul>
			<div class="search">
				<ul>
					<li><select name="category">
					<option value="1">==카테고리==</option>
					<option value="전자제품">전자제품</option>
					<option value="의류">의류</option>	
					<option value="생활">생활</option>	
					<option value="가구">가구</option>	
					<option value="의료,의약">의료,의약</option>	
					<option value="사무용품">사무용품</option>								
					</select></li>
					<li><select name="subcategory">
					<option value="1">==서브카테고리==</option>
					</select></li>
					<li><input type="text" name="search" value="${requestScope.word }"></li>
					<li><span class="glyphicon glyphicon-search"></span></li>
				</ul>
			</div>
		</nav>
			
		<footer>
	
		<c:if test="${sessionScope.id != null}">
			<div class="noticeboardsubmit"><button type="button">게시물 올리기</button></div>
		</c:if>
		</footer>
	
				
		
    <script type="text/javascript" src="<c:url value="/"/>jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<c:url value="/"/>jquery/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
	<script type="text/javascript" src="<c:url value="/"/>jquery/smoothscroll-for-websites-master/SmoothScroll.js"></script>
	<script type="text/javascript" src="<c:url value="/"/>jquery/noticeboard_JQuery.js"></script>
	<script type="text/javascript" src="<c:url value="/"/>jquery/index_JQuery.js"></script>

	<script type="text/javascript">
	$(".noticeboardsubmit button").click(function(){
		document.location.href="<c:url value="/view/"/>board.jsp"
	});
	</script>
</body>
</html>





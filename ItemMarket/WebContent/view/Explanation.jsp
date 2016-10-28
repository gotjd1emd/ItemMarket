<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %> 


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>ItemMarket</title>
	<link rel="stylesheet" href="<c:url value="/"/>style/bootstrap-3.3.7-dist/css/bootstrap.css">
	<link rel="stylesheet" href="<c:url value="/"/>style/css.css">
</head>
<body>
	<section id ="main">
		<div class="subimg">
			<span class="up"><img src="<c:url value="/"/>image/arrowup.png" alt="ArrowUp">
			</span>
			<ul>
				<c:forEach var="imagelist" items="${requestScope.imagelist}" varStatus="index">
				
					<li><img src="<c:url value="/"/>${imagelist.img}" alt="${index.index}" onClick="slide(${index.index})"></li>
				</c:forEach>
			</ul>
			<span class="down"><img src="<c:url value="/"/>image/arrowdown.png" alt="ArrowDown"></span>

		</div>
		<div class="mainimg">
			<img src="<c:url value="/"/>image/sampleamcbook.jpg" alt="samplemacbook">
			<img src="<c:url value="/"/>image/samplemacbook2.jpg" alt="samplemacbook2">
			<img src="<c:url value="/"/>image/samplemacbook3.jpg" alt="samplemacbook3">
			<img src="<c:url value="/"/>image/samplemacbook4.jpg" alt="samplemacbook4">
		</div>	
		<div class="mainEx">
			<h1>&lt상품정보&gt</h1>
			<ul>
				<li hidden></li>
				<li>제품 : <span>${border.itemName}</span></li>
				<li>가격 : <span>${border.money}원</span>
				<li>등록날짜 : <span>${border.dayDate}</span>		
						</ul>	
						<h1>&lt판매자 정보&gt</h1>
						<ul>
							<li>아이디 : <span>${user.id}</span></li>
							<li>판매지역 : <span>${user.location}</span></li>
							<li>연락처 : <span>${user.tel}</span> </li>
						</ul>
						
						<button type="button">구매하기</button>
						<button type="button">뒤로가기</button>

					</div>
					<div class="content">
						<h1>${border.content}</h1>
					</div>
				</section>
				<script type="text/javascript" src="<c:url value="/"/>jquery/jquery-1.8.3.min.js"></script>
				<script type="text/javascript" src="<c:url value="/"/>jquery/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
				<link rel="stylesheet" href="<c:url value="/"/>jquery/jquery-ui-1.11.4.custom/jquery-ui.min.css">
				<script type="text/javascript" src="<c:url value="/"/>jquery/smoothscroll-for-websites-master/SmoothScroll.js"></script>
				<script type="text/javascript" src="<c:url value="/"/>jquery/Explanation_JQuery.js"></script>
				<script type="text/javascript">
				$(".mainEx button:last-child()").click(function(){
					document.location.href="<c:url value="/view/"/>noticeboard.jsp"
				});
				</script>
			</body>
			</html>





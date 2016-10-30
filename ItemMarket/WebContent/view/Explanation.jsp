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
				<c:forEach var="imagelist" items="${requestScope.border.imgList}" varStatus="index">			
					<li><img src="<c:url value="/"/>img/${imagelist}" alt="${index.index+1}" onClick="slide(${index.index+1})"></li>
				</c:forEach>
	
			</ul>
			<span class="down"><img src="<c:url value="/"/>image/arrowdown.png" alt="ArrowDown"></span>

		</div>
		<div class="mainimg">
	
			<c:forEach var="imagelist" items="${requestScope.border.imgList}" varStatus="index">	
					<img src="<c:url value="/"/>img/${imagelist}" alt="${index.index+1}" width=100%; height=417px;>
			</c:forEach>
		
		</div>	
		<div class="mainEx">
			<h1>&lt상품정보&gt</h1>
			<ul>
			
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
						<div class="purchasebtn">
						<button type="button" name="purchase" >구매하기</button>
						<button type="button">뒤로가기</button>
						</div>
					</div>
					<div class="content">
						<h1>설명</h1>
						<h3>${border.content}</h3>
					</div>
				</section>
				<div class="purchasedialog" title="구매하기">
					<section id="purchaseform">
						<input type="number" name="purchaseNumber" placeholder="구매할 금액을 입력해주세요">
						<input type="button" value="구매">
						<input type="button" value="취소">
					</section>
				</div>
				<script type="text/javascript" src="<c:url value="/"/>jquery/jquery-1.8.3.min.js"></script>
				<script type="text/javascript" src="<c:url value="/"/>jquery/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
				<link rel="stylesheet" href="<c:url value="/"/>jquery/jquery-ui-1.11.4.custom/jquery-ui.min.css">
				<script type="text/javascript" src="<c:url value="/"/>jquery/smoothscroll-for-websites-master/SmoothScroll.js"></script>
				<script type="text/javascript" src="<c:url value="/"/>jquery/Explanation_JQuery.js"></script>
				<script type="text/javascript">
				$(".mainEx button:last-child()").click(function(){
					document.location.href="<c:url value="/view/"/>index.jsp"
				});
				</script>
			</body>
			</html>





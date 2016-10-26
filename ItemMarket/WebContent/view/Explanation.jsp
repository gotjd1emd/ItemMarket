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
			<span class="up"></span>
			<ul>
			
				<li><img src="<c:url value="/"/>image/sampleamcbook.jpg" alt="samplemacbook" onClick="slide(1)"></li>
				<li><img src="<c:url value="/"/>image/samplemacbook2.jpg" alt="samplemacbook2" onClick="slide(2)" ></li>
				<li><img src="<c:url value="/"/>image/samplemacbook3.jpg" alt="samplemacbook3" onClick="slide(3)"></li>
				<li><img src="<c:url value="/"/>image/samplemacbook4.jpg" alt="samplemacbook4" onClick="slide(4)"></li>
				<li><img src="<c:url value="/"/>image/samplemacbook4.jpg" alt="samplemacbook4" onClick="slide(4)"></li>
				<li><img src="<c:url value="/"/>image/samplemacbook4.jpg" alt="samplemacbook4" onClick="slide(4)"></li> 	
				
			</ul>
			<span class="down"></span>

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
				<li>제품 : <span>MacBook</span></li>
				<li>가격 : <span>0원</span>
					<li>등록날짜 : <span>2016-10-24</span>		
						<li>판매 방식 : <span>직거래</span>
						</ul>	
						<h1>&lt판매자 정보&gt</h1>
						<ul>
							<li>아이디 : <span>JinYongHyeon</span></li>
							<li>판매지역 : <span>판매지역</span></li>
							<li>연락처 : <span>010-1234-5678</span> </li>
						</ul>
						
						<button type="button">구매하기</button>
						<button type="button">뒤로가기</button>

					</div>
					<div class="content">
						<h1>Content설명구간</h1>
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





<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>ItemMarket</title>
<link rel="stylesheet"	href="<c:url value="/"/>jquery/jquery-ui-1.11.4.custom/jquery-ui.min.css">
<link rel="stylesheet"	href="<c:url value="/"/>style/bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet" href="<c:url value="/"/>style/css.css">
<jsp:include page="header.jsp"></jsp:include>
<script>


</script>
</head>
<body>
	<div class="bg">
		<img src="<c:url value="/"/>image/bg.jpg" alt="bg1"><img
			src="<c:url value="/"/>image/bg2.jpg" alt="bg2">
	</div>
	<section id="search">
		<h1>ItemMarket</h1>

		<div class="searchmain">
			<ul>
				<li><input type="text"></li>
				<li><span class="glyphicon glyphicon-search" ></span></li>
				<li><span id="sub">카테고리</span></li>
			</ul>
		<div class="sub_category" >
			<ul>
			</ul>
		</div>
	</div>

	</section>
	
	<!-- 큰 카테고리 dialog  -->
		<div class="category" title="카테고리">
		<ul>
		<li>전자제품</li>
		<li>의류</li>
		<li>생활</li>
		<li>가구</li>
		<li>의류,의학</li>
		<li>사무용품</li>
		</ul>
	</div>

	<script type="text/javascript"  src="<c:url value="/"/>jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript"	src="<c:url value="/"/>jquery/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
	<script type="text/javascript"	src="<c:url value="/"/>jquery/index_JQuery.js"></script>
	<script type="text/javascript">
	
	</script>
</body>
</html>





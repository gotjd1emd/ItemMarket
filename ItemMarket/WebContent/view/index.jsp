<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
  	<link rel="stylesheet" href="<c:url value="/"/>style/bootstrap-3.3.7-dist/css/bootstrap.css">
	<link rel="stylesheet" href="<c:url value="/"/>style/css.css">
</head>
<body>
  <div class="bg">
  
		  <img src="<c:url value="/"/>image/bg.jpg" alt="bg1"><img src="<c:url value="/"/>image/bg2.jpg" alt="bg2">
	</div>
	<header>

		<div class="menu">
			<ul>
			
				<li>회원가입</li>
				<li>로그인</li>
			</ul>
		</div>

	</header>
	<section id="search">
		<h1>Null중고나라</h1>

		<div class="searchmain">
			<ul>
				<li><input type="text"></li>
				<li><span class="glyphicon glyphicon-search" ></span></li>
					<li><span id="sub">카테고리</span></li>
				</ul>
				<div class="sub_category" >
					<ul>
						<li>test1</li>
						<li>test2</li>
						<li>test3</li>
						<li>test4</li>

					</ul>
				</div>	
			</div>
		</section>
		<div class="category" title="카테고리">
			<ul>
			<li>큰 카테고리1</li>
			<li>큰 카테고리2</li>
			<li>큰 카테고리3</li>
			<li>큰 카테고리4</li>
			<li>큰 카테고리5</li>
			<li>큰 카테고리6</li>
			<li>큰 카테고리7</li>
			<li>큰 카테고리8</li>
			</ul>
		</div>
		

	<script type="text/javascript" src="<c:url value="/"/>jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<c:url value="/"/>jquery/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="<c:url value="/"/>jquery/jquery-ui-1.11.4.custom/jquery-ui.min.css">
	<script type="text/javascript" src="<c:url value="/"/>jquery/jquery.js"></script>
</body>
</html>





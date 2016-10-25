<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %> 


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <link rel="stylesheet" href="<c:url value="/"/>style/css.css">
</head>
<body>
  <body>
	<!-- <h1 style="text-align: center;">카테고리 </h1> -->
	<section id = "selectmain">

		<div class ="selectsub">	
			<span><img src="<c:url value="/"/>image/Electronic.png" alt="전자제품">Electronic.html</span>
			<div class="sub_text"><h1>전자제품</h1></div>
		</div>

		<div class="selectsub">
			<span><img src="<c:url value="/"/>image/clothing.jpg" alt="의류">dd</span>
			<div class="sub_text"><h1>의류</h1></div>
		</div>
		<div class="selectsub">
			<img src="<c:url value="/"/>image/stuff.jpeg" alt="생활">
			<div class="sub_text"><h1>의류</h1></div>
		</div> 
		<div class="selectsub">
		<img src="<c:url value="/"/>image/furniture.jpg" alt="가구">
			<div class="sub_text"><h1>가구</h1></div>
		</div>

		<div class="selectsub">
			<img src="<c:url value="/"/>image/Medical.jpg" alt="의료 , 의학">
			<div class="sub_text"><h1>의료 , 의약</h1></div>
		</div>
		<div class ="selectsub">
			<img src="<c:url value="/"/>image/Office Supplies.jpg" alt="사무용품">
			<div class="sub_text"><h1>사무용품</h1></div>
		</div>	


	</div>
	<script type="text/javascript" src="<c:url value="/"/>jquery/jquery-2.2.4.min.js"></script>
	<script type="text/javascript" src="<c:url value="/"/>jquery/jquery.js"></script>
</body>
</html>





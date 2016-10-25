<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %> 


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Null의 중고나라</title>
  <link rel="stylesheet" href="<c:url value="/"/>style/css.css">
</head>
<body>
  <body>
	<!-- <h1 style="text-align: center;">카테고리 </h1> -->
	<section id = "selectmain">

		<div class ="selectsub">	
			<img src="<c:url value="/"/>image/Electronic.png" alt="전자제품">
			<div class="sub_text"><h1>전자제품</h1></div>
		</div>

		<div class="selectsub">
			<img src="<c:url value="/"/>image/clothing.jpg" alt="의류">
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
	</section>
    <script type="text/javascript" src="<c:url value="/"/>jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<c:url value="/"/>jquery/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="<c:url value="/"/>jquery/jquery-ui-1.11.4.custom/jquery-ui.min.css">
	<script type="text/javascript" src="<c:url value="/"/>jquery/smoothscroll-for-websites-master/SmoothScroll.js"></script>
	<script type="text/javascript" src="<c:url value="/"/>jquery/jquery.js"></script>

	<div class="dialog" title="전자제품">
		<ul>
		<li>1</li>
		<li>2</li>
		<li>3</li>
		</ul>
	</div>

	
</body>
</html>





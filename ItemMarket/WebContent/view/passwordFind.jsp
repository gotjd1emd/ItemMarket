<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>ItemMarket</title>
	<link rel="stylesheet" href="<c:url value="/"/>style/css.css">
</head>
<body>
	<section id="passwordFindForm">
		<div class="passwordform">
		<h1> <img src="<c:url value="/"/>image/lock.png" alt="자물쇠 아이콘">비밀번호 찾기</h1>
		<p><span>비밀번호</span>를 찾고자 하는 <span>아이디를 입력</span>해주세요.</p>
		<input type="text" name="id" placeholder="아이디를 입력해주세요"><input type="button" name="전송" value="확인">
		<span id="passfind"></span>
		<button type="button">메인으로 가기</button>
		</div>
	</section>
		<script type="text/javascript"  src="<c:url value="/"/>jquery/jquery-1.8.3.min.js"></script>
		<script type="text/javascript"	src="<c:url value="/"/>jquery/passwordFind.js"></script>
</body>
</html>

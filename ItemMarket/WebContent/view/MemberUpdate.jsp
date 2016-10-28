<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ItemMarket</title>
<link rel="stylesheet" href="<c:url value="/"/>style/css.css">
<body>
<div class="container">
<div class="privacy">
	 <h3>개인정보 수정</h3>
	<form action="" post="">
	<ul>
	<li>아이디</li>
	<li><input type="text" name="id" readonly="readonly"></li>
	<li>이메일</li>
	<li><input type="email" name="email"></li>
	<li>전화번호</li>
	<li><input type="tel" name="tel"></li>
	<li>주소</li>
	<li><input type="text" name ="addr"></li>
	</ul>
	<div class="memberupdatesubmit">
	<input type="submit" value="확인"><input type="button" value="취소">
	</div>
	</form>
</div>
	
	<div class="passwordchage"><h3>비밀번호 변경</h3>
	<ul>
	<li>비밀번호</li>
	<li>
		<ul>
			<li><input type="password" name="password" placeholder="현재 비밀번호"></li>
			<li><input type="password" name="newpassword" placeholder="현재 비밀번호"></li>
			<li><input type="password" name="newpassowrd2" placeholder="현재 비밀번호"></li>
		</ul>
	</li>
	</ul> 
	<div class="passwordchagesubmit">
	<input type="submit" value="확인"><input type="button" value="취소">
	</div>
	</div>
	<script type="text/javascript" src="<c:url value="/"/>jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<c:url value="/"/>jquery/smoothscroll-for-websites-master/SmoothScroll.js"></script>
</body>
</html>





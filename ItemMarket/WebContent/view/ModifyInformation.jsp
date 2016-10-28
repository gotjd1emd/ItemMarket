<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ItemMarket</title>
<link rel="stylesheet"	href="<c:url value="/"/>jquery/jquery-ui-1.11.4.custom/jquery-ui.min.css">
<link rel="stylesheet" href="<c:url value="/"/>style/css.css">
<body>

<div id="memberform">
	<div class="memberupdate">
		회원정보 수정
	</div>
	
	<div class="memberdrop">
		회원 탈퇴
	</div>
</div>
	<div class="passwordCheck" title="비밀번호 재확인">
		<section id="passwordCheckform">	
		<h1> <img src="<c:url value="/"/>image/lock.png" alt="자물쇠 아이콘">비밀번호 재확인</h1>
	
		<p>보안을위해서 회원님의 비밀번호를 다시한번 입력해주세요</p>
		<p>개인정보 변경에서는 비밀번호 변경 , 주소/전화번호 등의 정보를 확인, 수정하실 수 있습니다.</p>
		<form action="" post="post" onsubmit="return checkValue()">
		<input type="text" name="id" readonly="readonly"> <input type="password" name="password" placeholder="비밀번호를 입력해주세요"> <input type="submit" value="확인">
		</form>
		</section>
	</div>
	
	<script type="text/javascript"  src="<c:url value="/"/>jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript"	src="<c:url value="/"/>jquery/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
	<script type="text/javascript" src="<c:url value="/"/>jquery/ModifyInformation.js"></script>
</body>
</html>





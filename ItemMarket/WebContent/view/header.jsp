<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<body>
	<header>
		<div class="menu">
			<ul>
				<li>로그인</li>
				<li>회원가입</li>
				<li>프로필</li>
			</ul>
		</div>
	</header>
			<section id="profile">
			<div class="profilemenu">
				<ul>
					<li><img src="<c:url value="/"/>image/player.png" alt="myimg">
					<li>아이디 : <span></span></li>
					<li>마일리지 : <span></span></li>
					<li>전화번호 : <span></span></li>
					<li>이메일 : <span></span></li>
					<li>마일리지내역확인</li>
					<li>프로필수정</li>
				</ul>
			</div>
		</section>
</body>
</html>





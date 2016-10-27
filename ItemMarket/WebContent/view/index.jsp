<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>ItemMarket</title>
<link rel="stylesheet"	href="<c:url value="/"/>jquery/jquery-ui-	1.11.4.custom/jquery-ui.min.css">
<link rel="stylesheet"	href="<c:url value="/"/>style/bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet" href="<c:url value="/"/>style/css.css">
<jsp:include page="header.jsp"></jsp:include>
<script>
function checkValid(){
	var f= window.document.signForm;
	
	if(f.id.value==""){
		alert("아이디를 입력해주세요.");
		f.id.focus();
		return false;
	}
	if(f.password.value==""){
		alert("비밀번호를 입력해주세요.");
		f.pw.focus();
		return false;
	}
	if(f.tel.value==""){
		alert("전화번호를 입력해주세요.");
		f.tel.focus();
		return false;
	}
	
	if(f.addr.value==""){
		alert("주소를 입력해주세요.");
		f.addr.focus();
		return false;
	}
}

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

	<!-- 회원가입 dialog  -->
	
	<div class="memberupdialog" title="회원가입">
		<section id="memberup">
				<div class="memberupform">
					<form name="signForm" action="../front?command=signup" method="post" onSubmit="return checkValid()">
						<ul>
							<li>아이디</li>
							<li><input type="text" name="id" placeholder="아이디를 입력해주세요"><span class="check"></span></li>
							<li>비밀번호</li>
							<li><input type="password" name="password" placeholder="비밀번호를 입력해주세요"></li>
							<li>전화번호</li>
							<li><input type="tel" name="tel" placeholder="전화번호를 입력해주세요"></li>
							<li>이메일</li>
							<li><input type="email" name="email" placeholder="이메일을 입력해주세요"></li>
							<li>주소</li>
							<li><input type="text" name="addr" placeholder="주소를 입력해주세요"></li>
						</ul>
						<input type="number" name="cash" readonly="readonly" value="0"hidden="hidden">
						<div class="memberupsubmit">
						<input type="submit" value="전송"><input type="button" value="취소">
						</div>
					</form>
			</div>
		</section>
		
		<!-- 로그인 dialog -->
		<div class="logindialog" title="로그인">
		<section id="loginform">
			<form name="login" action="../front?command=login" method="post">
			<ul>
				<li>아이디</li><li> <input type="text" name="id" placeholder="아이디를 입력해주세요"></li>
				<li>비밀번호</li><li><input type="password" name="password" placeholder="비밀번호를 입력해주세요"></li>		
			</ul>
			<div class="loginsubmit">
				<input type="submit" value="로그인">
			</div>
			</form>
		 </section>
		</div>
		
	</div>
		
		
	

	<script type="text/javascript"
		src="<c:url value="/"/>jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript"
		src="<c:url value="/"/>jquery/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
	
	<script type="text/javascript"
		src="<c:url value="/"/>jquery/index_JQuery.js"></script>
</body>
</html>





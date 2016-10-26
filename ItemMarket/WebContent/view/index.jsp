<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>ItemMarket</title>
<link rel="stylesheet"
		href="<c:url value="/"/>jquery/jquery-ui-1.11.4.custom/jquery-ui.min.css">
<link rel="stylesheet"
	href="<c:url value="/"/>style/bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet" href="<c:url value="/"/>style/css.css">
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
		f.id.focus();
		return false;
	}
	if(f.tel.value==""){
		alert("전화번호를 입력해주세요.");
		f.id.focus();
		return false;
	}
	
	if(f.addr.value==""){
		alert("주소를 입력해주세요.");
		f.id.focus();
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
	
		<header>

		<div class="menu">
	
			<ul>
				<li>회원가입</li>
				<li>로그인</li>
			</ul>
		</div>
	</header>
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
			<li><img src="<c:url value="/"/>image/Electronic.png" alt="전자제품">
				<div class="sub_text">
					<h4>전자제품</h4>
				</div></li>
			<li><img src="<c:url value="/"/>image/clothing.jpg" alt="의류">
				<div class="sub_text">
					<h4>의류</h4>
				</div></li>
			<li><img src="<c:url value="/"/>image/stuff.jpeg" alt="생활">
				<div class="sub_text">
					<h4>의류</h4>
				</div></li>
			<li><img src="<c:url value="/"/>image/furniture.jpg" alt="가구">
				<div class="sub_text">
					<h4>
						가구
						</h1>
				</div></li>
			<li><img src="<c:url value="/"/>image/Medical.jpg" alt="의료 , 의학">
				<div class="sub_text">
					<h4>의료 , 의약</h4>
				</div></li>
			<li><img src="<c:url value="/"/>image/Office Supplies.jpg"
				alt="사무용품">
				<div class="sub_text">
					<h4>사무용품</h4>
				</div></li>
		</ul>
	</div>

	<!-- 회원가입 dialog  -->
	
	<div class="memberupdialog" title="회원가입">
		<section id="memberup">
				<div class="memberupform">
					<form name="signForm" action="../front?command=signup" method="post" onSubmit='return checkValid()'>
						<ul>
							<li>아이디</li>
							<li><input type="text" name="id" placeholder="아이디를 입력해주세요"><span class="check"></span></li>
							<li>비밀번호</li>
							<li><input type="password" name="password" placeholder="비밀번호를 입력해주세요"></li>
							<li>전화번호</li>
							<li><input type="text" name="tel" placeholder="전화번호를 입력해주세요"></li>
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





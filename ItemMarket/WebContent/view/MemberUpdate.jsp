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
	 <form name="updateform" id="updateform" method="updateform">
	 <input type="password" name="checkpass" value="${sessionScope.userProfile.password}" hidden >
	<ul>
	<li>아이디</li>
	<li><input type="text" name="id" readonly="readonly" value="${sessionScope.userProfile.id}" ></li>
	<li>이메일</li>
	<li><input type="email" name="email" value="${sessionScope.userProfile.email}" ></li>
	<li>전화번호</li>
	<li><input type="tel" name="tel" value="${sessionScope.userProfile.tel}" ></li>
	<li>주소</li>
	<li><input type="text" name ="location" value="${sessionScope.userProfile.location}" ></li>
	</ul>
	<div class="memberupdatesubmit">
	<input type="button" value="확인"><input type="button" value="취소">
	</div>
	</form>
</div>
	
	<div class="passwordchage"><h3>비밀번호 변경</h3>
	<ul>
	<li>비밀번호</li>
	<li>
	<form id="passwordUpdate" name="passwordUpdate" method="post">
	 <input type="text" name="checkid" value="${sessionScope.userProfile.id}" hidden>
		<ul>
			<li><input type="password" name="password" placeholder="현재 비밀번호"></li>
			<li><input type="password" name="newpassword" placeholder="변경될 비밀번호"></li>
			<li><input type="password" name="newpassowrd2" placeholder="변경될 비밀번호 재확인"></li>
		</ul>
		</form>
	</li>
	</ul> 
	<div class="passwordchagesubmit">
	<input type="submit" value="확인"><input type="button" value="취소">
	</div>
	</div>
	<script type="text/javascript" src="<c:url value="/"/>jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<c:url value="/"/>jquery/ModifyInformation.js"></script>
	<script type="text/javascript" src="<c:url value="/"/>jquery/smoothscroll-for-websites-master/SmoothScroll.js"></script>
	<script type="text/javascript" src="<c:url value="/"/>jquery/MemberUpdate.js">
<!--

//-->
</script>
	<script type="text/javascript">
		$(document).ready(function(){
			if($(".privacy ul li input[name=id]").val() == "" && $(".privacy input[name=checkpass]").val() == ""){
				alert("잘 못 접근하셨습니다.");
				document.location.href="index.jsp";
			}
		});
	</script>
</body>
</html>





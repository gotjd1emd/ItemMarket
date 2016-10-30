<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"  src="<c:url value="/"/>jquery/jquery-1.8.3.min.js"></script>
</head>
<body>
	<header>
		<div class="menu">
		<span class="logo"><a href="<c:url value="/"/>view/index.jsp">ItemMarket</a></span>
			<ul>
			<c:choose>
			<c:when test="${sessionScope.userProfile.id == null}">
				<li id="loginbtn">로그인</li>
				<li id="sigupbtn">회원가입</li>
			</c:when>
			<c:otherwise>
			<li>${sessionScope.userProfile.id}님 안녕하세요	</li>
				<li id="profilebtn">프로필</li>
				<li id="charge">마일리지 충전</li>
				<li id="logoutbtn">로그아웃</li>
			</c:otherwise>	
			</c:choose>
			</ul>
		</div>
	</header>
	
	<section id="profile">
		<div class="profilemenu">
			<ul>
			
				<li><img src="<c:url value="/"/>image/player.png" alt="myimg"><span style="cursor: pointer; top:0; left:0; position: absolute; padding:10px"
					class="glyphicon glyphicon-remove"></span>
					<div class="beaf">
					<img src="<c:url value="/"/>image/after.png" alt="before">
					<img src="<c:url value="/"/>image/before.png" alt="after">
					</div>
					</li>
				<div class="before">
				<li>아이디 : <span id="saveId">${sessionScope.userProfile.id}</span></li>
				<li>마일리지 : ${sessionScope.userProfile.cash}<span></span></li>
				<li>전화번호 : <span> ${sessionScope.userProfile.tel}</span></li>
				<li>이메일 : <span> ${sessionScope.userProfile.email}</span></li>
				<li>주소 : <span>${sessionScope.userProfile.location}</span></li>
			
			
				<form name="chatForm"  >
					<li><textarea id="chatWindow" rows="5" cols="50" readonly="readonly"></textarea></li>
					<li><input type="text" id="partnerId" name="partnerId" size="5" placeholder="귓속말 걸 상대를 입력해주세요"/></li>
					<li><input type="text" id="message" size="20" placeholder="채팅을 입력해주세요"/></li>
					<li><input type="button" id="submit" value="전송" onclick="chatIdCheck()"/></li>
				</form>
			
				</div>
				<div class="after">
				<li><a href="<c:url value="/"/>view/ModifyInformation.jsp?id=${sessionScope.userProfile.id}">프로필수정</a></li>
				<li id="transactionsEvent">거래내역확인</li>
				<li id="cashTransactionsEvent">마일리지거래내역</li>
				<li id="purchaseapply">구매신청란</li>
				</div>
			</ul>
		</div>
	</section>

	<!-- 충전 dialog -->
	<div class="chargedialog" title="마일리지 충전">
		<section id="chargeform">
			<h3>현재 ${sessionScope.userProfile.id}님의 마일리지  : ${sessionScope.userProfile.cash} </h3>
			<input type="number" name="chargeNumber" placeholder="충전할 금액을 적어주십시오">
			<input type="button" value="충전">
			<input type="button" value="취소">
		</section>
	</div>


	<!-- 회원가입 dialog  -->

	<div class="memberupdialog" title="회원가입">
		<section id="memberup">
			<div class="memberupform">
				<form name="signForm" id="singForm" method="post">
					<ul>
						<li>아이디</li>
						<li><input type="text" name="id" placeholder="아이디를 입력해주세요""><span
							id="check"></span></li>
						<li>비밀번호</li>
						<li><input type="password" name="password"
							placeholder="비밀번호를 입력해주세요"></li>
						<li>전화번호</li>
						<li><input type="tel" name="tel" placeholder="전화번호를 입력해주세요"></li>
						<li>이메일</li>
						<li><input type="email" name="email"
							placeholder="이메일을 입력해주세요"></li>
						<li>주소</li>
						<li><input type="text" name="addr" placeholder="주소를 입력해주세요"></li>
					</ul>
					<input type="number" name="cash" readonly="readonly" value="0"
						hidden="hidden">
					<div class="memberupsubmit">
						<input type="button" value="전송"><input type="button"
							value="취소">
					</div>
				</form>
			</div>
		</section>
	</div>
		<!-- 로그인 dialog -->
		<div class="logindialog" title="로그인">
			<section id="loginform">
				<form name="login"  id="login" method="post" >
					<ul>
						<li>아이디</li>
						<li><input type="text" id="id" name="id" placeholder="아이디를 입력해주세요"></li>
						<li>비밀번호</li>
						<li><input type="password" id="password" name="password"
							placeholder="비밀번호를 입력해주세요"></li>
					</ul>
					<div class="loginsubmit">
						<input type="button" value="로그인">
						<input type="button" name="searchpassword" value="비밀번호찾기">
					</div>
				</form>
			</section>		
		</div>
	
	<!-- 거래내역  -->
	<div class="Transactions" title="거래내역">
		<section id="Transactionsfrom">

		</section>
	</div>
	<!-- 마일리지 거래내역 -->
	<div class="Mileagetransactions" title="마일리지거래내역">
		<section id="Mileagetransactionsform">
		
		</section>
	</div>
	<!-- 구매신청란 dialog -->
	<div class="purchaselistdialog">
		<section id="purchaselistform">
		<table>
			<td>글번호</td>
			<td>물품이름</td>
			<td>가격</td>
			<td>확인</td>
			<td>취소</td>
		</table>
		</section>
	</div>
	<script type="text/javascript">
		function checkValid() {
			var f = window.document.signForm;
			console.log(f.id.value);
			console.log(f.password.value);
	
			if (f.id.value == "") {
				alert("아이디를 입력해주세요.");
				f.id.focus();
				return false;
			}
			if (f.password.value == "") {
				alert("비밀번호를 입력해주세요.");
				f.password.focus();
				return false;
			}
			if (f.tel.value == "") {
				alert("전화번호를 입력해주세요.");
				f.tel.focus();
				return false;
			}

			if (f.email.value == "") {
				alert("이메일을 입력해주세요");
				f.email.focus();
				return false;
			}

			if (f.addr.value == "") {
				alert("주소를 입력해주세요.");
				f.addr.focus();
				return false;
			}
			return true;
		}
		function idAndPwCheck(){
			if($(".loginform ul li input[name=id]").val() == ""){
				alert("아이디를 입력해주세요")
				$(".loginform ul li input[name=id]").focus();
				return false;
			}
			if($(".loginform ul li input[name=password]").val() == ""){
				alert("비밀번호를 입력해주세요")
				$(".loginform ul li input[name=password]").focus();
				return false;
			}
			return true;
		}
		
		function logincheckValid() {
			var f2 = window.document.login;
			console.log(f2.id.value);
			console.log(f2.password.value);
			if (f2.id.value == "") {
				alert("아이디를 입력해주세요.");
				f2.id.focus();
				return false;
			}
			if (f2.password.value == "") {
				alert("비밀번호를 입력해주세요.");
				f2.pw.focus();
				return false;
			}
			return true;
		}
		function chatIdCheck(){
			var f3 = window.document.chatForm;
			if(f3.partnerId.value == ""){
				alert("상대방의 ID를 입력해주세요");
				return false;
			}else{
				send();
			}
			
		}
		var webSocket;
		$(document).ready(function() {
			var userID =  $("#saveId").text();
			var url = 'ws://localhost:8000/ItemMarket/webSocket/' + userID;
			var partnerId = document.getElementById('partnerId');
			var inputMessage = document.getElementById('message');
			var textarea = document.getElementById("chatWindow");
			
			console.log("loginCheck :" + $("#loginCheck").val());
			console.log("session login : ${sessionScope.loginCheck}");
			if('${sessionScope.loginCheck}' == '1') {
				webSocket = new WebSocket(url);	
			}
			
			if(webSocket!=null) {
				webSocket.onerror = function(event) {
					onError(event)
				};
				webSocket.onopen = function(event) {
					onOpen(event)
				};
				webSocket.onmessage = function(event) {
					onMessage(event)
				};
			}
			function onMessage(event) {
				textarea.value += event.data + "\n";
			}
			function onOpen(event) {
				textarea.value += "연결 성공\n";
			}
			function onError(event) {
				alert(event.data);
			}
		});
		function send() {
			$("#chatWindow").val($("#chatWindow").val() + "본인 : " + $("#message").val() + "\n");
			webSocket.send($("#partnerId").val()+"|"+$("#message").val());
			$("#message").val("");
		}
	</script>
</body>
</html>





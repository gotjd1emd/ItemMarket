<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %> 


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>ItemMarket</title>
     <link rel="stylesheet" href="<c:url value="/"/>style/bootstrap-3.3.7-dist/css/bootstrap.css">
	<link rel="stylesheet" href="<c:url value="/"/>style/css.css">
	<style>
		header .menu{width:100%;  position: relative; z-index: 3;}
		header .menu ul{width:100%; height: 50px; text-align: center;  }
		header .menu ul li{float:right; width:124px; height:50px; color:#000;  line-height: 50px; margin-left:3%; position: relative; overflow: hidden; cursor: pointer; border:1px solid #000; transition:0.4s;}
		header .menu ul li:hover{background:#000; color:#fff;}

		/* header .menu ul li:nth-child(1)::before{display: none;}
		header .menu ul li:nth-child(1)::after{display: none;}
		
		header .menu ul li::before{content: ""; width:100%; height: 5px; background:blue; float:left; position: absolute; top:0; left:-100%; transition: 0.4s; }
		header .menu ul li::after{content: ""; width:100%; height: 5px; background:blue; float:left; position: absolute; bottom: 0; left:100%; transition: 0.4s; }

		header .menu ul li:hover::before{content:"";  left:0px; }
		header .menu ul li:hover::after{content:"";  left:0px; } */

	</style>
</head>
<body>
<header>

		<div class="menu">
			<div class="container">
		<a href="<c:url value='/view/'/>index.jsp"><div class="icon"><img src="<c:url value='/'/>/image/icon.png" alt="icon"></div></a>
		</div>
			<ul>	
				<li>회원가입</li>
				<li>로그인</li>
			</ul>
		</div> 
		<div class="container">
			<!-- <div class="icon">
				<a href="/index.html"><h1>Null중고나라</h1></a>
			</div> -->
			<div class="search">
				<ul>
					<li><input type="text" name="search" value="${requestScope.word }"></li>
					<li><span class="glyphicon glyphicon-search"></span>
					</ul>
				</div>
			</div>


		</header>
		<section id="board">
			<div class="container">

				<div class="boardtitle">${requestScope.category }  ${requestScope.subCategory } 카테고리</div>
				<input type='hidden' value='${requestScope.category }' name='category'/>
				<input type='hidden' value='${requestScope.subCategory }' name='subCategory'/>
				<input type='hidden' value="<c:url value='/'/>" name='location'/>

				<div class="noticeboard">
				<c:forEach var='list' items="${requestScope.list }">
					<ul>
						<li><img src="<c:url value="/"/>image/sampleamcbook.jpg" alt="noticeboard"></li>
						<li>작성자 : <span>${list.id }</span></li>
						<li>제품 : <span>${list.itemName }</span></li>
						<li>가격 : <span>${list.money }원</span></li>
						<li><a href="view/Explanation.jsp"><button>상세설명</button></a></li>
					</ul>
				</c:forEach>

				</div>
			</div>
		</section>
		<nav aria-label="Page navigation">
			<ul class="pagination">
				<li>
					<a href="#" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
				<li class="active"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li>
					<a href="#" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</ul>
		</nav>
		<footer>
			<div class="noticeboardsubmit"><button type="button">게시물 올리기</button></div>
		</footer>
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
				
		
    <script type="text/javascript" src="<c:url value="/"/>jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<c:url value="/"/>jquery/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="<c:url value="/"/>jquery/jquery-ui-1.11.4.custom/jquery-ui.min.css">
	<script type="text/javascript" src="<c:url value="/"/>jquery/smoothscroll-for-websites-master/SmoothScroll.js"></script>
	<script type="text/javascript" src="<c:url value="/"/>jquery/noticeboard_JQuery.js"></script>
	<script type="text/javascript" src="<c:url value="/"/>jquery/index_JQuery.js"></script>
<!--

//-->
</script>
	<script type="text/javascript">
	$(".noticeboardsubmit button").click(function(){
		document.location.href="<c:url value="/view/"/>board.jsp"
	});
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
</body>
</html>





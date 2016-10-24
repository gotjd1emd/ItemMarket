<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %> 


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
      <link rel="stylesheet" href="<c:url value="/"/>style/bootstrap-3.3.7-dist/css/bootstrap.css">
	<link rel="stylesheet" href="<c:url value="/"/>style/css.css">
</head>
<body>
<header>
		<div class="menu">	
			<ul>
				<li><a href="/index.html">Null의 중고나라</a></li>
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
					<li><input tpye="tetx" name="search"></li>
					<li><span class="glyphicon glyphicon-search"></span>
					</ul>
				</div>
			</div>


		</header>
		<section id="board">
			<div class="container">
				<div class="boardtitle">00 카테고리</div>
				<div class="noticeboard">
					<ul>
						<li><img src="<c:url value="/"/>image/sampleamcbook.jpg" alt="noticeboard"></li>
						<li>작성자 : <span>yonghyun08</span></li>
						<li>제품 : <span>MacBook(맥북)</span></li>
						<li>가격 : <span>0원</span></li>
						<li><a href="Explanation.html"><button>상세설명</button></a></li>
					</ul>
					<ul>
						<li><img src="<c:url value="/"/>image/sampleamcbook.jpg" alt="noticeboard"></li>
						<li>작성자 : <span>yonghyun08</span></li>
						<li>제품 : <span>MacBook(맥북)</span></li>
						<li>가격 : <span>0원</span></li>
						<li><a href="Explanation.html"><button>상세설명</button></a></li>
					</ul>
					<ul>
						<li><img src="<c:url value="/"/>image/sampleamcbook.jpg" alt="noticeboard"></li>
						<li>작성자 : <span>yonghyun08</span></li>
						<li>제품 : <span>MacBook(맥북)</span></li>
						<li>가격 : <span>0원</span></li>
						<li><a href="Explanation.html"><button>상세설명</button></a></li>
					</ul>
					<ul>
						<li><img src="<c:url value="/"/>image/sampleamcbook.jpg" alt="noticeboard"></li>
						<li>작성자 : <span>yonghyun08</span></li>
						<li>제품 : <span>MacBook(맥북)</span></li>
						<li>가격 : <span>0원</span></li>
						<li><a href="Explanation.html"><button>상세설명</button></a></li>
					</ul>
					<ul>
						<li><img src="<c:url value="/"/>image/sampleamcbook.jpg" alt="noticeboard"></li>
						<li>작성자 : <span>yonghyun08</span></li>
						<li>제품 : <span>MacBook(맥북)</span></li>
						<li>가격 : <span>0원</span></li>
						<li><a href="Explanation.html"><button>상세설명</button></a></li>
					</ul>
					<ul>
						<li><img src="<c:url value="/"/>image/sampleamcbook.jpg" alt="noticeboard"></li>
						<li>작성자 : <span>yonghyun08</span></li>
						<li>제품 : <span>MacBook(맥북)</span></li>
						<li>가격 : <span>0원</span></li>
						<li><a href="Explanation.html"><button>상세설명</button></a></li>
					</ul>
					

				</div>
			</div>
		</section>
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
		<footer>
			<div class="noticeboardsubmit"><button type="button">게시물 올리기</button></div>
		</footer>
    <script type="text/javascript" src="<c:url value="/"/>jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<c:url value="/"/>jquery/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="<c:url value="/"/>jquery/jquery-ui-1.11.4.custom/jquery-ui.min.css">
	<script type="text/javascript" src="<c:url value="/"/>jquery/smoothscroll-for-websites-master/SmoothScroll.js"></script>
	<script type="text/javascript" src="<c:url value="/"/>jquery/jquery.js"></script>
</body>
</html>





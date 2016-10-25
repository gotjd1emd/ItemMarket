<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %> 


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Null의 중고나라</title>
      <link rel="stylesheet" href="<c:url value="/"/>style/bootstrap-3.3.7-dist/css/bootstrap.css">
	<link rel="stylesheet" href="<c:url value="/"/>style/css.css">
	<style>
		header .menu{width:100%;  position: relative; z-index: 3;}
		header .menu ul{width:100%; height: 50px; text-align: center;  }
		header .menu ul li{float:right; width:124px; height:50px; color:#000;  line-height: 50px; margin-left:3%; position: relative; overflow: hidden; cursor: pointer; border:1px solid #000;}
		header .menu ul li:nth-child(1){float:left; border:none; font-size:36px; overflow: visible; width:270px;}
		header .menu ul li:nth-child(1) a{text-decoration: none; color:inherit;}
		header .menu ul li:nth-child(1)::before{display: none;}
		header .menu ul li:nth-child(1)::after{display: none;}
		
		header .menu ul li::before{content: ""; width:100%; height: 5px; background:blue; float:left; position: absolute; top:0; left:-100%; transition: 0.4s; }
		header .menu ul li::after{content: ""; width:100%; height: 5px; background:blue; float:left; position: absolute; bottom: 0; left:100%; transition: 0.4s; }

		header .menu ul li:hover::before{content:"";  left:0px; }
		header .menu ul li:hover::after{content:"";  left:0px; }

	</style>
</head>
<body>
<header>
		<div class="menu">	
			<ul>
				<li><a href="<c:url value='/view/'/>index.jsp">Null의 중고나라</a></li>
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
						<li><a href="Explanation.jsp"><button>상세설명</button></a></li>
					</ul>
					<ul>
						<li><img src="<c:url value="/"/>image/sampleamcbook.jpg" alt="noticeboard"></li>
						<li>작성자 : <span>yonghyun08</span></li>
						<li>제품 : <span>MacBook(맥북)</span></li>
						<li>가격 : <span>0원</span></li>
						<li><a href="Explanation.jsp"><button>상세설명</button></a></li>
					</ul>
					<ul>
						<li><img src="<c:url value="/"/>image/sampleamcbook.jpg" alt="noticeboard"></li>
						<li>작성자 : <span>yonghyun08</span></li>
						<li>제품 : <span>MacBook(맥북)</span></li>
						<li>가격 : <span>0원</span></li>
						<li><a href="Explanation.jsp"><button>상세설명</button></a></li>
					</ul>
					<ul>
						<li><img src="<c:url value="/"/>image/sampleamcbook.jpg" alt="noticeboard"></li>
						<li>작성자 : <span>yonghyun08</span></li>
						<li>제품 : <span>MacBook(맥북)</span></li>
						<li>가격 : <span>0원</span></li>
						<li><a href="Explanation.jsp"><button>상세설명</button></a></li>
					</ul>
					<ul>
						<li><img src="<c:url value="/"/>image/sampleamcbook.jpg" alt="noticeboard"></li>
						<li>작성자 : <span>yonghyun08</span></li>
						<li>제품 : <span>MacBook(맥북)</span></li>
						<li>가격 : <span>0원</span></li>
						<li><a href="Explanation.jsp"><button>상세설명</button></a></li>
					</ul>
					<ul>
						<li><img src="<c:url value="/"/>image/sampleamcbook.jpg" alt="noticeboard"></li>
						<li>작성자 : <span>yonghyun08</span></li>
						<li>제품 : <span>MacBook(맥북)</span></li>
						<li>가격 : <span>0원</span></li>
						<li><a href="Explanation.jsp"><button>상세설명</button></a></li>
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
	<script type="text/javascript">
	$(".noticeboardsubmit button").click(function(){
		document.location.href="<c:url value="/view/"/>board.jsp"
	});
	</script>
</body>
</html>





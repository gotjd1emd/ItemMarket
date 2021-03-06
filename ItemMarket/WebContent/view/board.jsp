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
</head>
<body>

	

		<div class="container">
			<section id="mainboard">
			<form name="write" action="../front?command=write&id=${sessionScope.userProfile.id}" method="post" onSubmit="return checkValid()"
				enctype="multipart/form-data">
				<ul>
					<li>카테고리</li>
					<li><input type="button" value="카테고리"><input
						type="text" name="category" readonly="readonly"></li>
					<li>서브카테고리</li>
					<li name="radio"></li>
					<li>제품</li>
					<li><input type="text" name="title" placeholder="제품을 입력해주세요"
						required></li>
					<li>가격</li>
					<li><input type="number" name="price" placeholder="가격을 입력해주세요"
						required></li>
					<li>연락처</li>
					<li><input type="text" name="phone" placeholder="연락천를 입력해주세요"></li>
					<li>설명</li>
					<li><textarea name="content"></textarea></li>
				</ul>
				<div class="imgs">

					<div class="imgbtn">
						<span>이미지</span> <img src="<c:url value="/"/>image/plus.png"
							alt="plus">
					</div>
					<ul></ul>
				</div>
				<div class="submit">  

					<input type="submit" value="확인"> <input type="button"
						value="취소">

				</div>
			</form>
			</section>
		</div>
	
	<div class="bigcategory" title="카테고리">
		<ul>
			<li>전자제품</li>
			<li>의류</li>
			<li>생활</li>
			<li>가구</li>
			<li>의학 용품</li>
			<li>사무용품</li>
		</ul>
	</div>
	<div class="saledialog" title="판매방식">
		<ul>
			<li>직거래</li>
			<li>택배</li>
		</ul>
	</div>



	<script type="text/javascript"src="<c:url value="/"/>jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript"src="<c:url value="/"/>jquery/jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
	<script type="text/javascript"src="<c:url value="/"/>jquery/smoothscroll-for-websites-master/SmoothScroll.js"></script>
	<script type="text/javascript"src="<c:url value="/"/>jquery/board_JQuery.js"></script>
	<script type="text/javascript" src="<c:url value="/"/>jquery/tinymce/js/tinymce/tinymce.min.js"></script>

	<script type="text/javascript">
		tinymce.init({
	    selector: "textarea",
	    language : 'ko_KR',
		 });
		function checkValid() {
			if ($("input[name=bigcategory").val() == "") {
				alert("카테고리를 선택해주세요");
				return false;
			}
			if (!$("input[type=radio]:checked").val()) {
				alert("서브카테고리를 선택해주세요");
				return false;
			}
			if ($("input[name=title]").val() == "") {
				alert("제품 이름을 입력해주세요");
				return false;
			}
			if ($("input[name=price]").val() == "") {
				alert("가격을 입력해주세요");
				return false;
			}
			if ($("input[name=phone]").val() == "") {
				alert("연락처를 입력해주세요");
				return false;
			}
		}
		$("input[value=취소]").click(function() {
			document.location.href = "<c:url value='/'/>view/noticeboard.jsp";
		});
	</script>
</body>
</html>





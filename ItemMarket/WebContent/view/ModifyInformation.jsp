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

<div id="memberform">
	<div class="memberupdate">
		회원정보 수정
	</div>
	
	<div class="memberdrop">
		회원 탈퇴
	</div>
</div>
	<script type="text/javascript"  src="<c:url value="/"/>jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">
		$(document).on("click",".memberupdate",function(){
			document.location.href="MemberUpdate.jsp";
		});
		</script>
</body>
</html>





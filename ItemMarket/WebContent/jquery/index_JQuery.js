	$(document).ready(function(){
		
	

	var list = $(".bg img");
	var count = 0;
	var img = $(".mainimg img").attr("src");
	var subCategory = "";
	var category = "";
	$(".category ul li").click(function(){
		$(".sub_category ul").fadeIn("slow");
		$(".searchmain").animate({top : '45%'});
		$(".category").dialog("close");
		category = $(this).text();
		if(category == "전자제품") {
			$(".sub_category ul").empty();
			$(".sub_category ul").append("<li>컴퓨터</li>");
			$(".sub_category ul").append("<li>휴대폰</li>");
			$(".sub_category ul").append("<li>멀티미디어</li>");
			$(".sub_category ul").append("<li>프린터</li>");
		}else if(category == "의류") {
			$(".sub_category ul").empty();
			$(".sub_category ul").append("<li>여성의류</li>");
			$(".sub_category ul").append("<li>남성의류</li>");
			$(".sub_category ul").append("<li>신발</li>");
			$(".sub_category ul").append("<li>캐쥬얼</li>");
			$(".sub_category ul").append("<li>영/유아</li>");
			$(".sub_category ul").append("<li>악세서리</li>");
		}else if(category == "생활") {
			$(".sub_category ul").empty();
			$(".sub_category ul").append("<li>잡화</li>");
			$(".sub_category ul").append("<li>주방</li>");
		}else if(category == "가구") {
			$(".sub_category ul").empty();
			$(".sub_category ul").append("<li>침구</li>");
			$(".sub_category ul").append("<li>테이블</li>");
			$(".sub_category ul").append("<li>의자</li>");
			$(".sub_category ul").append("<li>스탠드</li>");
			$(".sub_category ul").append("<li>옷장</li>");
		}
		category = "&category="+category;
	});

	$("#sub").click(function(){

		$(".category").dialog({
			minWidth : 600,
			minHeight : 400,
			modal : true ,

			show : {
				effect :"slide",
				duration: 1000
			},
			hide : {
				effect:"slide",
				duration: 1000
			}
		});	
		$(".sub_category ul").fadeOut("slow");
		$(".searchmain").animate({top : '50%'});
	});



	$(".sub_category ul").on("click","li", (function() {
		$(".sub_category ul li").css({color:"#000", background:"#ffffff"});
		$(this).css({color:"#fff", background:"#0000ff"});
		subCategory = "&subCategory="+$(this).text();
	}));
	$(".glyphicon.glyphicon-search").click(function(){ //임시로 주소갑 줌
		document.location.href="../front?command=search"+category+subCategory+"&word="+$("[type=text]").val()+"&page=0";
	});

	
	/* index bg */
	function banner(){
		list.eq(count).fadeOut(1500);
		
		if(++count>list.length-1){
			count=0;
		}
		list.eq(count).fadeIn(1500);
	}
	var timer =setInterval(function(){
		banner();
	},3000);
	
	/* 프로필 animate */
	$(document).on("click",".menu ul li:nth-child(3)",function(){
		if($(".profilemenu").is(":animated"))return;
		/*메인 animate*/
		$(".profilemenu").animate({"right":"0"},1500);
		$(".menu ul li").animate({"right":"350px"},1500);
		$("#search").animate({"left":"38%"},1500);
		
		/*게시판 animate*/
		
	});
	$(document).on("click",".profilemenu ul li:nth-child(1) span",function(){
		if($(".profilemenu").is(":animated"))return;
		$(".profilemenu").animate({"right":"-350px"},1500);
		$(".menu ul li").animate({"right":"0"},1500);
		$("#search").animate({"left":"50%"},1500)	;
	});
	
	/* 로그인 dialog */
   $(document).on("click",".menu ul li:nth-child(1)",function(){
	   	$(".logindialog").dialog({
	   		minWidth : 500,
	   		minHeight : 300 ,
	   		modal : true ,
	   		show : {
	   			effect : "slide",
	   			duration : 1000
	   		},
	   		hide : {
	   			effect : "slide",
	   			duration : 1000
	   		}
	   		
	   	});
   });
		
	/* 회원가입 dialog */
	$(document).on("click",".menu ul li:nth-child(2)",function(){
		
		$(".memberupdialog").dialog({
			minWidth : 600,
			minHeight : 300,
			modal : true,
			show : {
				effect : "slide",
				duration : 1000
			},
			hide : {
				effect : "slide",
				duration : 1000
			}
		});
	});

	$(".memberupsubmit input[value=취소]").click(function(){
		$(".memberupdialog").dialog("close");
	});
	
	/* 거래내역 dialog */
	$(document).on("click",".profilemenu ul li:nth-child(6)",function(){
		
		$(".Transactions").dialog({
			minWidth : 1070,
			minHeight : 530,
			modal : true,
		});
		
		$.ajax({
			url:"../front?command=selectTrade",
			type : "get",
			dataType : "json",
			
			success : function(result) {
	
				$.each(result, function(index, items) {
					$('.Transactions section ul').append("<ul>"+
						"<li><span>" + items.buyer + "</span></li>"+
						"<li><span>" + items.seller + "</span></li>"+
						"<li><span>" + items.itemName + "</span></li>"+
						"<li><span>" + items.cash + "</span></li>"+
						"<li><span>" + items.borderNumber + "</span></li>"+
						"<li><span>" + items.dayDate + "</span></li>"+
						"<li><span>" + items.tradeState + "</span></li></ul>"
					);  
				});	
			},
			error : function(err) {
				console.log("err : " + err);

			}
	});
	});
	
	/* 마일리지 거래내역 */
	$(document).on("click",".profilemenu ul li:nth-child(7)",function(){
		
		
		$(".Mileagetransactions").dialog({
				minWidth: 1070,
	 			minHeight : 530,
				modal : true,
		});
		
		
	});
});
	

	/*
	$(".loginsubmit input[value=로그인]").click(function(){
		 var userId = $("#id").val();
         
         alert(userId);
		$(".logindialog").hide();
		
		$.ajax({
			type : "get",
			dataType : "text",
			
			success : function(result) {
				alert("ajax");
				$('.profilemenu').append("성공");
					$('.profilemenu').append("<ul>"+
						"<li><img src='<c:url value='/'/>image/player.png' alt='myimg'>"+
						"<li>아이디 : <span>" + userId + "</span></li>"+
						"<li>마일리지 : <span>" + items.cash + "원</span></li>"+
						"<li>전화번호 : <span>" + items.tel + "</span></li>"+
						"<li>이메일 : <span>" + items.email + "</span></li>"+
						"<li>마일리지내역확인</li>"+
						"<li>프로필수정</li></ul>"
					);
				
			},
			error : function(err) {
				console.log("err : " + err);

			}
		});
	});
	계속 삽질한 결과, 로그인 정보는 session으로 저장하기 때문에, sessionScope으로 불러와서 충분히 바뀔수잇다..?
	*/
	

	
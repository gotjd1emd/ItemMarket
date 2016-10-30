	$(document).ready(function(){

	var list = $(".bg img");
	var count = 0;
	var subCategory = "";
	var category = "";
	var word="";
	$(".category ul li").click(function(){
		$(".sub_category ul").fadeIn("slow");
		$(".searchmain").animate({top : '45%'});
		$(".category").dialog("close");
		category = $(this).text();
		alert(category);
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
		}else if(category == "의료,의약") {
			$(".sub_category ul").empty();
			$(".sub_category ul").append("<li>의료기기</li>");
			$(".sub_category ul").append("<li>다이어트 식품</li>");
		}else if(category == "가구") {
			$(".sub_category ul").empty();
			$(".sub_category ul").append("<li>침구</li>");
			$(".sub_category ul").append("<li>테이블</li>");
			$(".sub_category ul").append("<li>의자</li>");
			$(".sub_category ul").append("<li>스탠드</li>");
			$(".sub_category ul").append("<li>옷장</li>");
		}else if(category == "생활") {
			$(".sub_category ul").empty();
			$(".sub_category ul").append("<li>침구</li>");
			$(".sub_category ul").append("<li>인테리어</li>");
		}else if(category == "사무용품") {
			$(".sub_category ul").empty();
			$(".sub_category ul").append("<li>소모품</li>");
			$(".sub_category ul").append("<li>프린터</li>");
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

	$(".searchmain .glyphicon.glyphicon-search").click(function(){ //임시로 주소갑 줌
		word = $(".searchmain input[id=word]").val();
		document.location.href="../front?command=search"+category+subCategory+"&word="+word+"&page=0";
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
	$(document).on("click",".menu ul #profilebtn",function(){
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
	
	/* 충전 dialog */
   $(document).on("click",".menu ul #charge",function(){
	   $(".chargedialog").dialog({
		  minWidth:500,
		  minHeight :300,
		  modal : true
	   });
   });
	
	/* 로그인 dialog */
   $(document).on("click",".menu ul #loginbtn",function(){
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
   }); //로그인 dialog끝
		
	/* 회원가입 dialog */
	$(document).on("click",".menu ul #sigupbtn",function(){
		
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
	}); //회원가입 dialog 끝
	
	
	$(".memberupsubmit input[value=취소]").click(function(){
		$(".memberupdialog").dialog("close");
	});
	
	/* 거래내역 dialog */
	$(document).on("click",".profilemenu ul #transactionsEvent",function(){
				
		$(".Transactions").dialog({
			minWidth : 1070,
			minHeight : 530,
			maxHeight : 530,
			modal : true,
		});
		$.ajax({
			url:"/ItemMarket/front?command=selectTrade",
			type : "post",
			data : "id="+$(".profilemenu ul li #saveId").text(),
			dataType : "json",
			
			success : function(result) {
				$('.Transactions section').empty();
				$('.Transactions section').append("<table><tr><td>구매자</td><td>판매자</td><td>물품이름</td><td>지불액</td><td>글번호</td><td>날짜</td><td>거래진행상황</td></tr>");
				$.each(result, function(index, items) {
					$('.Transactions section table tbody').append("<tr>"+
						"<td><span>" + items.buyer + "</span></td>"+
						"<td><span>" + items.seller + "</span></td>"+
						"<td><span>" + items.itemName + "</span></td>"+
						"<td><span>" + items.cash + "</span></td>"+
						"<td><span>" + items.borderNumber + "</span></td>"+
						"<td><span>" + items.dayDate + "</span></td>"+
						"<td><span>" + items.tradeState + "</span></td></tr>"
					);  
				});	
							
				
				$('.Transactions section').append("</table>")
			},
			error : function(err) {
				console.log("err : " + err);

			}
	});




		
	}); // 거래내역 끝
	
	/* 마일리지 거래내역 */
	$(document).on("click",".profilemenu ul #cashTransactionsEvent",function(){
		
		$(".Mileagetransactions").dialog({
			minWidth : 1070,
			minHeight : 530,
			maxHeight : 530,
			modal : true,
		});
		$.ajax({
			url:"/ItemMarket/front?command=selectCash",
			type : "get",
			data : "id="+$(".profilemenu ul li #saveId").text(),
			dataType : "json",
			
			success : function(result) {
				$('.Mileagetransactions section').empty();
				$('.Mileagetransactions section').append("<table><tr><td>아이디</td><td>물품이름</td><td>마일리지</td><td>거래 당시 잔액</td><td>날짜</td></tr>");
				
				$.each(result, function(index, items) {
					$('.Mileagetransactions section table tbody').append("<tr>"+
						"<td><span>" + items.id + "</span></td>"+
						"<td><span>" + items.itemName + "</span></td>"+
						"<td><span>" + items.mileage + "</span></td>"+
						"<td><span>" + items.currentCash + "</span></td>"+
						"<td><span>" + items.saveDate + "</span></td></tr>"
					);  
				});	
				$('.Mileagetransactions section').append("</table>")
			},
			error : function(err) {
				console.log("err : " + err);
			}
		}); // 마일리지 ajax
	
	}); // 마일리지 거래 내역 끝
	
	/*로그아웃 EVENT*/
	$("#logoutbtn").click(function(){
		document.location.href="/ItemMarket/front?command=logout"
	});
		
	/* 아이디 중복 체크 */
	$(".memberupform ul li input[name=id]").keyup(function(){
		$.ajax({
			url: "/ItemMarket/front?command=userUpdateOnLoad",
			type : "post",
			data :  "id="+$(".memberupform ul li input[name=id]").val(),
			dataType : "text",
			success : function(result){
				if(result == 0){
					$(".memberupform ul li .check").text("사용 가능한 아이디 입니다.")
				}else{
					$(".memberupform ul li .check").text("중복입니다.")
				}
			},
			error : function(err){
				
			}
		});

	});//아이디 중복 끝
	
	
	/* 회원가입 버튼  */
	$(document).on("click",".memberupsubmit input[value=전송]",function(){
		if(checkValid() == true){
			$.ajax({
				url : "/ItemMarket/front?command=signup",
				type: "post",
				data : $("#singForm").serialize() ,
				dataType : "text",
				success: function(result){
					if(result == 0){
						alert("아이디가 중복입니다");
						$(".memberupform input[name=id]").val("");
						$(".memberupform input[name=password]").val("");
						$(".memberupform input[name=tel]").val("");
						$(".memberupform input[name=email]").val("");
						$(".memberupform input[name=addr]").val("");
					}else{
						
						alert("ItemMarket에 오신것을 환영합니다");
						document.location.href="/ItemMarket/view/index.jsp"
					}
				},
				error :function(err){
					console.log(err);
				}
								
				});
			}
		});//회원가입 버튼 끝
	
	/* 로그인 버튼 */
	
	$(document).on("click",".loginsubmit input[value=로그인]",function(){
		if(logincheckValid() == true){
			$.ajax({
				url:"/ItemMarket/front?command=login",
				type:"post",
				data:$("#login").serialize(),
				dataType:"text",
				success:function(result){		
					if(result == 0){
						alert("등록되지 않은 아이디이거나,아이디 또는 비밀번호를 잘못 입력하셨습니다.");
						$("#loginform input[name=id]").val("");
						$("#loginform input[name=password]").val("");
					}else{
						document.location.href="/ItemMarket/view/index.jsp"
					}
				},
				error:function(err){
					console.log("err : "+ err)
				}
			});
			}
	});//로그인 버튼 끝
	
	/* 비밀번호 찾기 이동 */
	$(".loginsubmit input[name=searchpassword]").click(function(){
		document.location.href="/ItemMarket/view/passwordFind.jsp";
	});
	
	/* 채팅 유효성 검사  */
	function sendCheck(){
		if($("#partnerId").val() !=""){
			
		}
	}
	/* 앞 뒤 */
	var pageNumber = 0;
	pageCheck();
	function pageCheck(){
		

		if(pageNumber == 0){
			$(".beaf img:nth-child(1)").show();
			$(".beaf img:nth-child(2)").hide();
			$(".before").show();
			$(".after").hide();
		}else{
			$(".beaf img:nth-child(1)").hide();
			$(".beaf img:nth-child(2)").show();
			$(".before").hide();
			$(".after").show();
		}
	}
	$(".beaf img:nth-child(1)").click(function(){
		pageNumber++;
		pageCheck();
		console.log(pageNumber);
	});
	
	$(".beaf img:nth-child(2)").click(function(){
		pageNumber--;
		pageCheck();
		console.log(pageNumber);
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
	

	
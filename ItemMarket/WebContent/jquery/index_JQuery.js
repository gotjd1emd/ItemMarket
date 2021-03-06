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
		//alert(category);
		if(category == "전자제품") {
			$(".sub_category ul").empty();
			$(".sub_category ul").append("<li>컴퓨터</li>");
			$(".sub_category ul").append("<li>가전제품</li>");
			$(".sub_category ul").append("<li>휴대폰</li>");
			$(".sub_category ul").append("<li>멀티미디어</li>");
			$(".sub_category ul").append("<li>프린터</li>");
		}else if(category == "의류") {
			$(".sub_category ul").empty();
			$(".sub_category ul").append("<li>여성의류</li>");
			$(".sub_category ul").append("<li>남성의류</li>");
			$(".sub_category ul").append("<li>신발</li>");
			$(".sub_category ul").append("<li>영/유아</li>");
			$(".sub_category ul").append("<li>악세서리</li>");
		}else if(category == "의학 용품") {
			$(".sub_category ul").empty();
			$(".sub_category ul").append("<li>진찰기</li>");
			$(".sub_category ul").append("<li>교정기</li>");
			$(".sub_category ul").append("<li>걸음보정기</li>");
			$(".sub_category ul").append("<li>붕대,거즈,밴드..</li>");
		}else if(category == "가구") {
			$(".sub_category ul").empty();
			$(".sub_category ul").append("<li>침구</li>");
			$(".sub_category ul").append("<li>벽장</li>");
			$(".sub_category ul").append("<li>테이블</li>");
			$(".sub_category ul").append("<li>소파</li>");
		}else if(category == "생활") {
			$(".sub_category ul").empty();
			$(".sub_category ul").append("<li>인테리어</li>");
			$(".sub_category ul").append("<li>부억</li>");
			$(".sub_category ul").append("<li>공구</li>");
		}else if(category == "사무용품") {
			$(".sub_category ul").empty();
			$(".sub_category ul").append("<li>문구류</li>");
			$(".sub_category ul").append("<li>종이</li>");
			$(".sub_category ul").append("<li>기타</li>");
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
		$(this).css({color:"#fff", background:"#FFB300"});
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
	
	/*구매신청내역*/
	$(document).on("click",".profilemenu ul #purchaseapply",function(){
		
		$(".purchaselistdialog").dialog({
			minWidth : 1070,
			minHeight : 530,
			maxHeight : 530,
			modal : true,
		});
		$.ajax({
			url:"/ItemMarket/front?command=selectRequestTrade",
			type : "get",
			data : "id="+$(".profilemenu ul li #saveId").text(),
			dataType : "json",
			
			success : function(result) {
				$('.purchaselistdialog section').empty();
				$('.purchaselistdialog section').append(
						"<table><tr><td>글번호</td><td>제시금액</td>" +
						"<td>구매자</td><td>판매자</td>" +
						"<td>구매/판매확인</td><td>확인버튼</td></tr>");
				
				$.each(result, function(index, items) {
					if(items.tradeState=="sell") {
						$('.purchaselistdialog section table tbody').append("<tr>"+
							"<td><span name='borderNumber'>" + items.borderNumber + "</span></td>"+
							"<td><span name='cash'>" + items.cash + "</span></td>"+
							"<td><span name='buyer'>" + items.buyer + "</span></td>"+
							"<td><span name='seller'>" + items.seller + "</span></td>"+
							"<td><span name='state'>" + items.tradeState + "</span></td>"+
							"<td><span><input type='button' value='확인' name='sell'/></span></td></tr>");
					}else {
						$('.purchaselistdialog section table tbody').append("<tr>"+
							"<td><span name='borderNumber'>" + items.borderNumber + "</span></td>"+
							"<td><span name='cash'>" + items.cash + "</span></td>"+
							"<td><span name='buyer'>" + items.buyer + "</span></td>"+
							"<td><span name='seller'>" + items.seller + "</span></td>"+
							"<td><span name='state'>" + items.tradeState + "</span></td>"+
							"<td><span><input type='button' value='확인' name='buy'/></span></td></tr>");
					}
				});	
				$('.purchaselistdialog section').append("</table>")
			},
			error : function(err) {
				console.log("err : " + err);
			}
		}); // 구매신청내역 ajax
	
	}); // 구매신청내역 내역 끝
	
	$(".purchaselistdialog section").on("click", "input[name=sell]", function() {
		console.log($(this).parents("tr").children("td").children("[name=borderNumber]").text());
		console.log($(this).parents("tr").children("td").children("[name=buyer]").text());
		console.log($(this).parents("tr").children("td").children("[name=cash]").text());
		console.log($(this).parents("tr").children("td").children("[name=state]").text());
		var buyer = $(this).parents("tr").children("td").children("[name=buyer]").text();
		$.ajax({
			url:"/ItemMarket/front?command=accountTransfer",
			type : "post",
			data : "buyer="+$(this).parents("tr").children("td").children("[name=buyer]").text()+
					"&seller="+$(this).parents("tr").children("td").children("[name=seller]").text()+
					"&cash="+$(this).parents("tr").children("td").children("[name=cash]").text()+
					"&borderNumber="+$(this).parents("tr").children("td").children("[name=borderNumber]").text(),
			dataType : "text",
			success : function(result) {
				if(result==1) {
					alert(buyer+"님과 거래를 시작합니다.");
					$(".purchaselistdialog").dialog("close");
				}else {
					alert("거래가 실패하였습니다.");
				}
			},
			error : function(err) {
				console.log("err : " + err);
			}
		}); // 구매신청확인 ajax
	});
	
	$(".purchaselistdialog section").on("click", "input[name=buy]", function() {
		console.log($(this).parents("tr").children("td").children("[name=borderNumber]").text());
		console.log($(this).parents("tr").children("td").children("[name=buyer]").text());
		console.log($(this).parents("tr").children("td").children("[name=cash]").text());
		console.log($(this).parents("tr").children("td").children("[name=state]").text());
		var seller = $(this).parents("tr").children("td").children("[name=seller]").text();
		$.ajax({
			url:"/ItemMarket/front?command=transferComplete",
			type : "post",
			data : "buyer="+$(this).parents("tr").children("td").children("[name=buyer]").text()+
					"&seller="+$(this).parents("tr").children("td").children("[name=seller]").text()+
					"&cash="+$(this).parents("tr").children("td").children("[name=cash]").text()+
					"&borderNumber="+$(this).parents("tr").children("td").children("[name=borderNumber]").text(),
			dataType : "text",
			success : function(result) {
				if(result==1) {
					alert(seller+"님과 거래를 완료합니다.");
					$(".purchaselistdialog").dialog("close");
				}else {
					alert("거래가 실패하였습니다.");
				}
			},
			error : function(err) {
				console.log("err : " + err);
			}
		}); // 판매신청확인 ajax
	});
	
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
					$(".memberupform ul li #check").text("사용 가능한 아이디 입니다.")
				}else{
					$(".memberupform ul li #check").text("중복입니다.")
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
	
	/* 마일리지 충전 dialog */
	   $(document).on("click",".menu ul #charge",function(){
		   $(".chargedialog").dialog({
			  minWidth:500,
			  minHeight :300,
			  modal : true						
		   });
	   });
	 
	/* 마일리지 취소 버튼 */
	  $("#chargeform input[value=취소]").click(function(){
		  $(".chargedialog").dialog("close");
	  });
	
	
	/* 마일리지 버튼  */
	$(document).on("click",".chargedialog input[value=충전]",function(){
			$.ajax({
				url : "/ItemMarket/front?command=insertCash",
				type: "post",
				data : "id="+$(".profilemenu ul li #saveId").text()+"&chargeNumber="+$(".chargedialog input[name=chargeNumber]").val(),
				dataType : "text",
				success: function(result){
					if(result == 0){
						alert("마일리지를 충전하지 못했습니다.");
					}else{
						
						alert("마일리지를 충전하였습니다");
						document.location.href="/ItemMarket/view/index.jsp"
					}
				},
				error :function(err){
					console.log(err);
				}
								
				});
			
		});//마일리지 버튼 끝
	
	
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

	/* 구매신청란 dialog */
	$(document).on("click",".profilemenu ul #purchaseapply",function(){
		$(".purchaselistdialog").dialog({
			minWidth : 1070,
			minHeight : 530,
			maxHeight : 530,
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
	

	
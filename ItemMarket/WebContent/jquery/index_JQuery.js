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
		category = $("img:first-child", $(this)).attr("alt");
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
			minHeight : 500,
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
		document.location.href="../front?command=search"+category+subCategory+"&word="+$("[type=text]").val();
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
	$(document).on("click",".menu ul li:nth-child(1)",function(){
		
	
		$(".memberupdialog").css({"z-index":"1001"});
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
	
   $(document).on("click",".menu ul li:nth-child(2)",function(){
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
});
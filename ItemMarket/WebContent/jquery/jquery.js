$(document).ready(function(){
	var list = $(".bg img");
	var count = 0;
	var img = $(".mainimg img").attr("src");
	$(".category ul li").click(function(){
		$(".sub_category ul").fadeIn("slow");
		$(".searchmain").animate({top : '45%'});
		$(".category").dialog("close");
	});

	$("#sub").toggle(function(){
		$(".category").dialog({
			minWidth : 600,
			minHeight : 400,

			show : {
				effect :"slide",
				duration: 1000
			},
			hide : {
				effect:"slide",
				duration: 1000
			}
		});	
	},function(){
		$(".category").dialog({
			minWidth : 600,
			minHeight : 500,

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
	$(".sub_category ul li").click(function(){ //임시로 주소갑 줌
		document.location.href="noticeboard.jsp";
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


	

	/*var Mainimg = $(".mainimg img").attr("src");
	$(".subimg ul li img").click(function(){
		var img = $(this).attr("src");
		$(".mainimg img").attr("src",$(this).attr("src"));
		$(this).attr("src",Mainimg);
	 	Mainimg = $(".mainimg img").attr("src");	
	 	
	 	if($(".mainimg img").is(":animated")) return; 
	 	var img = $(this).attr("src");
	 	$(".mainimg img").fadeOut(1000 , function(){
	 		$(this).attr("src",img);
	 	}); 

	 
	 	$(".mainimg img").fadeIn(1000 ,function(){
	 		
	 	}); fadeIn , fadeOut 선택 끝자리 

	 });*/
	
	/* border sale value */

	$("form ul li input[value=판매방식]").click(function(){
		
			$(".saledialog").dialog({
				minWidth :650,
				show : {
					effect : "slide",
					duration : 1000
				},
				
				hide : {
					effect :"slide",
					duration : 1000
				}
				
			});
	});
	
	$(".saledialog ul li img").click(function(){
		$("form ul li input[name=sale]").attr("value",$(this).attr("alt"));
		$(".saledialog").dialog("close");
	});
	
	$("form ul li input[value=카테고리]").click(function(){
		$(".bigcategory").dialog({
			minWidth : 600,
			minHeight : 400,

			show : {
				effect :"slide",
				duration: 1000
			},
			hide : {
				effect:"slide",
				duration: 1000
			}
		})
	});
	
	$(".bigcategory ul li img").click(function(){
		$("form ul li input[name=category]").attr("value",$(this).attr("alt"));
		$(".bigcategory").dialog("close");
		if($(this).attr("alt") == "전자제품"){
			$("form ul li:nth-child(4)").html('컴퓨터<input type="radio" name="subcategory" value="컴퓨터">휴대폰<input type="radio" name="subcategory" valjue="휴대폰">멀티미디어<input type="radio" name="subcategory" value="멀티미디어">');
		}
		if($(this).attr("alt") == "의류"){
			$("form ul li:nth-child(4)").html('여성의류<input type="radio" name="subcategory" value="여성의류">남성의류<input type="radio" name="subcategory" valjue="남성의류">신발<input type="radio" name="subcategory" value="신발">캐쥬얼<input type="radio" name="subcategory" value="캐쥬얼">영/유아<input type="radio" name="subcategory" value="영/유아">악세서리<input type="radio" name="subcategory" value="악세서리">');
		}
		if($(this).attr("alt") == "생활"){
			$("form ul li:nth-child(4)").html('잡화<input type="radio" name="subcategory" value="잡화">주방<input type="radio" name="subcategory" valjue="주방">공구<input type="radio" name="subcategory" value="공구">');
		}
		if($(this).attr("alt") == "가구"){
			$("form ul li:nth-child(4)").html('침구 <input type="radio" name="subcategory" value="침구">인테리어<input type="radio" name="subcategory" valjue="인테리어">');
		}
		if($(this).attr("alt") == "의료,의약"){
			$("form ul li:nth-child(4)").html('의료기기<input type="radio" name="subcategory" value="의료기기">다이어트제품<input type="radio" name="subcategory" valjue="다이어트제품">');
		}
		if($(this).attr("alt") == "사무용품"){
			$("form ul li:nth-child(4)").html('소모품<input type="radio" name="subcategory" value="소모품">프린터<input type="radio" name="subcategory" valjue="프린터">');
		}
		
	});
<<<<<<< HEAD
	/* border file input create */
	var file="" ;
	$(".imgs img").click(function(){
		file +="<li><input type='file' name='fileName'></li>"
=======
	
	
	
	/* board file input create */
	var file="";
	var filenum = 0;
	$(".imgs .imgbtn img").click(function(){
		file +="<li><input type='file' name='fileName"+filenum+"'></li>"
		filenum++;
>>>>>>> origin/master
		$(".imgs ul").html(file);
	});
	
	
	/* Explanation slide */
	 time();
	 if($(".subimg ul li img").length-1 < 3){
	 	$(".subimg ul .down").css({"display" :"none"});
	 }
	
	
});


var imgs = $(".mainimg img");
var sno=0;
var last = imgs.length-1;
var timer2 = null;



function move(){
	
	$(imgs[sno]).animate({"left":"100%"},1500,function(){
		$(this).css({"left":"-100%"},1000);
	});
	sno++;

	if(sno > last) sno = 0;   
	$(imgs[sno]).animate({"left":"0"},1500,function(){
		time();
	});
}

function time(){
	timer2 = setTimeout(function(){
		move();
	},1500);
}
function slide(a){
	if($(imgs[sno]).is(":animated") || a-1 == sno)return;
	var no , type;
	clearTimeout(timer2);
	if(typeof a !="string"){
		no = a-1;
		type = no<sno?"left":"right"; 
	}



	var leftVal = type =="left"?100:-100;

	$(imgs).eq(no).css({"left":"-100%"}).animate({"left":"0"},1500);
	$(imgs).eq(sno).animate({"left":"100%"},1500,function(){
		$(this).css({"left":"-100%"});
		time();
	});
	sno = no;

}

/* subslide 집에서 할거 */

/*var subimgs = $(".subimg ul li img");
var subsno = 0;
var sublast = subimgs.length-1;

$(".subimg .down").click(function(){
		$(".subimg .up").css({"display":"block"});
		$(".subimg ul").animate({"bottom":"15%"},1500);
});
$(".subimg .up").click(function(){
	subsno++;
	if(subsno>sublast)subsno=0;
	if(subsno == 0){
	$(this).css({"display":"none"});
	}
	$(".subimg ul").animate({"top":"5%"},1500);
});



*/


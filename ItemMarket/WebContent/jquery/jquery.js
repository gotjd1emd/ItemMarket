$(document).ready(function(){
	var list = $(".bg img");
	var count = 0;
	var img = $(".mainimg img").attr("src");
	$("select").change(function(){
		alert($(this).val())
	});
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
				effect :"fade",
				duration: 1000
			},
			hide : {
				effect:"fade",
				duration: 1000
			}
		});	
	},function(){
		$(".category").dialog({
			minWidth : 600,
			minHeight : 500,

			show : {
				effect :"fade",
				duration: 1000
			},
			hide : {
				effect:"fade",
				duration: 1000
			}
		});	
		$(".sub_category ul").fadeOut("slow");
		$(".searchmain").animate({top : '50%'});
	});
	/* index bg */
	function banner(){
		list.eq(count).fadeOut(1500);
		//console.log(count)
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
	
	
	/* noticeboard -> select */
	$(".noticeboardsubmit button").click(function(){
		document.location.href="select.jsp"
	});

	/* select.html */
	
	$(".selectsub span").click(function(){
		
			
	});



	/* Explanation slide */
	$(".mainEx button:last-child()").click(function(){
		document.location.href="noticeboard.jsp"
	});
	
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
	console.log(1);
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

	console.log(sno,no);

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


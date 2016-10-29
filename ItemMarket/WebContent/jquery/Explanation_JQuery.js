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
$(document).ready(function(){
	/* Explanation slide */
	 time();
	 condition();
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

var subimgs = $(".subimg ul li");
var count = 0;
var max = subimgs.length-3;
function condition(){

	if(count == 0){
		$(".subimg .up").hide();
		$(".subimg .down").show();
	}
	if(count >= 1 && count <max){
		$(".subimg .up").show();
		$(".subimg .down").show();
	}
	
	if(count>=max){
		$(".subimg .up").show();
		$(".subimg .down").hide();
	}
}
$(".subimg .down").click(function(){
		if($(".subimg ul").is(":animated"))return;
		$(".subimg ul").animate({"top":"+=-100px"},1500);
		count++;
		condition();
		
});
$(".subimg .up").click(function(){
	if($(".subimg ul").is(":animated"))return;
	$(".subimg ul").animate({"top":"+=100px"},1500);
	count--;
	condition();
});




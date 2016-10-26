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
		
		//$(".dialogopacity").show();
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
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

	function banner(){
		list.eq(count).fadeOut(1500);
		console.log(count)
		if(++count>list.length-1){
			count=0;
		}
		list.eq(count).fadeIn(1500);
	}
	var timer =setInterval(function(){
		banner();
	},3000);
	var Mainimg = $(".mainimg img").attr("src");
	$(".subimg ul li img").click(function(){
		/*var img = $(this).attr("src");
		$(".mainimg img").attr("src",$(this).attr("src"));
		$(this).attr("src",Mainimg);
	 	Mainimg = $(".mainimg img").attr("src");	
	 	*/
	 	var img = $(this).attr("src");
	 	$(".mainimg img").fadeOut(1000 , function(){
	 		$(this).attr("src",img);
	 	});

	 
	 	$(".mainimg img").fadeIn(1000 ,function(){
	 		
	 	});

	 });


});
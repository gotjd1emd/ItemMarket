$(document).ready(function(){



$(document).on("click",".memberupdate",function(){
	passwordcheck();
	
});

$(document).on("click",".memberdrop",function(){
	passwordcheck();
});

function passwordcheck(){
	$(".passwordCheck").dialog({
		minWidth : 700,
		minHeight : 300,
		modal : true,
	});
}
});
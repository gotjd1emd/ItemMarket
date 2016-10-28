$(document).ready(function(){



$(document).on("click",".memberupdate",function(){
	passwordcheck();
});

$(document).on("click","",function(){
	
});

$(document).on("click",".memberdrop",function(){
	userdelete();
});

function passwordcheck(){
	$(".passwordCheck").dialog({
		minWidth : 700,
		minHeight : 300,
		modal : true,
	});	
}
function userdelete(){
	$(".userDelete").dialog({
		minWidth : 700,
		minHeight : 300,
		modal : true,
	});
}
});
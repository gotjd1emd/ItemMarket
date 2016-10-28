$(document).ready(function(){



$(document).on("click",".memberupdate",function(){
	passwordcheck();
});

$(document).on("click",".userDelete #passwordCheckform input[type=button]",function(){
	if($(".userDelete #passwordCheckform input[type=password]").val() == ""){
		alert("비밀번호가 공백입니다.")
	}else{
		$.ajax({
			url :"../front?command=userDelete" ,	
			type : "post" ,
			data : $("#deleteform").serialize(),
			dataType : "text" ,
			success :function(result){
				if(result<0){
					alert("비밀번호가 맞지 않아 삭제가 불가능합니다.");
				}else{
					alert("삭제가 완료되었습니다.")
				}
			},
			error :function(err){
				console.log(err);
			},
			
		});
	}
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
$(document).ready(function(){
	$(document).on("click",".passwordform input[type=button]",function(){
		if($(".passwordform input[name=id]").val() == ""){
			alert("아이디를 입력해주시고 사용해 주십시오.");
		}else{
			$.ajax({
				url : "../front?command=userPassWordFind",
				type : "post",
				data : "id="+$(".passwordform input[name=id]").val(), 
				dataType : "text",
				success : function(result){
					if($.trim(result) == ""){
						$(".passwordform #passfind").text("아이디가 존재하지 않습니다 다시 입력해 주십시오");
						$(".passwordform button").hide();
					}else{
						$(".passwordform #passfind").text("비밀번호 : " + result );
						$(".passwordform button").show();
					}
				},
				error : function(err){
					console.log(err);
				}
				
			});
		}
	}); // 패스워드 찾기 끝
	$(".passwordform button").click(function(){
		document.location.href="/ItemMarket/view/index.jsp";
	});
});
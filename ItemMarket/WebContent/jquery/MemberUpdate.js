$(document).ready(function(){
	$(document).on("click",".memberupdatesubmit input[value=확인]",function(){
		$.ajax({
			url: "../front?command=userUpdate",
			type: "post",
			data: $("#updateform").serialize(),
			dataType: "text",
			success: function(result){
				if(result <=0){
					alert("수정이 실패하였습니다.");
				}else{
					$.ajax({
		
						url: "../front?command=userUpdateOnLoad",
						type : "post",
						data : "id="+$("#updateform ul li input[name=id]").val(),
						dataType :"text",
						success: function(result){
							if(result <= 0){
								alert("수정이 실패하였습니다.");
							}else{
								document.location.href="index.jsp"
							}
						},
						error : function(err){
							
						}
					});
				
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	});//수정 이벤트 마지막 부분
	
	/* 수정 취소 */
	$(".memberupdatesubmit input[value=취소]").click(function(){
		document.location.href="index.jsp";
	});
	
	$(document).on("click",".passwordchagesubmit input[value=확인]",function(){
		if($(".passwordchage input[name=newpassword]").val() != $(".passwordchage input[name=newpassowrd2]").val()){
			alert("변경된 비밀번호가 갖지 않습니다 다시 입력해 주십시오");
		
		}else{
			$.ajax({
				url : "../front?command=userPasswordUpdate",
				type : "post",
				data : $("#passwordUpdate").serialize(),
				dataType : "text",
				success : function(result){
					if(result <=0){
						alert("현재 비밀번호가 맞지 않습니다 다시 입력해 주십시오");
					}else{
						document.location.href="index.jsp";
					}
				},
				error : function(err){
					
				}
			});
		}
	});///비밀번호 변경 마지막 부분
	
	/* 비밀번호 취소 */
	$(".passwordchagesubmit input[value=취소]").click(function(){
		document.location.href="index.jsp";
	});
});
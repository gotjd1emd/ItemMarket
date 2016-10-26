$(document).ready(function(){
	$(".pagination li a").click(function() {
		$.ajax({
			url : $('[name=location]').val()+"/front?command=search",
			type : "get",
			data : {category:$('[name=category').val(),
						subCategory:$('[name=subCategory').val(),
						word:$('[name=search]').val(),
						page:$(this).text()},
			dataType : "json",
			success : function(result) {
				alert("ajax");
				$('.noticeboard').empty();
				$.each(result, function(index, items) {
					$('.noticeboard').append("<ul>"+
						"<li><img src='"+$('[name=location]').val()+"image/sampleamcbook.jpg' alt='noticeboard'></li>"+
						"<li>작성자 : <span>" + items.id + "</span></li>"+
						"<li>제품 : <span>" + items.itemName + "</span></li>"+
						"<li>가격 : <span>" + items.money + "원</span></li>"+
						"<li><a href='view/Explanation.jsp'><button>상세설명</button></a></li></ul>"
					);
				});
			},
			error : function(err) {
				console.log("err : " + err);
			}
		});
	})
});
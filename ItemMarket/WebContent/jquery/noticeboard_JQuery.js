$(document).ready(function(){
	
	$(".pagination").on("click", "li .page", (function() {
		$.ajax({

			url : $('[name=location]').val()+"/front?command=search",
			type : "get",
			data : {category:$('[name=category').val(),
						subCategory:$('[name=subCategory').val(),
						word:$('[name=search]').val(),
						page:$(this).text()},
			dataType : "json",
			success : function(result) {
				console.log("result : " + result);
				console.log("result.jsonObject : " + result.jsonObject);
				$('.noticeboard').empty();
				
				$.each(result, function(index, items) {
					if((typeof items) == 'object') {
					$('.noticeboard').append("<ul>"+
						"<li><img src='"+$('[name=location]').val()+"image/sampleamcbook.jpg' alt='noticeboard'></li>"+
						"<li>작성자 : <span>" + items.id + "</span></li>"+
						"<li>제품 : <span>" + items.itemName + "</span></li>"+
						"<li>가격 : <span>" + items.money + "원</span></li>"+
						"<li><a href='view/Explanation.jsp'><button>상세설명</button></a></li></ul>"
					);
					}else {
						//alert(items);
					}
				});
			},
			error : function(err) {
				console.log("err : " + err);

			}
		});
		$(".pagination li").removeAttr("class");
		$(this).parents("li").attr("class", "active");
	}));
	
	
	$(".pagination").on("click", "li a[aria-label=Next]", (function() {
		var pageNum = $(this).parent("li").prev().children("a").text()*1+1;
		$.ajax({
			url : $('[name=location]').val()+"/front?command=search",
			type : "get",
			data : {category:$('[name=category').val(),
						subCategory:$('[name=subCategory').val(),
						word:$('[name=search]').val(),
						page:pageNum},
			dataType : "json",
			success : function(result) {
				console.log("result : " + result);
				console.log("result.jsonObject : " + result.jsonObject);
				$('.noticeboard').empty();
				$('.pagination').empty();
				$.each(result, function(index, items) {
					if((typeof items) == 'object') {
						$('.noticeboard').append("<ul>"+
							"<li><img src='"+$('[name=location]').val()+"image/sampleamcbook.jpg' alt='noticeboard'></li>"+
							"<li>작성자 : <span>" + items.id + "</span></li>"+
							"<li>제품 : <span>" + items.itemName + "</span></li>"+
							"<li>가격 : <span>" + items.money + "원</span></li>"+
							"<li><a href='view/Explanation.jsp'><button>상세설명</button></a></li></ul>"
						);
					}else {
						for(var i = pageNum; i <= items; i++) {
							if(i == pageNum) {
								$(".pagination").append("<li><a href='#' aria-label='Previous'>"+
								"<span aria-hidden='true'>&laquo;</span></a></li>"+
								"<li class='active'><a href='#' class='page'>" + i + "</a></li>");
							}else if(i < (pageNum+5)) {
								$(".pagination").append("<li><a href='#' class='page'>" + i + "</a></li>");
							}else if(i == (pageNum+5)) {
								$(".pagination").append("<li><a href='#' aria-label='Next'>"+
										"<span aria-hidden='true'>&raquo;</span></a></li>");
							}
						}
					}
				});
			},
			error : function(err) {
				console.log("err : " + err);
			}
		});
	}));
	
	$(".pagination").on("click", "li a[aria-label=Previous]", (function() {
		var pageNum = $(this).parent("li").next().children("a").text()*1-1;
		$.ajax({
			url : $('[name=location]').val()+"/front?command=search",
			type : "get",
			data : {category:$('[name=category').val(),
						subCategory:$('[name=subCategory').val(),
						word:$('[name=search]').val(),
						page:pageNum},
			dataType : "json",
			success : function(result) {
				console.log("result : " + result);
				console.log("result.jsonObject : " + result.jsonObject);
				$('.noticeboard').empty();
				$('.pagination').empty();
				$.each(result, function(index, items) {
					if((typeof items) == 'object') {
						$('.noticeboard').append("<ul>"+
							"<li><img src='"+$('[name=location]').val()+"image/sampleamcbook.jpg' alt='noticeboard'></li>"+
							"<li>작성자 : <span>" + items.id + "</span></li>"+
							"<li>제품 : <span>" + items.itemName + "</span></li>"+
							"<li>가격 : <span>" + items.money + "원</span></li>"+
							"<li><a href='view/Explanation.jsp'><button>상세설명</button></a></li></ul>"
						);
					}else {
						for(var i = pageNum; i >= 0; i--) {
							if(i == pageNum) {
								$(".pagination").prepend("<li class='active'><a href='#' class='page'>" + i +
										"</a></li><li><a href='#' aria-label='Next'>"+
										"<span aria-hidden='true'>&raquo;</span></a></li>");
							}else if(i > (pageNum-5)) {
								$(".pagination").prepend("<li><a href='#' class='page'>" + i + "</a></li>");
							}else if((pageNum-5) != 0) {
								$(".pagination").prepend("<li><a href='#' aria-label='Previous'>"+
										"<span aria-hidden='true'>&laquo;</span></a></li>");
							}
						}
					}
				});
			},
			error : function(err) {
				console.log("err : " + err);
			}
		});
	}));
});
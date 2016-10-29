$(document).ready(function(){
	
	$(".pagination").on("click", "li .page", (function() {
		$.ajax({

			url : $('[name=location]').val()+"/front?command=search",
			type : "get",
			data : {category:$('[name=category').val(),
						subCategory:$('[name=subCategory').val(),
						word:$('[name=search]').val(),
						page:$(this).text()}
				,
			dataType : "json",
			success : function(result) {
				console.log("result : " + result);
				console.log("result.jsonObject : " + result.jsonObject);
				$('.noticeboard').empty();
				
				$.each(result, function(index, items) {
					if((typeof items) == 'object') {
					$('.noticeboard').append("<ul>"+
						"<li><img src='"+$('[name=location]').val()+'img/' + items.img +"' alt='noticeboard'></li>"+
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
	
	/* 카탈로그 */
	$(".search ul li select[name=category]").change(function(){
		var category = "" ;
		if($(".search ul li select[name=category]").val() == "전자제품"){
			$(".search ul li select[name=subcategory]").empty();
			$(".search ul li select[name=subcategory]").append("<option value='1'>==서브카테고리==</option>");
			$(".search ul li select[name=subcategory]").append("<option value='컴퓨터'>컴퓨터</option>");
			$(".search ul li select[name=subcategory]").append("<option value='휴대폰'>휴대폰</option>");
			$(".search ul li select[name=subcategory]").append("<option value='멀티미디어'>멀티미디어</option>");
			$(".search ul li select[name=subcategory]").append("<option value='프린터'>프린터</option>");
		}else if($(".search ul li select[name=category]").val() == "의류"){
			$(".search ul li select[name=subcategory]").empty();
			$(".search ul li select[name=subcategory]").append("<option value='1'>==서브카테고리==</option>");
			$(".search ul li select[name=subcategory]").append("<option value='여성의류'>여성의류</option>");
			$(".search ul li select[name=subcategory]").append("<option value='남성의류'>남성의류</option>");
			$(".search ul li select[name=subcategory]").append("<option value='신발'>신발</option>");
			$(".search ul li select[name=subcategory]").append("<option value='캐쥬얼'>캐쥬얼</option>");
			$(".search ul li select[name=subcategory]").append("<option value='영/유아'>영/유아</option>");
			$(".search ul li select[name=subcategory]").append("<option value='악세사리'>악세사리</option>");	
		}else if($(".search ul li select[name=category]").val() == "생활"){
			$(".search ul li select[name=subcategory]").empty();
			$(".search ul li select[name=subcategory]").append("<option value='1'>==서브카테고리==</option>");
			$(".search ul li select[name=subcategory]").append("<option value='잡화'>잡화</option>");
			$(".search ul li select[name=subcategory]").append("<option value='주방'>주방</option>");
		}else if($(".search ul li select[name=category]").val() == "가구"){
			$(".search ul li select[name=subcategory]").empty();
			$(".search ul li select[name=subcategory]").append("<option value='1'>==서브카테고리==</option>");
			$(".search ul li select[name=subcategory]").append("<option value='침구'>침구</option>");
			$(".search ul li select[name=subcategory]").append("<option value='테이블'>테이블</option>");
			$(".search ul li select[name=subcategory]").append("<option value='의자'>의자</option>");
			$(".search ul li select[name=subcategory]").append("<option value='스탠드'>스탠드</option>");
			$(".search ul li select[name=subcategory]").append("<option value='옷장'>옷장</option>");
		}else if($(".search ul li select[name=category]").val() == "의료,의약"){
			
		}else if($(".search ul li select[name=category]").val() == "사무용품"){
			
		}
	});
});
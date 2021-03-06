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
						"<li><img src='"+$('[name=location]').val()+'img/' + items.mainImg +"'/></li>"+
						"<li>작성자 : <span>" + items.id + "</span></li>"+
						"<li>제품 : <span>" + items.itemName + "</span></li>"+
						"<li>가격 : <span>" + items.money + "원</span></li>"+
						"<li><a href='"+$('[name=location]').val()+"/front?command=read&border_number="+items.borderNumber+"&id="+items.id+"'>" +
								"<button>상세설명</button></a></li></ul>"
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
							"<li><img src='"+$('[name=location]').val()+'img/' + items.mainImg +"'/></li>"+
							"<li>작성자 : <span>" + items.id + "</span></li>"+
							"<li>제품 : <span>" + items.itemName + "</span></li>"+
							"<li>가격 : <span>" + items.money + "원</span></li>"+
							"<li><a href='"+$('[name=location]').val()+"/front?command=read&border_number="+items.borderNumber+"&id="+items.id+"'>" +
							"<button>상세설명</button></a></li></ul>"
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
							"<li><img src='"+$('[name=location]').val()+'img/' + items.mainImg +"'/></li>"+
							"<li>작성자 : <span>" + items.id + "</span></li>"+
							"<li>제품 : <span>" + items.itemName + "</span></li>"+
							"<li>가격 : <span>" + items.money + "원</span></li>"+
							"<li><a href='"+$('[name=location]').val()+"/front?command=read&border_number="+items.borderNumber+"&id="+items.id+"'>" +
							"<button>상세설명</button></a></li></ul>"
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
	var category = "";
	var subCategory = "";
	
	$(".search ul li select[name=category]").change(function(){
		if($(".search ul li select[name=category]").val() == "전자제품"){
			$(".search ul li select[name=subcategory]").empty();
			$(".search ul li select[name=subcategory]").append("<option value='1'>==서브카테고리==</option>");
			$(".search ul li select[name=subcategory]").append("<option value='컴퓨터'>컴퓨터</option>");
			$(".search ul li select[name=subcategory]").append("<option value='가전제품'>가전제품</option>");
			$(".search ul li select[name=subcategory]").append("<option value='휴대폰'>휴대폰</option>");
			$(".search ul li select[name=subcategory]").append("<option value='멀티미디어'>멀티미디어</option>");
			$(".search ul li select[name=subcategory]").append("<option value='프린터'>프린터</option>");
		}else if($(".search ul li select[name=category]").val() == "의류"){
			$(".search ul li select[name=subcategory]").empty();
			$(".search ul li select[name=subcategory]").append("<option value='1'>==서브카테고리==</option>");
			$(".search ul li select[name=subcategory]").append("<option value='여성의류'>여성의류</option>");
			$(".search ul li select[name=subcategory]").append("<option value='남성의류'>남성의류</option>");
			$(".search ul li select[name=subcategory]").append("<option value='신발'>신발</option>");
			$(".search ul li select[name=subcategory]").append("<option value='영/유아'>영/유아</option>");
			$(".search ul li select[name=subcategory]").append("<option value='악세사리'>악세사리</option>");	
		}else if($(".search ul li select[name=category]").val() == "생활"){
			$(".search ul li select[name=subcategory]").empty();
			$(".search ul li select[name=subcategory]").append("<option value='1'>==서브카테고리==</option>");
			$(".search ul li select[name=subcategory]").append("<option value='인테리어'>인테리어</option>");
			$(".search ul li select[name=subcategory]").append("<option value='부억'>부억</option>");
			$(".search ul li select[name=subcategory]").append("<option value='공구'>공구</option>");
		}else if($(".search ul li select[name=category]").val() == "가구"){
			$(".search ul li select[name=subcategory]").empty();
			$(".search ul li select[name=subcategory]").append("<option value='1'>==서브카테고리==</option>");
			$(".search ul li select[name=subcategory]").append("<option value='침구'>침구</option>");
			$(".search ul li select[name=subcategory]").append("<option value='테이블'>테이블</option>");
			$(".search ul li select[name=subcategory]").append("<option value='벽장'>벽장</option>");
			$(".search ul li select[name=subcategory]").append("<option value='소파'>소파</option>");
		}else if($(".search ul li select[name=category]").val() == "의학 용품"){
			$(".search ul li select[name=subcategory]").empty();
			$(".search ul li select[name=subcategory]").append("<option value='1'>==서브카테고리==</option>");
			$(".search ul li select[name=subcategory]").append("<option value='진찰기'>진찰기</option>");
			$(".search ul li select[name=subcategory]").append("<option value='교정기'>교정기</option>");
			$(".search ul li select[name=subcategory]").append("<option value='걸음보저기'>걸음보저기</option>");
			$(".search ul li select[name=subcategory]").append("<option value='붕대,거즈,밴드..'>붕대,거즈,밴드..</option>");
		}else if($(".search ul li select[name=category]").val() == "사무용품"){
			$(".search ul li select[name=subcategory]").empty();
			$(".search ul li select[name=subcategory]").append("<option value='1'>==서브카테고리==</option>");
			$(".search ul li select[name=subcategory]").append("<option value='문구류'>문구류</option>");
			$(".search ul li select[name=subcategory]").append("<option value='종이'>종이</option>");
			$(".search ul li select[name=subcategory]").append("<option value='기타'>기타</option>");
		}
		category = "&category="+$(this).val();
	});
		$(".search ul li select[name=subcategory]").change(function(){
			subCategory = "&subCategory="+$(this).val();
		});
		
		$(".glyphicon.glyphicon-search").click(function(){ //임시로 주소갑 줌
			document.location.href="/ItemMarket/front?command=search"+category+subCategory+"&word="+$("input[name=search]").val()+"&page=0";
		});
});
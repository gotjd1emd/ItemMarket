$(document).ready(function(){
/* border sale value */

	$("form ul li input[value=판매방식]").click(function(){
		
			$(".saledialog").dialog({
				minWidth :410,
				modal : true,
				show : {
					effect : "slide",
					duration : 1000
				},
				
				hide : {
					effect :"slide",
					duration : 1000
				}
				
			});
	});
	
	$(".saledialog ul li").click(function(){
		$("form ul li input[name=sale]").attr("value",$(this).text());
		$(".saledialog").dialog("close");
	});
	
	$("form ul li input[value=카테고리]").click(function(){
		$(".bigcategory").dialog({
			minWidth : 600,
			minHeight : 400,
			modal : true,
			show : {
				effect :"slide",
				duration: 1000
			},
			hide : {
				effect:"slide",
				duration: 1000
			}
		})
	});
	
	$(".bigcategory ul li").click(function(){
		$("form ul li input[name=category]").attr("value",$(this).text());
		$(".bigcategory").dialog("close");
		if($(this).text() == "전자제품"){
			$("form ul li:nth-child(4)").html('컴퓨터<input type="radio" name="subcategory" value="컴퓨터">휴대폰<input type="radio" name="subcategory" valjue="휴대폰">멀티미디어<input type="radio" name="subcategory" value="멀티미디어">');
		}
		if($(this).text() == "의류"){
			$("form ul li:nth-child(4)").html('여성의류<input type="radio" name="subcategory" value="여성의류">남성의류<input type="radio" name="subcategory" valjue="남성의류">신발<input type="radio" name="subcategory" value="신발">캐쥬얼<input type="radio" name="subcategory" value="캐쥬얼">영/유아<input type="radio" name="subcategory" value="영/유아">악세서리<input type="radio" name="subcategory" value="악세서리">');
		}
		if($(this).text() == "생활"){
			$("form ul li:nth-child(4)").html('잡화<input type="radio" name="subcategory" value="잡화">주방<input type="radio" name="subcategory" valjue="주방">공구<input type="radio" name="subcategory" value="공구">');
		}
		if($(this).text() == "가구"){
			$("form ul li:nth-child(4)").html('침구 <input type="radio" name="subcategory" value="침구">인테리어<input type="radio" name="subcategory" valjue="인테리어">');
		}
		if($(this).text() == "의료,의약"){
			$("form ul li:nth-child(4)").html('의료기기<input type="radio" name="subcategory" value="의료기기">다이어트제품<input type="radio" name="subcategory" valjue="다이어트제품">');
		}
		if($(this).text() == "사무용품"){
			$("form ul li:nth-child(4)").html('소모품<input type="radio" name="subcategory" value="소모품">프린터<input type="radio" name="subcategory" valjue="프린터">');
		}
		
	});
	
	
	
	/* board file input create */
	var file="";
	var filenum = 0;
	$(".imgs .imgbtn img").click(function(){
		file +="<li><input type='file' name='fileName"+filenum+"'></li>"
		filenum++;
		$(".imgs ul").html(file);
	});
	
	
	
});
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
			$("form>ul li[name=radio]").html('컴퓨터<input type="radio" name="subcategory" value="컴퓨터"> 가전제품<input type="radio" name="subcategory" value="가전제품"> 휴대폰<input type="radio" name="subcategory" value="휴대폰"> 멀티미디어<input type="radio" name="subcategory" value="멀티미디어">');
		}
		if($(this).text() == "의류"){
			$("form>ul li[name=radio]").html('여성의류<input type="radio" name="subcategory" value="여성의류"> 남성의류<input type="radio" name="subcategory" value="남성의류"> 신발<input type="radio" name="subcategory" value="신발"> 영/유아<input type="radio" name="subcategory" value="영/유아"> 악세서리<input type="radio" name="subcategory" value="악세서리">');
		}
		if($(this).text() == "생활"){
			$("form>ul li[name=radio]").html('인테리어<input type="radio" name="subcategory" value="인테리어"> 부억<input type="radio" name="subcategory" value="부억"> 공구<input type="radio" name="subcategory" value="공구">');
		}
		if($(this).text() == "가구"){
			$("form>ul li[name=radio]").html('침구 <input type="radio" name="subcategory" value="침구"> 벽장<input type="radio" name="subcategory" value="벽장"> 테이블<input type="radio" name="subcategory" value="테이블"> 소파<input type="radio" name="subcategory" value="소파">');
		}
		if($(this).text() == "의학 용품"){
			$("form>ul li[name=radio]").html('진찰기<input type="radio" name="subcategory" value="진찰기"> 교정기<input type="radio" name="subcategory" value="교정기"> 걸음보저기<input type="radio" name="subcategory" value="걸음보저기"> 붕대,거즈,밴드..<input type="radio" name="subcategory" value="붕대,거즈,밴드..">');
		}
		if($(this).text() == "사무용품"){
			$("form>ul li[name=radio]	").html('문구류<input type="radio" name="subcategory" value="문구류"> 종이<input type="radio" name="subcategory" value="종이"> 기타<input type="radio" name="subcategory" value="기타"> ');
		}
		
	});
	
	
	
	/* board file input create */
	var file="";
	var filenum = 0;
	$(".imgs .imgbtn img").click(function(){
		if(filenum<6){
		filenum++;
		$(".imgs ul").append("<li><input type='file' name='fileName"+filenum+"'></li>");
		}else{
		alert("6개가 최대입니다.")
		}
	});
	
	
	
});
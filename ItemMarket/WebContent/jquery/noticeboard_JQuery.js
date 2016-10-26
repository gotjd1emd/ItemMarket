$(document).ready(function(){
	$(".pagination li a").click(function() {
		$.ajax({
			url : "../search",
			type : "get",
			data : "/front?command=search&category="+$('[name=category').val()
						+"&subCategory="+$('[name=subCategory').val()
						+"&word="+$('[name=search]').val()
						+"&page="+$(this).text(),
			dataType : "json",
			success : function(result) {
				$.each(result, function(index, items) {
					
				});
			},
			error : function(err) {
				
			}
		});
	})
});
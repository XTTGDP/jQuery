$(document).ready(function(){
	$(".boxrm1").mousemove(function(){
		
		var _index = $(this).index();
		$(".boxrm1-o>img").eq(_index).css({
			"transition":"2s",
			'transform':'scale(1.2,1.2)'
			});
		});
		
		
	$(".boxrm1").mouseout(function(){
		var _index = $(this).index();
		$(".boxrm1-o>img").eq(_index).css({
			"transition":"2s",
			'transform':'scale(1,1)'
			});
		});


});









$(document).ready(function(){
	$(".boxrm2").mousemove(function(){
		
		var _index = $(this).index();
		$(".boxrm1-o>img").eq(_index).css({
			"transition":"2s",
			'transform':'scale(1.2,1.2)'
			});
		});
		
		
	$(".boxrm2").mouseout(function(){
		var _index = $(this).index();
		$(".boxrm1-o>img").eq(_index).css({
			"transition":"2s",
			'transform':'scale(1,1)'
			});
		});


})



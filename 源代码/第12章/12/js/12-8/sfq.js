$(function(){
	 $(".ul li").mouseover(function(){
        var _index = $(this).index();
        $('.min').children().eq($(this).index()).show().siblings().hide();
        $('.min').children().eq(_index).css("margin-top",76*_index);
    })
})
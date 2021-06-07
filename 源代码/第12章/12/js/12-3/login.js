 $(function(){
	 $("#login1-2 label").click(function(){
        var _index = $(this).index();
        $(".tab-box>div").eq(_index).show().siblings().hide();
        $("#login1-2 label").eq(_index).addClass("ons").siblings().removeClass("ons");

    });
 })
  $().ready(function(){
      $(".xc_d1_1_1 li").mouseover(function(){
          var _index = $(this).index();
          $(".tab-box>div").eq(_index).show().siblings().hide();
      });
  });
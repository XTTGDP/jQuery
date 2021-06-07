$(document).ready(function() {
            var blw=$("#myscrollbox li").width();

            var liArr = $("#myscrollbox ul").children("li");

            var mysw = $("#myscroll").width();

            var mus = parseInt(mysw/blw);

            var length = liArr.length-mus;

            var i=0;
            $("#right").click(function(){
                i++

                if(i<length){
                    $("#myscrollbox").css("left",-(blw*i));

                }else{
                    i=length;
                    $("#myscrollbox").css("left",-(blw*length));

                }
            });
            $("#left").click(function(){
                i--

                if(i>=0){
                    $("#myscrollbox").css("left",-(blw*i));

                }else{
                    i=0;
                    $("#myscrollbox").css("left",0);

                }
            });
        });
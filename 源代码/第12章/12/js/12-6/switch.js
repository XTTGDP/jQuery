$(function(){
	var oBox = document.getElementById('box'),
            left = oBox.getElementsByClassName('left'),
            right = oBox.getElementsByClassName('img'),
            index1 = 0,
            btn = oBox.getElementsByClassName('btn'),
            arrimg = [],
            arrbtn = [];

            //鼠标滑过左侧li，让对应的右侧li显示
            for(var i = 0, len = left.length; i < len; i++){
                left[i].index = i;
                left[i].onclick = function(){
                    left[index1].classList.remove('on')
                    right[index1].classList.remove('on')
                    
                    index1 = this.index;

                    left[index1].classList.add('on')
                    right[index1].classList.add('on')
                }
            }

            //鼠标滑过右侧btn，让对应图片显示
            var list = oBox.getElementsByClassName('list')
               length = right.length;
            for( i = 0 ; i < length; i++){
               arrimg[i] = right[i].getElementsByTagName('img');
               arrbtn[i] = list[i].getElementsByTagName('li');
               arrbtn[i].show = 0;
               for(var j = 0,len = arrbtn[i].length; j < len; j++){
                   arrbtn[i][j].indexI = i;
                   arrbtn[i][j].indexJ = j;
                   arrbtn[i][j].onclick = function(){
                        var i = this.indexI,
                            j = arrbtn[i].show;

                        arrimg[i][j].classList.remove('on');
                        arrbtn[i][j].classList.remove('on');

                         arrbtn[i].show = j = this.indexJ;

                        arrimg[i][j].classList.add('on');
                        arrbtn[i][j].classList.add('on');
                   }
               }
           }
})
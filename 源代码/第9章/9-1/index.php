<html>
<head>
<meta charset='utf-8'>
<title>使用Uploadify插件上传图片</title>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/jquery.uploadify-3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="uploadify.css"/>
<script type="text/javascript">
var img_id_upload=new Array();//初始化数组，存储已经上传的图片名
var i=0;//初始化数组下标
$(function() {
    $('#file_upload').uploadify({
    	'auto'     : false,              // 关闭自动上传
    	'removeTimeout' : 1,             // 文件队列上传完成1秒后删除
        'swf'      : 'uploadify.swf',    // 指明swf文件路径
        'script' : 'uploadify.php',    // 指明后台处理文件路径
        'method'   : 'post',             // 方法，服务端可以用$_POST数组获取数据
		'buttonText' : '选择图片',       // 设置按钮文本
        'multi'    : true,               // 允许同时上传多张图片
        'uploadLimit' : 10,              // 一次最多只允许上传10张图片
        'fileTypeDesc' : 'Image Files',  // 只允许上传图像
        'fileTypeExts' : '*.gif; *.jpg; *.png',// 限制允许上传的图片后缀
        'fileSizeLimit' : '20000KB',     // 限制上传的图片不得超过200KB 
        'onUploadSuccess' : function(file, data, response) {//每次成功上传后执行的回调函数，从服务端返回数据到前端
               img_id_upload[i]=data;
               i++;
			   alert(data);
        }
    });
	$("#upload").click(function(){
		$('#file_upload').uploadify('upload','*');   // 上传全部文件
	});
	$("#reset").click(function(){
		$('#file_upload').uploadify('cancel','*');   // 取消全部文件上传
	});
});
</script>
</head>
<body>
<h3>使用uploadify插件实现多图片上传</h3>
<input type="file" name="file_upload" id="file_upload" />
<input type="button" id="upload" name="upload" value="上传" />
<input type="button" name="reset" id="reset" value="重置"/>
</body>
</html>
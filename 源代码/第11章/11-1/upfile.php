<?php
	$dir = getcwd()."\\upload\\";          // 定义上传目录
	$path = $dir.$_FILES["upload_file"]["name"];    // 定义上传文件路径
	if(!is_dir($dir)){                    // 如果指定目录不存在
		mkdir($dir);                      // 创建指定目录
	}
	if(file_exists($_FILES["upload_file"]["tmp_name"])){
		move_uploaded_file($_FILES["upload_file"]["tmp_name"],iconv("utf-8","gbk",$path));      // 上传文件
		echo "文件为：".$path."<br/>";                                     // 文件路径
		echo "文件名称：".$_FILES["upload_file"]["name"]."<br/>";          // 文件名称
		echo "文件类型：".$_FILES["upload_file"]["type"]."<br/>";          // 文件类型
		echo "文件大小：".$_FILES["upload_file"]["size"]."<br/>";          // 文件大小
		echo "临时文件为：".$_FILES["upload_file"]["tmp_name"]."<br/>";    // 临时文件
	}else{
		echo "上传失败！";
	}
?>
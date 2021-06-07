/*
 * @Author: your name
 * @Date: 2020-12-17 01:08:15
 * @LastEditTime: 2020-12-17 01:25:17
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \Web\JQuery基础\Ch7JQuery的Ajax操作\06test.php
 */
<?php
	if(!empty($_GET['username']) && !empty($_GET['content'])){
		$username = $_GET['username'];
		$content = $_GET['content'];
		$dataArray = array("username"=>$username,"content"=>$content);
		$jsonStr = json_encode($dataArray);
		echo $jsonStr;
	}
?>
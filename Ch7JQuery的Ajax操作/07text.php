/*
 * @Author: your name
 * @Date: 2020-12-17 01:24:19
 * @LastEditTime: 2020-12-17 01:24:48
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \Web\JQuery基础\Ch7JQuery的Ajax操作\07text.php
 */
<?php
	if(!empty($_POST['username'])){
		$username = $_POST['username'];
		$sex = $_POST['sex'];
		$age = $_POST['age'];
		$email = $_POST['email'];
		$address = $_POST['address'];
		$content = $_POST['content'];
		$dataArray = array(
					"username"=>$username,
					"sex"=>$sex,
					"age"=>$age,
					"email"=>$email,
					"address"=>$address,
					"content"=>$content,
					);
		$jsonStr = json_encode($dataArray);
		echo $jsonStr;
	}
?>
/*
 * @Author: your name
 * @Date: 2020-12-15 15:27:27
 * @LastEditTime: 2020-12-15 15:30:39
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \Web\JQuery基础\Ch7JQuery的Ajax操作\03post.php
 */
<?php
    if(!empty($_POST['username']&& !empty($_POST['content'])){
        $username=$_POST(['username']);
        $content=$_POST(['content']);
        $dataArray=array("username"=>$username,"content"=>$content);
        $jsonStr=json_encode($dataArray);
        echo $jsonStr;
    }
?>
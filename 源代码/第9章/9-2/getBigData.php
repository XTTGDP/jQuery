[<?php
$pId = "-1";
if(array_key_exists( 'id',$_REQUEST)) {      // 如果提交的数据中存在参数id
	$pId=$_REQUEST['id'];                    
}
$pCount = "10";
if(array_key_exists( 'count',$_REQUEST)) {   // 如果提交的数据中存在参数count
	$pCount=$_REQUEST['count'];
}
if ($pId==null || $pId=="") $pId = "0";     
if ($pCount==null || $pCount=="") $pCount = "10"; // 如果count不存在，则默认为10

$max = (int)$pCount;    // 设置最大值为$pCount
for ($i=1; $i<=$max; $i++) {     // 进行max次循环
	$nId = $pId."_".$i;          // 设置节点的name值
	$nName = "tree".$nId;
	echo "{ id:'".$nId."',	name:'".$nName."'}";   // 一个节点的JSON数据
	if ($i<$max) {              // 如果i的值小于max，则输出逗号
		echo ",";               // 目的是组合成多组JSON数据
	}
}
?>]
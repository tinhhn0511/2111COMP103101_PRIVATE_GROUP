<?php
	include_once("Model/Category.php");
	$cate = new Category();
	include_once("View/Category/Insert.php");
	if(isset($_POST['btnSave']))
		{
			$categoryName = $_POST['txtCategoryName'];
			$position = $_POST['txtPosition'];
			$ret=$cate->InsertCategory($categoryName,$position);
			if($ret>0)
			{
				header("location:admin.php?mod=category&act=manage");
			}
		}
	
?>
<?php
	require_once "config.php";
	$db = mysqli_connect($db_host,$db_user, $db_pass, $db_db);
	if(mysqli_connect_error()){
		if($show_error)
			echo "Erro(conect.php): " . mysqli_connect_error();
		die();
	}
	

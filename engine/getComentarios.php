<?php
function getComentarios($data){
	require_once "conect.php";
	$query = "
		SELECT * FROM `pao_publicacao`
		WHERE `data` = '$data'
	";
	$resposta = $db->query($query);

	if ($stmt = mysqli_prepare($db, $query)) {
		mysqli_stmt_execute($stmt);
		mysqli_stmt_bind_result($stmt, $data, $texto);
		$publicacao = null;
		while (mysqli_stmt_fetch($stmt)) {
			$publicacao["data"] = $data;
			$publicacao["texto"] = $texto;
		}
		mysqli_stmt_close($stmt);
		return $publicacao;
	}
	else{
		return  false;
	}
}

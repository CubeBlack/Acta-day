<?php
function getPublicacao($data){
	require_once "conect.php";
	$query = "
		SELECT * FROM `publicacao_diaria`
		WHERE `dia` = '$data'
	";
	$resposta = $db->query($query);

	if ($stmt = mysqli_prepare($db, $query)) {
		mysqli_stmt_execute($stmt);
		mysqli_stmt_bind_result($stmt,
			$dia,
			$título,
			$versiculo,
			$referencia_versiculo,
			$texto,
			$oracao,
			$missao_diaria,
			$publicado_por
		);
		$publicacao = null;
		while (mysqli_stmt_fetch($stmt)) {
			$publicacao["dia"] = $dia;
			$publicacao["titulo"] = $título;
			$publicacao["versiculo"] = $versiculo;
			$publicacao["referencia_versiculo"] = $referencia_versiculo;
			$publicacao["texto"] = utf8_encode($texto);
			$publicacao["oracao"] = $oracao;
			$publicacao["missao_diaria"] = $missao_diaria;
			$publicacao["publicado_por"] = $publicado_por;
		}
		mysqli_stmt_close($stmt);
		return $publicacao;
	}
	else{
		return  false;
	}
}

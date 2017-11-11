<?php
	require_once "conect.php";
	$query = "SELECT * FROM `pao_comentarios`";
	$resposta = $db->query($query);
	
if ($stmt = mysqli_prepare($db, $query)) {

    /* execute statement */
    mysqli_stmt_execute($stmt);
	//var_dump ($stmt);
	if(true){
		 /* bind result variables */
		mysqli_stmt_bind_result($stmt, $id_comentarios, $id_usuario, $id_publicacao, $comentarios);

		/* fetch values */
		while (mysqli_stmt_fetch($stmt)) {
			echo $id_comentarios . $id_comentarios . $id_publicacao . $comentarios;
		}
	}
	else{
		echo "Sem comentarios";
	}

    /* close statement */
    mysqli_stmt_close($stmt);
}
else{
	echo "Erro no Query";
}
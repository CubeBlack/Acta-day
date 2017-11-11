<?php
header('Content-Type: application/json; charset=ISO-8859-1');
//header('Content-Type: text/html; charset=ISO-8859-1');

require_once "engine/engine.php";

if (isset($_GET["data"])) {
  $data = $_GET["data"];
}
else {
  $data = date('Y-m-d');
}

$publicacao = getPublicacao($data);


echo json_encode($publicacao);

<?php
include "config.php";
include "utils.php";


$dbConn =  connect($db);

/*
  listar todos los posts o solo uno
 */
if ($_SERVER['REQUEST_METHOD'] == 'GET')
{
    if (isset($_GET['id_pastelpersozalizados']))
    {
      //Mostrar un post
      $sql = $dbConn->prepare("SELECT * FROM pasteles_personalizados where id_pastelpersozalizados=:id_pastelpersozalizados");
      $sql->bindValue(':id_pastelpersozalizados', $_GET['id_pastelpersozalizados']);
      $sql->execute();
      header("HTTP/1.1 200 OK");
      echo json_encode(  $sql->fetch(PDO::FETCH_ASSOC)  );
      exit();
	  }
    else {
      //Mostrar lista de post
      $sql = $dbConn->prepare("SELECT * FROM pasteles_personalizados");
      $sql->execute();
      $sql->setFetchMode(PDO::FETCH_ASSOC);
      header("HTTP/1.1 200 OK");
      echo json_encode( $sql->fetchAll()  );
      exit();
	}
}

// Crear un nuevo post
if ($_SERVER['REQUEST_METHOD'] == 'POST')
{
    $input = $_POST;
    $sql = "INSERT INTO pasteles_personalizados
    (id_cliente,id_kilos,id_tablas,ubicacion,fecha entrega,flete,precio_total,id_usuario)
    VALUES
    (:id_cliente, :id_kilos, :id_tablas, :ubicacion, :fecha entrega, :flete, :precio_total, :id_usuario)";
    $statement = $dbConn->prepare($sql);
    bindAllValues($statement, $input);
    $statement->execute();
    $postId = $dbConn->lastInsertId();
    if($postId)
    {
      $input['id_pastelpersozalizados'] = $postId;
      header("HTTP/1.1 200 OK");
      echo json_encode($input);
      exit();
	 }
}

//Borrar
if ($_SERVER['REQUEST_METHOD'] == 'DELETE')
{
	$id_pastelpersozalizados = $_GET['id_pastelpersozalizados'];
  $statement = $dbConn->prepare("DELETE FROM pasteles_personalizados where id_pastelpersozalizados=:id_pastelpersozalizados");
  $statement->bindValue(':id_pastelpersozalizados', $id_pastelpersozalizados);
  $statement->execute();
	header("HTTP/1.1 200 OK");
	exit();
}

//Actualizar
if ($_SERVER['REQUEST_METHOD'] == 'PUT')
{
    $input = $_GET;
    $postId = $input['id_pastelpersozalizados'];
    $fields = getParams($input);

    $sql = "
          UPDATE pasteles_personalizados
          SET $fields
          WHERE id_pastelpersozalizados='$postId'
           ";

    $statement = $dbConn->prepare($sql);
    bindAllValues($statement, $input);

    $statement->execute();
    header("HTTP/1.1 200 OK");
    exit();
}


//En caso de que ninguna de las opciones anteriores se haya ejecutado
header("HTTP/1.1 400 Bad Request");

?>
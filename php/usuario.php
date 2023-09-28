<?php
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json');
    header('Access-Control-Allow-Methods: POST, GET, PUT, DELETE');
    header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Access-Control-Allow-Origin');

    $con = new mysqli('localhost', 'root', '', 'unilivro');

    if($_SERVER['REQUEST_METHOD'] === 'GET'){
        // Pegando as informações do banco de dados
        if(isset($_GET['id'])){
            // Este If é usado caso de passagem de ID
            $id = $_GET['id'];
            $sql = $con->query("select * from usuario where id='$id'");
            $data = $sql->fetch_assoc();
        }else{
            // Entra nesse caso não tenha passagem de ID via "get"
            $data = array();
            $sql = $con->query("select * from usuario");
            while($d = $sql->fetch_assoc()){
                $data[] = $d;
            }
        }
        exit(json_encode($data));
    }
?>
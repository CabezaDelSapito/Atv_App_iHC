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
            $sql = $con->query("select * from categoria where id='$id'");
            $data = $sql->fetch_assoc();
        }else{
            // Entra nesse caso não tenha passagem de ID via "get"
            $data = array();
            $sql = $con->query("select * from categoria");
            while($d = $sql->fetch_assoc()){
                $data[] = $d;
            }
        }
        exit(json_encode($data));
    }
    if($_SERVER['REQUEST_METHOD'] === 'PUT'){
        // alterar informações
        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $data = json_decode(file_get_contents("php://input"));
            $sql = $con->query("update categoria set
                nome = '".$data->nome."'
                where id = '$id'");
            if($sql){
                exit(json_encode(array('status' => 'Sucesso')));
            }else{
                exit(json_encode(array('status' => 'Não Funcionou')));
            }
        }

    }
    if($_SERVER['REQUEST_METHOD'] === 'POST'){
        // gravar informações
        $data = json_decode(file_get_contents("php://input"));
        $sql = $con->query("insert into categoria(nome) values ('".$data->nome."')");
        if($sql){
            $data->id = $con->insert_id;
            exit(json_encode($data));
        }else{
            exit(json_decode(array('status' => 'Não Funcionou')));
        }
    }

    if($_SERVER['REQUEST_METHOD'] === 'DELETE'){
        // apagar informações do banco
        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $sql = $con->query("delete from categoria where id='$id'");
            if($sql){
                exit(json_encode(array('status' => 'Sucesso')));
            }else{
                exit(json_encode(array('status' => 'Não Funcionou')));
            }
        }
    }

?>
<?php

include "connection.php";

$email = $_POST['email'];
$pass = sha1($_POST['pass']);

try {
    if(isset($email, $pass)){
        $req = $db->prepare("SELECT * FROM users WHERE email=? AND password=?");
        $req->execute(array($email,$pass));
        $exist = $req->rowCount();
        if($exist ==1){
            $array = $req->fetch();
           $msg = "success connection";
           $succes=1;
        }
        else{
            $msg = "the password is not correct";
            $succes = 0;
        }
    }else{
        $succes=0;
        $msg ="error empty data";
    }
} catch (\Throwable $th) {
    $succes =0;
    echo "Error :" .$th->getMessage();
}
echo json_encode([
    "data"=>[
        $msg,
        $succes,
        $array
    ]
    ]);
?>
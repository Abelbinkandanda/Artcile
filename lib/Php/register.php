<?php

include "connection.php";


$name = $_POST['name'];
$email = $_POST['email'];
$pass = sha1($_POST['pass']);

try {
    if(isset($name, $email, $pass)){
        $req = $db->prepare("SELECT * FROM users WHERE email=?");
        $req->execute(array($email));
        $exist = $req->rowCount();
        if($exist ==0){
            $req = $db->prepare("INSERT INTO users values (null,?,?,?)");
            $req->execute(array($name, $email, $pass));
            if($req){
              $succes=1;
                $msg="success register";
             }else{
             $succes=0;
             $msg ="error register";
             }
        }
        else{
            $msg = "email already exist";
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
        $succes
    ]
    ]);
?>
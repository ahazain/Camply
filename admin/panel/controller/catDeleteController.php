<?php

    include_once "../config/dbconnect.php";
    
    $c_id=$_POST['record'];
    $query="DELETE FROM kategori where id_kategori='$c_id'";

    $data=mysqli_query($conn,$query);

    if($data){
        echo"Category Item Deleted";
    }
    else{
        echo"Not able to delete";
    }
    
?>
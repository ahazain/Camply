<?php
    include_once "../config/dbconnect.php";

    $product_id=$_POST['product_id'];
    $p_name= $_POST['p_name'];
    $p_desc= $_POST['p_desc'];
    $qty= $_POST['qty'];
    $p_price= $_POST['p_price'];
    $category= $_POST['category'];

    if( isset($_FILES['newImage']) ){
        
        $location="./uploads/";
        $img = $_FILES['newImage']['name'];
        $tmp = $_FILES['newImage']['tmp_name'];
        $dir = '../uploads/';
        $ext = strtolower(pathinfo($img, PATHINFO_EXTENSION));
        $valid_extensions = array('jpeg', 'jpg', 'png', 'gif','webp');
        $image =rand(1000,1000000).".".$ext;
        $final_image=$location. $image;
        if (in_array($ext, $valid_extensions)) {
            $path = UPLOAD_PATH . $image;
            move_uploaded_file($tmp, $dir.$image);
        }
    }else{
        $final_image=$_POST['existingImage'];
    }
    $updateItem = mysqli_query($conn,"UPDATE produk SET 
    nama_produk='$p_name', 
    deskripsi_produk='$p_desc',
    stok_produk='$qty', 
    harga_produk='$p_price', 
    id_kategori='$category',
    gambar_produk='$final_image' 
    WHERE id_produk='$product_id'");


    if($updateItem)
    {
        echo "true";
    }
    else
    {
        echo mysqli_error($conn);
    }
?>
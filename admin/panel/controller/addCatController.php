<?php
include_once "../config/dbconnect.php";

if (isset($_POST['upload'])) {
    $catname = $_POST['c_name'];
    $insert = mysqli_query($conn, "INSERT INTO kategori (nama_kategori) VALUES ('$catname')");

    if (!$insert) {
        echo"Category Item Added Succesfully";

    } 
    
    else {
        echo"Not able to add category";
    }
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="0;url=../adminView/viewCategories.php?category=<?php echo ($insert ? 'success' : 'error'); ?>">
    <title>Redirecting...</title>
</head>
<body>
    <!-- This page will only be shown briefly before redirecting -->
</body>
</html>

<?php

@include 'config.php';

$error = [];

if (isset($_POST['submit'])) {

    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $pass = md5($_POST['password']);
    $cpass = md5($_POST['cpassword']);
    $user_type = $_POST['user_type'];

    // Validation: Check if name is not empty
    if (empty($name)) {
        $error[] = 'Name is required.';
    }

    // Validation: Check if email is valid
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error[] = 'Invalid email format.';
    }

    // Validation: Check if password is at least 6 characters long
    if (strlen($_POST['password']) < 8) {
        $error[] = 'Password should be at least 8 characters long.';
    }

    // Validation: Check if password and confirm password match
    if ($pass != $cpass) {
        $error[] = 'Passwords do not match.';
    }

    if (empty($error)) {
        $select = "SELECT * FROM user_data WHERE user_email = '$email' && user_password = '$pass'";
        $result = mysqli_query($conn, $select);

        if (mysqli_num_rows($result) > 0) {
            $error[] = 'User already exists!';
        } else {
            $insert = "INSERT INTO user_data(user_name, user_email, user_password, user_type) VALUES('$name','$email','$pass','$user_type')";
            mysqli_query($conn, $insert);
            header('location:index.php');
        }
    }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>

   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>register form</title>

   <!-- custom css file link  -->
   <link rel="stylesheet" href="app\view\resource\css\style.css">
   <link rel="icon" href="app/view/resource/gambar/Vector (1).ico" type="image/x-icon"/>

</head>


<body>

    <div class="form-container">

        <form action="" method="post">
            <h3>register now</h3>
            <?php
            if (!empty($error)) {
                foreach ($error as $error) {
                    echo '<span class="error-msg">' . $error . '</span>';
                }
            }
            ?>
            <input type="text" name="name" required placeholder="enter your name">
            <input type="email" name="email" required placeholder="enter your email">
            <input type="password" name="password" required placeholder="enter your password">
            <input type="password" name="cpassword" required placeholder="confirm your password">
            <input type="hidden" name="user_type" value="user">
            <input type="submit" name="submit" value="register now" class="form-btn">
            <p>already have an account? <a href="./index.php">login now</a></p>
        </form>

    </div>

</body>

</html>

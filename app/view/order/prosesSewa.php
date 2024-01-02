<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

$koneksi = mysqli_connect("127.0.0.1", "root123", "admin123", "camply") or die(mysqli_connect_error());

if (isset($_POST['jumlah_produk'])) {
    $jumlah_produk = $_POST['jumlah_produk'];
    $ukuran_produk = $_POST['ukuran_produk'];
    $id_produk = $_POST['id_produk'];
  
	mysqli_query($koneksi, "INSERT INTO detail_penjualan SET
    jumlah_produk = '$jumlah_produk',
    ukuran_produk = '$ukuran_produk',
    id_produk = '$id_produk'
    ") or die('Error in query: ' . mysqli_error($koneksi));


}

// Mendapatkan informasi produk dari database

$query_produk = mysqli_query($koneksi, "SELECT * FROM produk WHERE id_produk = '$id_produk'");
$data_produk = mysqli_fetch_array($query_produk);

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Pesanan</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <style>
        body {
            font-family: "Arial", sans-serif;
            background: linear-gradient(45deg, #4CAF50, #45a049); /* Gradient background */
            color: #ffffff;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background-color: #34495e;  
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            overflow: hidden;
            width: 400px;
            padding: 20px;
            text-align: center;
        }

        .pesan {
            background-color: white;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.457);
            border-radius: 10px;
            overflow: hidden;
            width: 400px;
            border-spacing: 0;
            /* Menghilangkan jarak antar sel */
        }

        .pesanimg {
            max-width: 100%;
            height: auto;
            margin-bottom: 20px;
            border-radius: 10px 0 0 10px;
        }

        h2 {
            margin-bottom: 15px;
            color: #ffffff; /* White text color */
        }

        .details-table {
            width: 100%;
            border-collapse: collapse;
            /* Menggabungkan border pada sel-sel tabel */
        }

        .details-table td {
            padding: 8px;
            border-bottom: 1px solid #ffffff; /* White border for table rows */
        }

        button {
            background-color: #4CAF50; /* Green button color */
            color: white;
            padding: 12px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        button:hover {
            background-color: #45a049;
            transform: scale(1.05); /* Zoom effect on hover */
        }
    </style>
</head>

<body>
    <div class="container">
        <table class="pesan">
            <tr>
                <td><img class="pesanimg" src="<?= $data_produk['gambar_produk'] ?>" alt=""></td>
                <td>
                    <h2>Data Pesanan</h2>
                    <table class="details-table">
                        <tr>
                            <td>Jumlah Sewa:</td>
                            <td><?= $jumlah_produk ?></td>
                        </tr>
                        <tr>
                            <td>Lama Wakru Sewa:</td>
                            <td><?= $ukuran_produk ?></td>
                        </tr>
                        <tr>
                            <td>Produk Pesanan:</td>
                            <td><?= $data_produk['nama_produk'] ?></td>
                        </tr>
                        <tr>
                            <td>Harga Produk:</td>
                            <td><?= $data_produk['harga_produk'] ?></td>
                        </tr>
                    </table>
                    <!-- Add this part in the pembelian.php section -->
                    <tr>
                        <td colspan="2"><button type="button" onclick="checkout()">Checkout</button></td>
                    </tr>
                </td>
            </tr>
        </table>
    </div>

    
</body>

</html>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PESANAN PRODUK</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <!-- Include SweetAlert2 library -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <style>
        body {
            font-family: "Arial", sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: linear-gradient(45deg, #4CAF50, #45a049); /* Gradient background */
        }

        .container {
            background-color: #34495e; /* Darker background color */
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            overflow: hidden;
            width: 400px;
            padding: 20px;
            text-align: center;
        }

        #formPesanan {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #4CAF50;
        }

        table {
            width: 100%;
            margin-top: 10px;
            border-collapse: collapse;
            background-color: #2ecc71; /* Soft green background for product details */
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.457);
            border-radius: 10px;
            overflow: hidden;
            width: 400px;
            border-spacing: 0;
        }

        table tr {
            margin-bottom: 10px;
        }

        table td {
            padding: 12px;
        }

        select,
        input {
            width: calc(100% - 16px);
            padding: 12px;
            margin-top: 10px;
            border: 1px solid #4CAF50;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .radio-group {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }

        .radio-group label {
            flex: 1;
            margin: 0 5px;
            padding: 10px;
            border: 1px solid #4CAF50;
            border-radius: 5px;
            cursor: pointer;
        }

        .radio-group input {
            margin-right: 5px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #45a049;
        }

        #hasilPesanan {
            margin-top: 20px;
        }

        .error-message {
            color: red;
            margin-top: 5px;
        }
    </style>
</head>

<body>
    <div class="container">
        <form id="formPesanan">
            <h2>PESANAN PRODUK</h2>
            <table>
                <tr>
                    <td>Jumlah Sewa</td>
                    <td><input type="number" name="jumlah_produk" id="jumlah_produk" required></td>
                </tr>
                <tr>
                    <td>Sewa</td>
                    <td>
                        <div class="radio-group">
                            <label>
                                <input type="radio" name="ukuran_produk" value="3" /> 3 hari
                            </label>
                            <label>
                                <input type="radio" name="ukuran_produk" value="5" /> 5 hari
                            </label>
                            <label>
                                <input type="radio" name="ukuran_produk" value="7" /> 7 hari
                            </label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Pilih Produk</td>
                    <td>
                        <select name="id_produk" id="id_produk" required>
                            <option value="" disabled selected>---</option>
                            <?php
                            $koneksi = mysqli_connect("127.0.0.1", "root123", "admin123", "camply") or die(mysqli_connect_error());
                            $query = mysqli_query($koneksi, "SELECT * FROM produk;") or die(mysqli_error($koneksi));
                            while ($data = mysqli_fetch_array($query)) {
                                echo "<option value='{$data['id_produk']}'>{$data['nama_produk']} - {$data['harga_produk']}</option>";
                            }
                            ?>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><button type="button" onclick="simpanData()">Sewa</button></td>
                </tr>
            </table>
            <div class="error-message" id="errorMessage"></div>
        </form>
    </div>

    <div id="hasilPesanan"></div>

    <script>
        function simpanData() {
            // Bersihkan pesan error sebelum melakukan validasi baru
            $("#errorMessage").text('');

            // Validasi form sebelum mengirimkan data
            var jumlahProduk = $("#jumlah_produk").val();
            var ukuranProduk = $("input[name='ukuran_produk']:checked").val();
            var idProduk = $("#id_produk").val();
            var isError = false;

            // Validasi apakah semua field terisi dan sesuai dengan format yang diinginkan
            if (!jumlahProduk) {
                showError('Jumlah produk harus diisi.', 'jumlah_produk');
                isError = true;
            } else if (isNaN(jumlahProduk)) {
                showError('Jumlah produk harus berupa angka.', 'jumlah_produk');
                isError = true;
            } else if (jumlahProduk <= 0) {
                showError('Jumlah produk harus lebih dari 0.', 'jumlah_produk');
                isError = true;
            }

            if (!ukuranProduk) {
                showError('Ukuran produk harus dipilih.', 'ukuran_produk');
                isError = true;
            }

            if (!idProduk) {
                showError('Pilih produk terlebih dahulu.', 'id_produk');
                isError = true;
            }

            if (isError) {
                // Menampilkan pemberitahuan error yang menarik dengan SweetAlert
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Mohon isi semua kolom dengan benar.',
                });

                // Pemberitahuan error dengan efek shake pada elemen form
                $("#formPesanan").effect("shake", { distance: 5 });
                return;
            }

            var dataForm = $("#formPesanan").serialize();

            $.ajax({
                type: "POST",
                url: "<?= BASEURL ?>/view/order/prosesSewa.php",
                data: dataForm,
                success: function(response) {
                    // Menampilkan pemberitahuan SweetAlert
                    Swal.fire({
                        icon: 'success',
                        title: 'Data Tersimpan',
                        showConfirmButton: false,
                        timer: 2000
                    });

                    // Menampilkan hasil pesanan
                    $("#hasilPesanan").html(response);

                    // Bersihkan nilai input setelah disimpan
                    $("#jumlah_produk, input[name='ukuran_produk']").prop('checked', false);
                    $("#id_produk").val('');
                    $("#errorMessage").text(''); // Hapus pesan error setelah berhasil disimpan
                }
            });
        }

        function showError(message, inputId) {
            // Menampilkan pesan error detail di dalam div error-message
            $("#errorMessage").html('<span class="error-message">' + message + '</span>');

            // Tambahkan efek warna merah pada input yang salah
            $("#" + inputId).css('border', '1px solid red');
        }
    </script>
</body>
</html>


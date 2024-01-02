<?php
$conn = mysqli_connect('localhost', 'root', '', 'camply');
$currentPage = isset($_GET['page']) ? $_GET['page'] : 1;
$productPerPage = 8;
$startIndex = ($currentPage - 1) * $productPerPage;
$result = $conn->query("SELECT * FROM produk LIMIT $startIndex, $productPerPage");
$totalProducts = mysqli_num_rows($conn->query("SELECT * FROM produk"));
?>

<!-- Product Container (Initial View) -->
<div class="product-container" id="productContainer">
    <?php while ($pdk = mysqli_fetch_assoc($result)) : ?>
        <!-- Updated product card code -->
        <a href="<?= BASEURL; ?>/index.php?url=detailProduk/index/<?= $pdk['id_produk']; ?>" class="product-card">
            <img class="product-image" src="<?= $pdk['gambar_produk']; ?>" alt="<?= $pdk['nama_produk'] ?>">
            <div class="product-details">
                <p class="product-price"><?= $pdk['harga_produk'] ?></p>
                <p class="product-name"><?= $pdk['nama_produk'] ?></p>
            </div>
        </a>
    <?php endwhile; ?>
</div>

<!-- Pagination -->
<nav aria-label="...">
    <ul class="pagination">
        <?php
        // Menghitung total jumlah halaman
        $totalPages = ceil($totalProducts / $productPerPage);

        // Menampilkan tombol Halaman Sebelumnya jika tidak berada di halaman pertama
        if ($currentPage > 1) {
            $prevPage = $currentPage - 1;
            echo "<li class='page-item'><a class='page-link' href='?url=produk&page=$prevPage'>Previous</a></li>";
        }

        // Menampilkan nomor-nomor halaman
        for ($i = 1; $i <= $totalPages; $i++) {
            // Menonjolkan halaman saat ini
            $activeClass = ($i == $currentPage) ? 'active' : '';
            echo "<li class='page-item $activeClass'><a class='page-link' href='?url=produk&page=$i'>$i</a></li>";
        }

        // Menampilkan tombol Halaman Berikutnya jika tidak berada di halaman terakhir
        if ($currentPage < $totalPages) {
            $nextPage = $currentPage + 1;
            echo "<li class='page-item'><a class='page-link' href='?url=produk&page=$nextPage'>Next</a></li>";
        }
        ?>
    </ul>
</nav>
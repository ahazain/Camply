<style>
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: 'Poppins', sans-serif;
  background:linear-gradient(#10A453, #fff);
  
}
.aboutisi {
  max-width: 75%;
  margin: auto;
  height: auto;
  margin-top: 5%;
  background: white;
  box-shadow: 5px 5px 10px 3px rgba(0, 0, 0, 0.3);
}

.aboutisi3 {
  display: flex;
  align-items: center;
}

.product-image-container {
  display: flex;
  margin-top: 50px;
}

.product-image {  
  width: 400px;
  height: 400px;
  margin-right: 50px;
}

.product-info {
  width: 400px;
  margin-right: 125px;
  margin-top: 50px;
}

.product-name {
  font-size: 24px;
  font-weight: Bold;
  margin-bottom: 20px;
}
.product-price {
  font-size: 20px;
  font-weight: 500;
  margin: 20px 0;
  color: red;
}

.product-description {
  font-size: 16px;
  line-height: 1.5;
  margin-bottom: 20px;
}

.product-actions {
  display: flex;
}

.buy-button,
.rent-button {
    font-size: 16px;
    padding: 8px 25px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    color: white;
}

.buy-button {
  background-color: #10A453;
  color: white;
  margin-right: 20px;
}

.rent-button {
  background-color: #34495E;
  color: white;
}

.buy-button:hover {
  background-color: #34495E;
}

.rent-button:hover {
  background-color: #10A453;
}
  
</style>
<div class="aboutisi">
  <div class="aboutisi3">
    <div class="product-image-container">
      <img class="product-image" src="<?= $data['produk']['gambar_produk']; ?>" alt="<?= $data['produk']['nama_produk']; ?>">
    </div>
    <div class="product-info">
      <h5 class="product-name"><?= $data['produk']['nama_produk']; ?></h5>
      <h5 class="product-price">Rp <?= $data['produk']['harga_produk']; ?></h5>
      <p class="product-description"><?= $data['produk']['deskripsi_produk']; ?></p>
      <div class="product-actions">
        <a href="<?= BASEURL ?>/index.php?url=Order/pembelian">
          <button class="buy-button openPopup" data-popup="beli" data-order="">
            Beli Sekarang
          </button>
        </a>
       <a href="<?= BASEURL ?>/index.php?url=Order/penyewaan">
        <button class="buy-button openPopup" data-popup="beli" data-order="">
         	Sewa Sekarang
        </button>
        </a>
      </div>
    </div>
  </div>
</div>

<script>
  // JavaScript for interactive image overlay
  const imageContainer = document.querySelector('.product-image-container');
  const overlay = document.querySelector('.overlay');

  imageContainer.addEventListener('mouseenter', () => {
    overlay.style.opacity = '1';
  });

  imageContainer.addEventListener('mouseleave', () => {
    overlay.style.opacity = '0';
  });
</script>


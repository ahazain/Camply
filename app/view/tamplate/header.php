<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Halaman <?= $data['judul']; ?></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"      rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
    />
    <link rel="stylesheet" href="<?= BASEURL ?>/view/resource/css/styleone.css"/>
    <link rel="icon" href="<?= BASEURL ?>/view/resource/gambar/Vector (1).ico" type="image/x-icon"/>
  </head>
  <body>

	<?php 
      error_reporting(E_ALL);
      ini_set('display_errors', 1);
    ?>
    
    <header class="header" id="header">
      <nav class="nav__container">
        <a href="<?= BASEURL ?>">
          <img class="imgcamp" src="<?= BASEURL ?>/view/resource/gambar/Vector (1).png" alt="" />
        </a>
        <div class="nav__menu" id="nav-menu">
          <ul class="nav__list">
            <li class="nav__item">
              <a href="<?= BASEURL ?>" class="nav__link">Home</a>
            </li>
            <li class="nav__item">
              <a href="<?= BASEURL ?>/index.php?url=About" class="nav__link">About</a>
            </li>
            <li class="dropdown" onmouseover="showOptions()" onmouseout="hideOptions()">
              <a href="<?= BASEURL ?>/index.php?url=produk" class="nav__link">Products</a>
                <div id="categoryOptions" class="options">
                  <a href="<?= BASEURL ?>/index.php?url=produk/man">Man</a>
                  <a href="<?= BASEURL ?>/index.php?url=produk/woman">Woman</a>
                  <a href="<?= BASEURL ?>/index.php?url=produk/kids">Kids</a>
                </div>
            </li>
            <li class="nav__item">
              <a href="https://222410102097.pbw.ilkom.unej.ac.id/uas" class="nav__link">Logout</a>
            </li>
          </ul>

          <!-- ==============search============ -->
          <div class="nav__search">
           
          </div>

          <!-- ==================close menu========== -->
          <div class="nav__close" id="nav-close">
            <i class="fa-solid fa-xmark"></i>
          </div>
        </div>

        <!-- ============toogle button=========== -->
        <div class="nav__toggle" id="nav-toggle">
          <i class="fa-solid fa-bars"></i>
        </div>
      </nav>
    </header>
  </body>



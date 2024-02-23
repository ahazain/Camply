-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2023 at 11:34 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `camply`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan`
--

CREATE TABLE `detail_penjualan` (
  `id_pemesanan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `harga_produk` decimal(10,0) NOT NULL,
  `jumlah_produk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'man'),
(2, 'woman'),
(3, 'kids'),
(4, 'general');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `total_pembayaran` decimal(7,0) NOT NULL,
  `bukti_pembayaran` blob NOT NULL,
  `konfirmasi` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id_pembelian` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `alamat_pengiriman` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `stok_produk` int(3) NOT NULL,
  `harga_produk` decimal(7,0) NOT NULL,
  `deskripsi_produk` varchar(2000) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `gambar_produk` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `stok_produk`, `harga_produk`, `deskripsi_produk`, `kategori`, `gambar_produk`) VALUES
(4, 'Tenda Camping Arpenaz 4.1 Tenda Kemah Untuk 4 Orang', 999, 2500000, 'Tim camping kami telah merancang tenda Arpenaz 4.1 dengan tiang ini, untuk menampung hingga empat orang yang menginginkan ruang tidur dan ruang tamu yang luas.\r\n\r\nTenda sederhana dengan ruang tamu berdiri. Pilihan terbaik untuk perjalanan berkemah dengan pasangan, keluarga atau teman-teman.\r\n\r\nKain utama: 100.0% Polyethylene Terephtalate (PET); Tiang: 100.0% Kaca - Serat (FG); Ruang dalam: 100.0% Polyethylene Terephtalate (PET); Keset lantai : 100.0% Polyethylene High Density (HDPE); Tas jinjing: 100.0% Polyethylene Terephtalate (PET)', 'man; woman; kids', 'https://contents.mediadecathlon.com/p2182995/k$4159eced08c84da7918c0053c52442c3/arpenaz-41-tent-with-tent-poles-4-people-1-bedroom.jpg?format=auto&quality=70&f=1366x1366'),
(5, 'Kursi Lipat Kemah Quechua - Basic Armchair', 999, 280000, 'Kursi lipat ini memberikan kenyamanan duduk saat berkemah.Tak lupa dilengkapi dengan tempat gelas.\r\n\r\nKursi lipat kami dapat dilipat dengan mudah dan cepat, menempati sedikit ruang saat dilipat.Tali bawaan memungkinkan Anda membawa kursi Anda ke mana pun Anda mau.\r\n\r\nStruktur: 7.0% Polyamide (PA), 93.0% BAJA; Kain utama: 100.0% Polyethylene Terephtalate (PET); Jaring: 100.0% Polipropilena (PP)', 'man; woman; kids', 'https://contents.mediadecathlon.com/p1749361/k$96ca9266b4a34d7c1099b146f89eb230/folding-armchair-for-camping-grey.jpg?format=auto&quality=70&f=1366x1366'),
(6, 'Ransel Hiking Anak-anak MH100 10 Liter', 999, 170000, 'Desainer pendaki kami mengembangkan ransel 10 liter ini sehingga anak Anda dapat bersenang-senang di segala kegiatan saat cuaca cerah\r\n\r\nSempurna untuk berpetualang, tas ini ringan dengan punggung yang sesuai untuk pendaki muda Ransel ini nyaman dan praktis berkat bukaan tengah yang lebar serta saku ritsleting di bagian depan.\r\n\r\nKain utama: 100.0% Polyethylene Terephtalate (PET); Lis: 100.0% Polyethylene Terephtalate (PET); Kain belakang : 100.0% Polyethylene Terephtalate (PET); Jaket: 100.0% Poliuretan (PU); Saku: 15.0% Elastane, 85.0% Polyamide (PA); Jaring: 100.0% Polyethylene Terephtalate (PET)', 'kids', 'https://contents.mediadecathlon.com/p1760811/k$1fb1fd25afa6c60dbb79e08a1e3ea4f6/ransel-hiking-anak-anak-mh100-10-liter.jpg?format=auto&quality=70&f=1366x1366'),
(7, 'Karpet selimut hiking ringkas dibawa piknik dan bertamasya - 146 x 120 cm', 999, 120000, 'Tim kami merancang selimut ringkas ini untuk melindungi 4 orang dari dingin dan kotoran dari tanah.\r\n\r\nSangat cocok untuk piknik atau istirahat saat hiking, berukuran 146 x 120 cm setelah dibuka. Ringan saat dilipat ke dalam kantong dan tidak memakan banyak ruang di dalam tas.\r\n\r\nKain utama: 100.0% Polyethylene Terephtalate (PET); Jaket: 100.0% Poliuretan (PU)', 'man; woman; kids', 'https://contents.mediadecathlon.com/p2431726/k$810c71f525142bf439386012aaa7817f/karpet-selimut-hiking-ringkas-dibawa-piknik-dan-bertamasya-146-x-120-cm.jpg?format=auto&quality=70&f=1366x1366'),
(8, 'Hammock Satu Orang Basic 300 x 150 cm - 1 Orang', 999, 230000, 'Desainer camping kami merancang hammock Basic praktis dan serbaguna ini untuk berkemah di bumi perkemahan atau di alam.\r\n\r\nMotivasi kami? Menyediakan hammock multiguna untuk tidur nyaman di mana saja! Sangat ringan dan sangat mudah untuk dipasang.\r\n\r\nKain utama: 100.0% Polyethylene Terephtalate (PET); Tas jinjing: 100.0% Polyethylene Terephtalate (PET)', 'man; woman; kids', 'https://contents.mediadecathlon.com/p1848117/k$2526dbf59768efdbf4875dc07f0a30cb/hammock-satu-orang-basic-300-x-152-cm-1-orang.jpg?format=auto&quality=70&f=1366x1366'),
(9, 'KOMPAS PENINJAU DERAJAT DAN JARAK EXPLORER 900', 999, 400000, 'Kami mendesain kompas yang lengkap dan kuat untuk orienteering yang akurat di alam selama pendakian, trek dan ekspedisi.\r\n\r\nNikmati petualangan Anda! Kompas pengamatan dengan bearing akurat dan kapsul menjamin derajat dan jarak yang tepat. Tahan lama berkat tutup pelindung.\r\n\r\nPapan: 100.0% Polymethyl Methacrylate (PMMA); Lapisan Pelindung: 100.0% Akrilonitril butadiena stiren (ABS); Tali: 100.0% Polyethylene Terephtalate (PET)', 'man; women; kids', 'https://contents.mediadecathlon.com/p2439715/k$8b4310b5c049cbaa08d086dda6b918ba/explorer-900-sighting-compass-in-degrees-and-mils.jpg?format=auto&quality=70&f=1366x1366'),
(10, 'Tongkat Untuk Mendaki F500 Antishock grey', 999, 380000, 'Tongkat yang akan memudahkan anda dalam perjalanan pendaikian yang terjal.\r\n\r\nTongkat ini terbuat dari bahan berikut:\r\nPegangan dari foam ekstra padat yang lebih tahan lama\r\n197 g in size 5.5.\r\nUjung tahan lama (karbit tungsten).\r\nSistem pengaturan internal dengan sekrup\r\nPanjang: 63 cm -130 cm\r\n3 bagian.\r\nPanjang saat terlipat: 63 cm,\r\npanjang maksimal saat dipakai: 130 cm.', 'man; women; kids', 'https://contents.mediadecathlon.com/p2572976/k$b1988d4acaedd1e6077fd776e3a7647d/1-x-forclaz-500-antishock-hiking-pole-grey-blue.jpg?format=auto&quality=70&f=1366x1366'),
(11, 'Ransel hiking 23L - NH Escape 500 Rolltop', 999, 650000, 'Desainer pendaki kami telah merancang ransel 23L rolltop NH Escape 500 ini dengan penutup untuk mendaki atau dipakai setiap hari.\r\n\r\nMotivasi kami? Menawarkan ransel yang nyaman dan pintar, lebih ramah lingkungan, berkat kompartemen utamanya yang dapat diperluas dengan penutup, 13 kantong, dan fungsi pintar\r\n\r\nBagian belakang busa tebal 5 bantalan dan tali bahu | Tali pengencang dan bahu yang dapat disesuaikan\r\nVolume dapat disesuaikan 23 L - 27 L | Dimensi: 46 x 28 x 22 cm | Format tas tangan\r\n1 kompartemen | 13 saku: 5 ritsleting, 2 tempat botol 0,8 L, 1 kantong laptop 15”', 'man; women; kids', 'https://contents.mediadecathlon.com/p2183126/k$81212797981dcb0c583c22eca3265f98/hiking-backpack-23l-nh-escape-500-rolltop.jpg?format=auto&quality=70&f=1366x1366'),
(12, 'Goliath Auto Carabiner - Black', 999, 280000, 'Karabiner dengan pengunci otomatis untuk keamanan ekstra saat mendaki.\r\n\r\nKarabiner dengan pengunci otomatis untuk keamanan ekstra saat mendaki. Manuver tali yang lebih mudah berkat HMS ergonomis berbentuk pir dan bukaan yang lebih lebar.\r\n\r\nStruktur: 1.0% BAJA, 99.0% [EN] Aluminium', 'man; women; kids', 'https://contents.mediadecathlon.com/p881341/k$50a38979a80e37446a9841531d4ba9f4/goliath-hms-auto-snap-hook-for-climbing-and-mountaineering-black.jpg?format=auto&quality=70&f=1366x1366'),
(13, 'HELM PANJAT TEBING DAN MENDAKI GUNUNG - EDGE PUTIH/MERAH', 999, 600000, 'EDGE adalah helm yang sangat ringan yang didesain untuk memanjat tebing dan mendaki gunung.\r\n\r\nPas di kepala, cocok untuk panjat tebing. Berventilasi baik, dapat dipakai panjat tebing dengan nyaman saat musim panas.\r\n\r\nBusa keras: 100.0% Polystyrene (PS); Peluru: 100.0% Polikarbonat (PC); Logam pengkait: 100.0% Polyamide 11 (PA11)', 'man; women; kids', 'https://contents.mediadecathlon.com/p2424713/k$0ff30e3a1e3d4b0896eff987e5b738ca/helm-panjat-tebing-dan-mendaki-gunung-edge-putihslashmerah.jpg?format=auto&quality=70&f=1366x1366'),
(14, 'Arpenaz 50 Mid Men\'s Hiking Boots - Hitam', 999, 290000, 'Sepatu hiking ini didesain untuk berjalan di belantara! Sol karetnya meningkatkan masa pakai sepatu.\r\n\r\n322 g per sepatu dengan ukuran 9!\r\nSol Crosscontact untuk cengkeraman optimal pada medan alami.\r\nSisipan EVA pada tumit untuk peredaman benturan di jalur dataran rendah.', 'man', 'https://contents.mediadecathlon.com/p1211067/k$f5e6247d6c830bbc1259cf1078081c92/men-s-nh100-country-walking-shoes-black.jpg?format=auto&quality=70&f=1366x1366'),
(15, 'Jaket Perlindungan UV Hiking Pria - HELIUM 100', 999, 450000, 'Desain untuk para hiker alam bebas dan hiking di cuaca cerah. Melindungi Anda dari UVA/UVB sinar matahari. Selain itu, produk ringan dan nyaman.\r\n\r\nUPF 40+, Ringan (110 g dalam ukuran L) compact, benar-benar juaranya jaket hiking. Menahan angin dan panas untuk perjalanan luar ruangan Anda.\r\n\r\nKain utama: 100.0% Polyethylene Terephtalate (PET)', 'man', 'https://contents.mediadecathlon.com/p2241843/k$7ce53e4625eafdc107c7202325c5e926/mens-hiking-uv-protection-jacket-helium100.jpg?format=auto&quality=70&f=1366x1366'),
(16, 'Rain-cut Celana Panjang Mendaki Tahan Hujan Pria - Hitam', 999, 200000, 'Overtrouser hiking yang sederhana, ringkas, dan tahan air ini bisa diselipkan ke dalam tas bersamaan dengan jaket anti-air untuk melindungi Anda dari hujan!\r\n\r\nLapisan coating anti-air (2,000 mm). Kelim tertutup sempurna.\r\nLapisan hidrofilik (RET=12): membatasi pengembunan di bagian dalam pakaian.', 'man', 'https://contents.mediadecathlon.com/p1060502/k$ee04f3e3e0b0827ab69065ca95bac71c/nh500-protect-mens-country-walking-waterproof-over-trousers-black.jpg?format=auto&quality=70&f=1366x1366'),
(17, 'Scarf Bulat Pelindung Leher Bahan Wol Merino - Biru', 999, 200000, 'Tim desain kami merancang scarf dari bahan wol Merino untuk melindungi Anda dari angin dan suhu dingin di alam terbuka.\r\n\r\nWol Merino jika Anda membutuhkan penghangat badan yang ringkas dan serbaguna.\r\n\r\nKain utama: 11.0% Polyamide (PA), 89.0% Wol', 'man', 'https://contents.mediadecathlon.com/p1770503/k$287393a48af99e603e8ddef2a70afef5/trek-500-mountain-trekking-multi-position-merino-wool-headband-blue.jpg?format=auto&quality=70&f=1366x1366'),
(18, 'Topi Wol Merino Trekking gunung Trek 500 - Hitam\r\n Terjual 66 buah.', 999, 200000, 'Tim Trekker kami membayangkan topi wol merino ini untuk melindungi Anda dari hawa dingin selama trekking bivak.\r\n\r\nWol Merino, saat Anda menginginkan kehangatan dan desain yang ringkas!', 'man', 'https://contents.mediadecathlon.com/p1793828/k$4fcb019a6aa8ac686dbd0516411816e9/trek-500-mountain-trekking-merino-wool-hat-blue.jpg?format=auto&quality=70&f=1366x1366'),
(19, 'Men\'s Recycled Synthetic Short-Sleeved Hiking T-Shirt MH100', 999, 130000, 'Di kaki gunung Mont Blanc, tim penggemar kami merancang kaos ramah lingkungan dan menyerap keringat ini untuk pendakian gunung berkala\r\n\r\nDesain ramah lingkungan, dibuat dari poliester daur ulang.Kaos sempurna untuk pendakian gunung pertama!\r\n\r\nKain utama: 100.0% Polyethylene Terephtalate (PET); Kerah: 23.0% Elastane, 77.0% Polyamide (PA)', 'man', 'https://contents.mediadecathlon.com/p1950008/k$b265751814fb6afc3a65af3c5fcc2040/mh100-men-s-mountain-walking-short-sleeved-shirt-dark-grey.jpg?format=auto&quality=70&f=1366x1366'),
(20, 'Kaus Kaki Hiking 100 Mid 2 Pak - hitam', 999, 80000, 'Desainer kami telah mendesain kaus kaki ini secara ramah lingkungan untuk pejalan kaki yang mencari kaus kaki yang nyaman dan berpori.\r\n\r\nKatun dan linen organik memberikan kenyamanan alami sedangkan penambahan serat sintetis membuat kaki Anda tetap kering. Kemasan 2 pasang\r\n\r\nKaus kaki: 41.0% Katun, 3.0% Elastane, 49.0% Polyamide (PA), 7.0% Linen', 'man', 'https://contents.mediadecathlon.com/p2147685/k$45527b34984e21918dce3c71820b62d6/sock-hike-100-mid-pack-of-2-pairs-coral-and-grey.jpg?format=auto&quality=70&f=1366x1366'),
(21, 'TREK 700 topi trekking gunung abu gelap', 999, 135, 'Tim pendaki gunung kami yang bersemangat merancang topi ini untuk trekking gunung.\r\n\r\nLubang ventilasi topi dapat mengurangi dampak panas dengan memungkinkan udara bersirkulasi saat mendaki di bawah teriknya cahaya matahari.\r\n\r\nKain utama: 100.0% Polyamide (PA); Kerah: 100.0% Polyethylene Terephtalate (PET)', 'man', 'https://contents.mediadecathlon.com/p1332364/k$5ed6de00100c91affa2c16959fccb101/trek-700-mountain-trekking-cap-dark-grey.jpg?format=auto&quality=70&f=1366x1366'),
(22, 'Sarung Tangan Mitten Pendaki Gunung Trek 500 - Hitam', 999, 220000, 'Sarung tangan yang hangat dan tahan angin ini untuk kenyamanan trekking di cuaca dingin dan berangin, dengan tetap mempertahankan ketangkasan yang relatif baik.\r\n\r\nBerkat umpan balik Anda pada model lama, sarung tangan ini lebih mudah dilepas (bahkan saat basah) dan memiliki lapisan fleece brush yang meningkatkan rasa hangat.\r\n\r\nKain utama: 100.0% Polyethylene Terephtalate (PET); Telapak tangan: 60.0% Polyamide (PA), 40.0% Poliuretan (PU); Pergelangan: 15.0% Elastane, 85.0% Polyethylene Terephtalate (PET); Lis utama: 15.0% Elastane, 85.0% Polyethylene Terephtalate (PET); Lis kedua: 100.0% Polyethylene Terephtalate (PET)', 'man', 'https://contents.mediadecathlon.com/p1223460/k$c73ffff18a859faf8202f7ba7426a920/mountain-trekking-mitten-gloves-trek-500-black.jpg?format=auto&quality=70&f=1366x1366'),
(23, 'Topi Anti Air Trekking Gunung Trek 900 - Abu-abu Terang', 999, 370000, 'Tim trekking dan hiking kami telah mendesain topi ini untuk melindungi Anda dari hujan saat perjalanan\r\n\r\nHujan tidak akan menghalangi Anda berkat topi trekking tahan air ini!\r\n\r\nKain utama: 100.0% Polyethylene Terephtalate (PET); Membran: 100.0% Poliuretan (PU); Kain dalam: 100.0% Polyethylene Terephtalate (PET)', 'man', 'https://contents.mediadecathlon.com/p1574207/k$2695fe8c8c8cc611481c7bcb8580630b/trek-900-mountain-trekking-waterproof-hat-light-grey.jpg?format=auto&quality=70&f=1366x1366'),
(24, 'Jaket perlindungan UV Hiking Wanita - HELIUM 100', 999, 450000, 'Desain untuk pejalan kaki di alam dan hiking di cuaca cerah. Melindungi Anda dari UVA/UVB sinar matahari. Selain itu, produk juga ringan dan nyaman\r\n\r\nWindbreaker hiking dengan UPF 40+ yang ringan dan ringkas (110 g dalam ukuran L). Menahan angin dan panas untuk perjalanan luar ruangan Anda.', 'women', 'https://contents.mediadecathlon.com/p2242716/k$68a7ad9c6fe71caf2022c956d2efd1c9/womens-hiking-uv-protection-jacket-helium-100.jpg?format=auto&quality=70&f=1366x1366'),
(25, 'Celana Panjang Trekking Anti Nyamuk Wanita Tropic 900 - hijau', 999, 800000, 'Tim penggemar Tropical Trekking kami telah mengembangkan celana panjang anti nyamuk yang akan melindungi Anda selama bertualang!\r\n\r\nCelana ringan dan tahan lama, dengan ritsleting ventilasi dan pelindung kaki terintegrasi untuk melindungi Anda dari serangga selama ekspedisi di hutan.\r\n\r\nKain utama: 14.0% Elastane, 86.0% Polyamide (PA); Lis utama: 100.0% Polyethylene Terephtalate (PET); Kain pinggang: 100.0% Polyethylene Terephtalate (PET); Lapisan hem: 20.0% Elastane, 80.0% Polyamide (PA)', 'women', 'https://contents.mediadecathlon.com/p1938434/k$021dc6983aaca344585c906af25f445c/women-s-anti-mosquito-trousers-tropic-500-green.jpg?format=auto&quality=70&f=1366x1366'),
(26, 'Sepatu mendaki gunung anti air wanita MH100 Mid -Khaki', 999, 1300000, 'Kami mendesain boot anti air Medium di kaki gunung Mont Blanc, untuk pendakian gunung sesekali.\r\n\r\nMemberikan kenyamanan optimal pada kaki Anda berkat bantalan di seluruh sol, dan menopang di bagian tungkai yang tinggi, dan membran tahan air untuk menjaga kaki tetap kering.', 'women', 'https://contents.mediadecathlon.com/p1790691/k$b22c9782c4eae8a8b688cd074d6411de/women-s-mid-waterproof-mountain-walking-shoes-mh100-brown.jpg?format=auto&quality=70&f=1366x1366'),
(27, 'Rompi jalan wanita – NH500 Baru', 999, 150000, 'Desainer pendaki kami mengembangkan tank top NH500 yang ramah lingkungan ini untuk pendakian biasa di dataran rendah, hutan, atau pantai.\r\n\r\nPerpaduan katun, poliester daur ulang, dan lyocell menciptakan kelembutan dan mengurangi bau. Scoop belakang dan sisipan jacquard berventilasi membuat Anda merasa lebih nyaman di cuaca panas!\r\n\r\nSerat katun dan lyocell pada kaus tersebut mampu mengurangi bau badan\r\nBerat 101 g ukuran M', 'women', 'https://contents.mediadecathlon.com/p1734534/k$19afd5cb5a72fa72976ce05de4f63274/womens-country-walking-vest-nh500-fresh.jpg?format=auto&quality=70&f=1366x1366'),
(28, 'Jaket Down Wanita dengan Tudung untuk Trekking Gunung - MT500 -10°C', 999, 1550000, 'Tim kami merancang jaket down bersertifikat RDS yang dilengkapi dengan tudung, cocok untuk Anda yang menyukai trekking di pegunungan dalam cuaca dingin hingga -10°C.\r\n\r\nBahan jaket down yang hangat dan dapat dipadatkan berkat daya tampung down dan bulunya bisa mencapai 800 CUIN, sehingga hemat tempat dan tidak terlalu berat di tas trekking. Tetap hangat saat berkemah.\r\n\r\nRDS down dengan daya tampungnya sebesar 800 CUIN. Nyaman di suhu 0°C hingga -10°C.\r\nBerat jaket padded ini sekitar 400 g dengan ukuran M', 'women', 'https://contents.mediadecathlon.com/p2311088/k$405559b3bdf76845421cbf9e1612f1b1/jaket-down-wanita-dengan-tudung-untuk-trekking-gunung-mt500-10ac.jpg?format=auto&quality=70&f=1366x1366'),
(29, 'KAUS KAKI LARI INVISIBLE FINE RUN500 X2 - PINK', 999, 75000, 'Tim desain kami telah mengembangkan kaus kaki lari ini untuk melindungi kaki dari lecet saat Anda berlari di luar.\r\n\r\nIngin lebih nyaman? Berkat benang serat mikronya, kaus kaki lari invisible ini memberikan kenyamanan yang luar biasa selama sesi lari jarak pendek Anda.\r\n\r\nKaus kaki: 4.0% Elastane, 96.0% Polyamide (PA)', 'women', 'https://contents.mediadecathlon.com/p2436229/k$75b0ea5bfe64b9a762468b9886992f48/invisible-comfort-socks-black-x2.jpg?format=auto&quality=70&f=1366x1366'),
(30, 'Topi Wanita FORCLAZ Trekking Travel 100 - Biru Tua', 999, 59000, 'Topi Pria dan Wanita FORCLAZ telah dirancang oleh tim kami, penggemar trekking dan hiking, topi ini mampu menjalankan banyak fungsi penting dengan harga murah!\r\n\r\nJika Anda mencari topi sederhana dan murah untuk melindungi dari sinar matahari, maka topi ini dibuat untuk Anda! Tahan lama, ringan, mudah dilipat, dan anti lembab karena berbahan ristop.\r\n\r\nKain utama: 100.0% Polyethylene Terephtalate (PET); Kain dalam: 100.0% Polyethylene Terephtalate (PET)', 'women', 'https://contents.mediadecathlon.com/p1793800/k$b04c0d746384fc2cb42f4830683f2379/travel-100-trekking-cap-light-grey.jpg?format=auto&quality=70&f=1366x1366'),
(31, 'Topi Anti-UV Wanita - Khaki', 999, 230000, 'Tim desain kami merancang topi yang memberi kepala perlindungan optimal dari paparan sinar UV, dan bebas gerah meski dipakai lama.\r\n\r\nTopi ini dirancang untuk menawarkan perlindungan terbaik terhadap sinar matahari dengan pinggiran lebar dan kain anti-UV.\r\n\r\nKain utama: 14.0% Elastane, 86.0% Polyamide (PA); Kain dalam: 100.0% Polyethylene Terephtalate (PET)', 'women', 'https://contents.mediadecathlon.com/p1804562/k$b5533d4d35e6847b36e95d69e73efb82/trek-500-men-s-mountain-trekking-uv-protective-hat-beige.jpg?format=auto&quality=70&f=1366x1366'),
(32, 'Sarung Tangan TREK Wanita 300 Rajut - Hitam', 999, 110000, '', 'women', 'https://contents.mediadecathlon.com/p2391076/k$bcea1f04af8a72a85ecae88f6a69efec/cn-glove-trek-300-knitting-black.jpg?format=auto&quality=70&f=1366x1366'),
(33, 'Simple Warm Women\'s Ski Base Layer - Hitam', 999, 170000, 'Simply Warm\r\nBahan diperhalus menambah kehangatan, kerah tegak dan bagian belakang panjang. Dirajut dengan benang sangat lembut untuk kenyamanan dan kelembutan ekstra.', 'women', 'https://contents.mediadecathlon.com/p64086/k$9fb0b4051d6b84e9bfb7f8ce263e91bb/women-s-skiing-base-layer-top-100-black.jpg?format=auto&quality=70&f=1366x1366'),
(34, 'ATASAN ANTI UV SLIM 100 WANITA - CN', 999, 220000, 'Sebagai peselancar wanita dari semua level, kami telah merancang kaos anti UV ini untuk peselancar pemula yang berselancar di atas buih air laut.\r\n\r\nKaos lengan panjang anti UV wanita sebagai pelindung dari matahari saat di air, dan mengurangi iritasi saat melakukan kontak dengan papan selancar. Slim fit.\r\n\r\nKain utama: 18.0% Elastane, 82.0% Polyethylene Terephtalate (PET)', 'women', 'https://contents.mediadecathlon.com/p2109215/k$b75c4992743bb0c4d255dccab6fe498f/womens-slim-uv-top-100-cn.jpg?format=auto&quality=70&f=1366x1366'),
(35, 'Sandal Gunung Wanita Arpenaz 50 - Pink', 999, 260000, 'Sandal hiking ini telah dirancang menjadi alas kaki yang sempurna untuk berjalan di luar ruangan di cuaca panas dan kering. Desainnya kokoh dan dapat diandalkan.\r\n\r\nRingan dan nyaman untuk pendakian jarak pendek di musim panas.\r\n\r\nSol karet adhesif. Komponen lebih tahan lama dari TPR atau TR\r\nSol tengah EVA (bantalan). Sol dalam mikro fiber (lembut).\r\n1 tali velkro agar perawatan lebih mudah dan efektif.', 'women', 'https://contents.mediadecathlon.com/p1555674/k$637877ca0b0ff380e6113ddb73d40a0b/nh100-womens-country-walking-sandals-grey-pink.jpg?format=auto&quality=70&f=1366x1366'),
(36, 'Celana Pendek Hiking Wanita - NH500 Regular', 999, 300000, 'Kami telah mendesain celana pendek country walking ini dengan konsep ramah lingkungan. Mendaki dengan percaya diri karena pakaian Anda ramah lingkungan.\r\n\r\nCelana pendek hiking ini nyaman, modis, dan praktis dengan potongan hingga paha bagian tengah. Celana pendek ini memiliki kain elastis dan sabuk yang lebar. Saku tambahan telah ditambahkan untuk menyimpan ponsel Anda.\r\n\r\nKain utama: 100.0% Polyethylene Terephtalate (PET); Lis: 17.0% Elastane, 83.0% Polyethylene Terephtalate (PET); Kain pinggang: 11.0% Elastane, 89.0% Polyethylene Terephtalate (PET)', 'women', 'https://contents.mediadecathlon.com/p2132908/k$bd3430d4b989ce6397110d487cfffa96/womens-country-walking-shorts-nh500-regular.jpg?format=auto&quality=70&f=1366x1366'),
(37, 'Celana Pendek Hiking Wanita - NH500 Regular', 999, 300000, 'Kami telah mendesain celana pendek country walking ini dengan konsep ramah lingkungan. Mendaki dengan percaya diri karena pakaian Anda ramah lingkungan.\r\n\r\nCelana pendek hiking ini nyaman, modis, dan praktis dengan potongan hingga paha bagian tengah. Celana pendek ini memiliki kain elastis dan sabuk yang lebar. Saku tambahan telah ditambahkan untuk menyimpan ponsel Anda.\r\n\r\nKain utama: 100.0% Polyethylene Terephtalate (PET); Lis: 17.0% Elastane, 83.0% Polyethylene Terephtalate (PET); Kain pinggang: 11.0% Elastane, 89.0% Polyethylene Terephtalate (PET)', 'women', 'https://contents.mediadecathlon.com/p2132908/k$bd3430d4b989ce6397110d487cfffa96/womens-country-walking-shorts-nh500-regular.jpg?format=auto&quality=70&f=1366x1366'),
(38, 'Tank top jalan wanita - NH500 Baru', 999, 150000, 'Desainer pendaki kami mengembangkan tank top NH500 yang ramah lingkungan ini untuk pendakian biasa di dataran rendah, hutan, atau pantai.\r\n\r\nPerpaduan katun, poliester daur ulang, dan lyocell menciptakan kelembutan dan mengurangi bau. Scoop belakang dan sisipan jacquard berventilasi membuat Anda merasa lebih nyaman di cuaca panas!', 'women', 'https://contents.mediadecathlon.com/p1734532/k$2f265979fd681911555a787b24d42fa9/womens-country-walking-vest-nh500-fresh.jpg?format=auto&quality=70&f=1366x1366'),
(39, 'Rok Celana Walking Country Wanita - NH100 Baru', 999, 300000, 'Tim penggemar hiking kami merancang rok celana ini dengan desain ramah lingkungan untuk perjalanan Anda di dataran rendah, di hutan atau di pantai.\r\n\r\nPotongan yang menggabungkan kemudahan bergerak dari celana pendek dengan bentuk rok! Manfaatkan kenyamanan superior model ini dengan celana pendek yang terbuat dari kain elastis yang terintergrasi dan dilengkapi dua saku.', 'women', 'https://contents.mediadecathlon.com/p1734679/k$2b6e608c3d61de2ef2f4652d23c13fc6/womens-country-walking-skort-nh100-fresh.jpg?format=auto&quality=70&f=1366x1366'),
(40, 'Celana Panjang Country Walking - NH100 - Wanita', 999, 300000, 'Desainer hiking kami telah mengembangkan celana NH100 ini dengan cara yang ramah lingkungan untuk sesekali berjalan di dataran rendah, hutan atau di pantai.\r\n\r\nLihat celana panjang baru kami yang sangat nyaman! Dengan kain yang meregang dan sabuk lebar, Anda akan merasa nyaman. Celana ini memiliki sub-saku cerdas untuk ponsel Anda.', 'women', 'https://contents.mediadecathlon.com/p1734845/k$5876e25d735d753535b1a8415d547d96/country-walking-trousers-nh100-womenswear.jpg?format=auto&quality=70&f=1366x1366'),
(41, 'Topi Trekking Travel 100 - Abu-abu muda Wanita', 999, 70000, 'Topi Wanita FORCLAZ telah dirancang oleh tim kami, penggemar trekking dan hiking, topi ini mampu menjalankan banyak fungsi penting dengan harga murah!\r\n\r\nJika Anda mencari topi sederhana dan murah untuk melindungi dari sinar matahari, maka topi ini dibuat untuk Anda! Tahan lama, ringan, mudah dilipat, dan anti lembab karena berbahan ristop.\r\n\r\nKain utama: 100.0% Polyethylene Terephtalate (PET); Kain dalam: 100.0% Polyethylene Terephtalate (PET)', 'women', 'https://contents.mediadecathlon.com/p1793784/k$682cc874dc384a1ef557ba34f13d35f5/travel-100-trekking-cap-light-grey.jpg?format=auto&quality=70&f=1366x1366'),
(42, 'Kaus Hiking Anak MH550', 999, 120000, 'Desainer hiking kami mengembangkan kaus ini untuk hiking sehari dalam semua kondisi cuaca dan jalur yang sulit secara teknis.\r\n\r\nBeri ventilasi terbaik dan perlindungan dari sinar matahari untuk anak Anda dengan kaus ini.', 'kids', 'https://contents.mediadecathlon.com/p1567241/k$6f58e54d73ea794b410ff0d9d4bbec47/mh550-children-s-hiking-t-shirt.jpg?format=auto&quality=70&f=1366x1366'),
(43, 'https://contents.mediadecathlon.com/p1567241/k$6f58e54d73ea794b410ff0d9d4bbec47/mh550-children-s-hik', 999, 390000, 'Desainer kami, yang merupakan orang tua dari pendaki muda, mengembangkan sandal anak MH120 ini untuk bermain, berlari, dan melompat di hari yang terik.\r\n\r\nSandal serbaguna yang sangat efektif di jalan setapak maupun saat menyeberangi sungai berkat kekuatan daya cengkeramnya. Daya tahan dan kenyamanannya membuat Anda ingin memakainya selama musim panas.\r\n\r\nSol Bagian Luar dari: 40.0% Etilena Vinil Asetat (EVA), 60.0% Rubber - Butadiene Rubber (BR); Atasan dari: 10.0% Poliuretan (PU), 90.0% Polyethylene Terephtalate (PET); Lining dan kaos kaki: 50.0% Etilena Vinil Asetat (EVA), 50.0% Polyethylene Terephtalate (PET)', 'kids', 'https://contents.mediadecathlon.com/p1922182/k$4ec5845700da8de2ae2afae065e0096a/childrens-mh120-jr-hiking-sandals-pix-blue.jpg?format=auto&quality=70&f=1366x1366'),
(44, 'Celana Pendaki Modular Anak Laki-laki Usia 7-15 Hitam', 999, 390000, 'Pendaki biasa yang membutuhkan celana teknis dan modular sesuai dengan cuaca dan tingkat usaha.\r\n\r\nCelana berpori, ringan; dapat diubah menjadi celana pendek untuk beradaptasi dengan cuaca.Putri Anda akan menyukai konversi menjadi celana pendek dengan membuka ritsleting kakinya sendiri!', 'kids', 'https://contents.mediadecathlon.com/p2578777/k$1dbffd455695f00b49ec1ec1d62304df/mh550-childrens-zip-off-hiking-trousers-grey.jpg?format=auto&quality=70&f=1366x1366'),
(45, 'Jaket Fleece Hiking Anak MH100 Usia 7-15 tahun - Turquoise', 999, 200000, 'Tim kami terdiri dari orang tua pendaki muda mendesain dengan ramah lingkungan fleece hangat dan breathable ini untuk melindungi anak Anda selama kegiatan alam.\r\n\r\nFleece hangat, nyaman, dan sempurna untuk dibawa anak ke mana saja.', 'kids', 'https://contents.mediadecathlon.com/p1672056/k$0446085b3e640b88d9d9d1ab0d7fa557/kids-7-15-years-hiking-fleece-mh100-turquoise.jpg?format=auto&quality=70&f=1366x1366'),
(46, 'TOPI MENDAKI BENTUK FISHERMAN ANAK - MT100 - CORAL', 999, 115000, 'Tim kami telah merancang topi matahari uniseks yang tak lekang oleh waktu ini untuk dikenakan saat jalan-jalan.\r\n\r\nTopi matahari yang ringkas dan tahan lama ini melindungi mata dan kepala Anda saat bepergian.\r\n\r\nKain utama: 14.0% Elastane, 86.0% Polyamide (PA); Kain dalam: 100.0% Polyethylene Terephtalate (PET)', 'kids', 'https://contents.mediadecathlon.com/p2209019/k$63a01ccdeee69e4f6afeded24c9816c2/trek-100-mountain-trekking-hat-dark-grey.jpg?format=auto&quality=70&f=1366x1366'),
(47, 'Ransel Hiking Anak NH120 CN Kapasitas 10 L - Abu-abu', 999, 95000, 'Tim kami, para pejalan kaki merancang ransel NH120 10 liter ini untuk Anda bawa saat hiking di dataran rendah selama dua jam, di hutan, pantai dalam cuaca kering.\r\n\r\nMotivasi kami? Untuk menawarkan ransel 10 liter dengan harga terjangkau sehingga Anda dapat membawa barang-barang penting dengan aman di segala jalur lereng yang landai.\r\n\r\nKain utama: 10.0% Poliuretan (PU), 90.0% Polyethylene Terephtalate (PET); Lis: 12.0% Poliuretan (PU), 88.0% Polyethylene Terephtalate (PET); Jaring: 100.0% Polipropilena (PP); Jaket: 100.0% Poliuretan (PU)', 'kids', 'https://contents.mediadecathlon.com/p2292011/k$7ae7832de55ae69a7d44535e9545219d/backpack-nh120-10l-cn-stripe.jpg?format=auto&quality=70&f=1366x1366'),
(48, 'Sepatu Hiking Tali Anak Perempuan MH100 dari ukuran 2-5 Biru Coral', 999, 250000, 'Desainer kami yang terdiri dari orang tua pendaki muda mengembangkan sepatu pendek ini agar anak-anak dapat berjalan di medan yang mudah\r\n\r\nSepatu terjangkau yang dibuat khusus untuk anak-anak. Ringan dengan cengkeraman yang baik, agar anak dapat mendaki ke mana saja.\r\n\r\nSol Bagian Luar dari: 100.0% [EN] Styrene Butadiene Styrene (SBS); Atasan dari: 50.0% Poliuretan (PU), 50.0% Polyethylene Terephtalate (PET); Lining dan kaos kaki: 50.0% Etilena Vinil Asetat (EVA), 50.0% Polyethylene Terephtalate (PET)', 'kids', 'https://contents.mediadecathlon.com/p1869856/k$56577d6e7408b6d340fba3c8b84d001b/kids-lace-up-hiking-shoes-mh100-from-size-2-to-5-blue-coral.jpg?format=auto&quality=70&f=1366x1366'),
(49, 'Jaket Hiking Kedap Air Anak MH150 Usia 7 sampai 15 Tahun - Turquoise Print', 999, 250000, 'Kami telah mengembangkan jaket hujan tahan air MH150 ini untuk melindungi anak Anda dari angin dan hujan saat mereka menikmati penjelajahannya di alam.\r\n\r\nJaket praktis dan dapat dilipat di sakunya atau dimasukkan dengan rapi ke dalam ransel.', 'kids', 'https://contents.mediadecathlon.com/p1566250/k$51796c5b7cfb1de11f84b4b8eda015dc/mh150-kids-waterproof-hiking-jacket-7-to-15-years-navy-grey.jpg?format=auto&quality=70&f=1366x1366'),
(50, 'Topi Anak MH100', 999, 100000, 'Tim kami, yang terdiri atas orang tua pendaki muda, mengembangkan topi ini untuk melindungi anak-anak Anda dari paparan sinar matahari saat hari cerah dan indah.\r\n\r\nJangan lupa untuk membawa topi ini saat anak berjalan di jalan setapak! Topi dapat disesuaikan dengan sempurna untuk setiap ukuran kepala.\r\n\r\nKain utama: 100.0% Polyamide (PA)', 'kids', 'https://contents.mediadecathlon.com/p2126951/k$21ec26e7236af79ea61d8fdfd98ef251/kids-cap-mh100.jpg?format=auto&quality=70&f=1366x1366'),
(51, 'Ransel Mendaki Anak MH100 5 Liter', 999, 120000, 'Desainer hiking kami menciptakan ransel kecil dan ringan dengan kapasitas 5 liter ini sehingga anak-anak Anda bisa membawa kebutuhan.\r\n\r\nIdeal untuk bertualang atau sekolah, tas bertali ini ringan dan cocok untuk anak-anak. Nyaman dan praktis digunakan dengan bukaan tengah yang besar dan banyak saku\r\n\r\nKain utama: 100.0% Polyethylene Terephtalate (PET); Kain belakang : 100.0% Polyethylene Terephtalate (PET); Saku: 100.0% Polyamide (PA); Lis: 100.0% Polyethylene Terephtalate (PET); Bagian Busa: 100.0% Polyethylene High Density (HDPE); Jaket: 100.0% Poliuretan (PU); Jaring: 100.0% Polyethylene Terephtalate (PET)', 'kids', 'https://contents.mediadecathlon.com/p1760782/k$8a56d649dbe866ce4f761632f6a2bb54/kids-hiking-rucksack-mh100-5-litres.jpg?format=auto&quality=70&f=1366x1366');

-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

CREATE TABLE `user_data` (
  `id_user` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` text NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_type` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_data`
--

INSERT INTO `user_data` (`id_user`, `user_name`, `user_email`, `user_password`, `user_type`) VALUES
(1, 'reza', 'rezabagus795@gmail.com088217674677reza', '202cb962ac59075b964b07152d234b70', 'user'),
(2, 'reza', 'Chikikafilani@gmail.com', '202cb962ac59075b964b07152d234b70', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD PRIMARY KEY (`id_pemesanan`,`id_produk`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `user_data`
--
ALTER TABLE `user_data`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

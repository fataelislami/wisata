-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 29, 2018 at 02:08 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `atol`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_dinas`
--

CREATE TABLE `admin_dinas` (
  `id` int(11) NOT NULL,
  `username` int(11) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `kota` int(11) NOT NULL,
  `foto` varchar(225) NOT NULL,
  `status` varchar(225) NOT NULL DEFAULT 'pending',
  `level` varchar(20) DEFAULT 'dinas',
  `id_superadmin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_dinas`
--

INSERT INTO `admin_dinas` (`id`, `username`, `password`, `nama`, `email`, `kota`, `foto`, `status`, `level`, `id_superadmin`) VALUES
(1, 77321123, 'be8167c482162d434a6630d6aadcb3b3', 'Star Ramadhan', 'star@gmail.com', 1, 'www.google.com', 'aktif', 'dinas', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `data_wisata`
--

CREATE TABLE `data_wisata` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `lat` decimal(10,7) DEFAULT NULL,
  `lang` decimal(10,7) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `keterangan` text,
  `harga_tiket` int(11) DEFAULT NULL,
  `peta_marker` varchar(50) DEFAULT NULL,
  `id_kota` int(11) DEFAULT NULL,
  `id_kecamatan` int(11) DEFAULT NULL,
  `id_kelurahan` int(11) DEFAULT NULL,
  `id_user` varchar(225) DEFAULT NULL,
  `safe_delete` int(11) DEFAULT '0',
  `no_telp` varchar(20) DEFAULT NULL,
  `htm_dewasa` varchar(20) DEFAULT NULL,
  `htm_anak` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_wisata`
--

INSERT INTO `data_wisata` (`id`, `nama`, `lat`, `lang`, `alamat`, `keterangan`, `harga_tiket`, `peta_marker`, `id_kota`, `id_kecamatan`, `id_kelurahan`, `id_user`, `safe_delete`, `no_telp`, `htm_dewasa`, `htm_anak`) VALUES
(1, 'Curug Cimohay', '-6.7994868', '107.5752094', 'jln Kol. Matsuri no 325', 'Curug Cimahi adalah sebuah tempat wisata yang berlokasi di desa Kertawangi, Kecamatan Cisarua, Kabupaten Bandung Barat, tepatnya beralamat di jalan Kolonel Masturi, Cisarua. Curug Cimahi ini mempunyai ketinggian sekitar 85 m. Pemandangannya sejuk, segar dan indah.', 15000, 'curug.jpg', 2, 47, 297, '0', 0, '+62 821 2099 8872', 'Rp. 15.000', 'Rp. 15.000'),
(2, 'Alam Wisata Cimahi', '-6.8410387', '107.5488993', 'Jln Matsuri km 14 Nomor 157', 'Alam Wisata Cimahi berada di Jalan Kolonel Masturi KM 4 Nomor 157, Jawa Barat. Alam Wisata Cimahi merupakan tempat wisata dengan konsep pendidikan pertanian, peternakan, dan kuliner yang berada di satu lokasi. AWC sendiri diresmikan oleh walikota Cimahi pada tanggal 18 oktober 2009.', NULL, '', 2, 33, 161, '0', 0, '+62 22 270 0228\r', 'Gratis', 'Gratis'),
(3, 'Taman Wisata Paku Haji', '-6.8386924', '107.5366191', 'Jln Haji Ghofur', 'Wisata Paku Haji adalah Tempat wisata di Cimahi yang beralamat di Jalan Haji Ghofur KM 4, RT 02/RW 10 Pakuhaji, Ngamprah, Kabupaten Bandung Barat, Jawa Barat. Yang merupakan salah satu kegiatan wisata paling favorit yang sering dilakukan oleh pengunjung yang datang ke sini, karena mau merasakan bagaimana sensasi menaiki seekor kuda.', NULL, '', 2, 44, 263, '0', 0, '+62 813 2227 2623 \r', 'Rp. 2.000', 'Rp. 2.000'),
(4, 'All About Strawberry', '-6.8642247', '107.5608113', 'jln Cihaunjang km 2', 'All about strawberry adalah tempat wisata yang terletak di daerah Cihanjuang, Cimahi. Tempat ini menawarkan tempat rekreasi keluarga yang hemat. Wisata utamanya adalah kebun strawberry yang bisa kita petik sendiri buahnya. Selain kebun strawberry, ditempat ini ada juga beberapa arena permainan. ', NULL, '', 2, 33, 159, '0', 0, '+62 22 663 1234\r', 'Rp. 5.000', 'Rp. 5.000'),
(7, 'Rumah Bunga rizal', '-6.8260287', '107.6353893', 'Jl. Raya Maribaya KM 2,4', 'Rumah Bunga Rizal Maribaya adalah sebuah kebun atau taman wisata yang terletak di kaki pegunungan burangrang yang secara khusus menyediakan berbagai tanaman bunga hias yang sangat indah dan populer namanya, seperti bunga anggrek, kaktus, sukulen dan tanamah hias lainnya. Apabila anda penyuka sekaligus penggila jenis bunga khas seperti anggrek dan kaktus, maka jangan sampai melewatkan untuk datang ke Rumah Bunga Rizal yang berlokasi di Jalan Maribaya Km. 2,4, Kec. Lembang, Bandung', NULL, '', 2, 46, 283, '0', 0, '+62 222 7863 21\r', 'Rp. 10.000', 'Rp. 10.000'),
(8, 'Pasar Terapung Lembang', '-6.8179105', '107.6165902', 'Jl. Grand Hotel No. 33E', 'Pasar terapung lembang ini bukan berjualan sayuran, beras atau makanan pokok melainkan perahu yang ada di Floating Market Lembang digunakan untuk menjajakan aneka jajanan yang enak dan banyak sekali pilihan macamnya.', NULL, '', 2, 46, 284, '0', 0, '+62 22 278 7766\r', 'Rp. 15.000', 'Rp. 15.000'),
(9, 'Kampung Buyut Cipageran ( Kabuci ) Asih Putera ', '-6.8482062', '107.5487739', 'Jl. Kolonel Masturi KM.3', 'Kabuci adalah sebuah areal kawasan wisata di cimahi utara yang berdiri di atas luas areal seluas 2.5 hektar.  kawasan ini adalah sebuah kampung wisata berkonsep Kampung kasundaan di Bandung fungsi kampung wisata ini yaitu sebagai sebuah kawasan konservasi alam, pusat seni dan budaya serta tempat wisata edukasi di bandung tanpa melepaskan unsur budaya sundanya.', NULL, '', 2, 33, 161, '0', 0, '(022) 20661992\r', 'Rp. 10.000', 'Rp. 10.000'),
(10, 'Situ Ciseupan', '-6.8940461', '107.5156832', 'Jl. Ibu ganirah ( Jl. Cibeber)', 'Situ Ciseupan merupakan salah satu daerah tujuan wisata alam di Kelurahan Cibeber yang merupakan salah satu daerah resapan air di Kota Cimahi. Pemandangan alam yang sangat indah merupakan salah satu kelebihan yang dimiliki Ciseupan. Ciseupan memiliki luar area ± 5 Ha, yang terletak di Kecamatan Cimahi Selatan.', NULL, '', 2, 31, 151, '0', 0, '', 'Gratis', 'Gratis'),
(11, 'Curug Bugbrug', '-6.7921079', '107.5801286', 'Jalan Kolonel Masturi', 'Berada di ketinggian 1.050 meter di atas permukaan air laut, Curug Bugbrug memiliki ketinggian tidak kurang dari 50 meter tingginya dengan lebar curug 2 meter. Sementara kolam air di bawahnya yang menampung jatuhan air yang cukup deras dan keras air terjun ini airnya cukup jernih bersih dan cukup tenang dengan kedalaman mencapai antara 3 – 4 meter.  curug bugbrug bisa dijadikan salah satu tempat rekreasi di bandung yang tepat untuk dijadikan tempat refreshing sekaligus relaksasi tubuh dan pikiran dari beban hidup keseharian.', NULL, '', 2, 47, 297, '0', 0, '', 'Rp. 7.500', 'Rp. 7.500'),
(12, 'Curug Panganten', '-6.8288150', '107.5919230', 'Jalan Raya Cihanjuang Km 5,6', 'Curug Panganten adalah air terjun yang berada di barat Bandung. Air terjun ini berada pada ketinggian 1050 mdpl dengan ketinggian ± 50 m. dan memiliki keunikan yaitu pemandangan alamnya yang indah. Curug Panganten berada di lembah yang hijau dan menyejukan yang memiliki dua aliran air terjun yang saling berdampingan, air terjun utama yaitu yang memiliki ukuran lebih besar dan deras, satu lagi yang berada di sebelahnya memiliki ukuran yang lebih kecil.', NULL, '', 2, 47, 296, '0', 0, '', 'Rp. 6.000', 'Rp. 6.000'),
(13, 'Gedung Sate', '-6.9024812', '107.6188100', 'Jl. Diponegoro No.22', 'Gedung Sate merupakan sebuah bangunan besar dan megah di Bandung. Tempat ini merupakan icon dari kota Paris van Java ini. gedung ini mempunyai ciri khas yang unik, yaitu ornamen 6 tusuk sate yang ada di atas menara sentral. 6 tusuk sate ini melambangkan 6 juta Gulden yang dipakai untuk membangun gedung berwarna putih ini pada masanya. Taman di sekeliling Gedung Sate adalah lokasi favorit untuk wisatawan berfoto-foto', NULL, '', 1, 24, 118, '', 0, '(022) 4233347\r', 'Gratis', 'Gratis'),
(14, 'Kampung Tulip', '-6.9630809', '107.6619272', 'Banyu Biru, Jl. Ciwastra Blok H No.17', 'Kampung Tulip merupakan sebuah destinasi wisata bernuansa Belanda. yang berlokasi di Komplek Banyu Biru Blok H No 17, jalan Pasir Pogor Ciwastra Bandung. Tempat ini akan sangat ramai dengan banyaknya pengunjung yang datang terutama di waktu libur akhir pekan dan musim liburan.', NULL, '', 1, 10, 54, '', 0, '0815-7313-7808\r', 'Rp. 7.500', 'Rp. 7.500'),
(15, 'Taman Sejarah', '-6.9103481', '107.6098206', 'Jl. Aceh No.53', 'Taman Sejarah Bandung adalah salah satu taman tematik terbaru di Kota Kembang. Taman ini dibangun sebagai itikad baik kota Bandung untuk memberikan wisata edukasi tentang Sejarah Bandung kepada generasi muda dengan cara yang unik dan berbeda. Di sini pengunjung bisa melihat dan menikmati suguhan sejarah siapa saja orang yang berperan dan menjadi pemimpin bandung dari masa ke masa berupa kisah yang dibuat dalam bentuk gambar mural, relief dan stiker.', NULL, '', 1, 21, 104, '', 0, '\r', 'Gratis', 'Gratis'),
(16, 'Forest Walk Babakan Siliwangi', '-6.8862497', '107.5381846', 'Jalan Tamansari No.73', 'Forest Walk yang berada di Hutan Kota Babakan Siliwangi ini adalah sebuah fasilitas untuk para pejalan kaki yang merupakan salah satu bagian dari program penataan hutan kota Babakan Siliwangi. Fasilitas ini sengaja dibangun untuk memudahkan para wisatawan untuk menikmati suasana hutan secara dekat tanpa harus menembus lebatnya hutan.', NULL, '', 1, 27, 131, '', 0, '(022)2501394\r', 'Gratis', 'Gratis'),
(17, 'Taman Film', '-6.8986869', '107.6055564', 'Jl. Layang Pasupati', 'Taman ini memiliki luas area 1.300 meter persegi dengan kapasitas penonton mencapai 500 orang. aman Film ini dibuat dengan tujuan menambah tempat wisata Kota Bandung bagi warga lokal untuk berkumpul menonton film dan saling bercengkrama.', NULL, '', 1, 24, 117, '', 0, '0857-8080-0181\r', 'Gratis', 'Gratis'),
(18, 'Amazing Art World', '-6.8517840', '107.5956073', 'Jalan Setiabudhi No. 293', 'Amazing Art World merupakan Museum 3D Art ( 3 Dimensi) Terbesar di Dunia, dengan luas ± 2 ha menampilkan 6 Gallery, 13 Zona dan 150 Photo Spot. Para Pengunjung tidak hanya akan menikmati lukisan 3 Dimensi yang dilukis didinding tetapi juga lantai museum dilukis sesuai dengan tema di masing-masing zona.', NULL, '', 1, 29, 144, '', 0, '(022) 82003777\r', '1. Senin - jumat : R', '1. Senin - Jumat : R'),
(19, 'Curug Dago', '-6.8655220', '107.6159991', 'Jl. Dago Pojok', 'Curug Dago merupakan sebuah objek wisata Air terjun di bandung yang memiliki ketinggian air sekitar 12 m saja dan berada pada ketinggian sekitar 800 meter diatas permukaan laut.', NULL, '', 1, 27, 135, '', 0, '(022) 2933180\r', 'Rp. 15.000', 'Rp. 10.000'),
(20, 'Taman Lalu Lintas', '-6.9111200', '107.6109847', 'Jalan Belitung No.1', 'Taman Lalu Lintas adalah tempat bermain sekaligus sarana pendidikan non sekolah atau nonformal yaitu untuk menanamkan ke dalam diri anak-anak sejak dari usia dini tentang bagaimana cara dan etika berlalu-lintas yang baik dan benar bagi anak-anak.', NULL, '', 1, 21, 103, '', 0, '(022) 4201667\r', 'Rp. 7.000', 'Rp. 7.000'),
(21, 'Alun - Alun Bandung', '-6.9218744', '107.6049440', 'Jl. Asia Afrika', 'Alun-alun Bandung adalah pusat kota Bandung yang dicirikan oleh sebidang tanah yang luas, dan terdapat taman bunga yang berwarna warni. Dengan sekelilingnya ada bangunan-bangunan fungsional. ', NULL, '', 1, 6, 36, '', 0, '\r', 'Gratis', 'Gratis'),
(22, 'Taman Vanda', '-6.9140210', '107.6079987', 'Jl. Merdeka No.9', 'Taman Vanda merupakan sebuah taman yang cukup unik berbentuk segitiga. Taman vanda sekarang ini telah menjadi sebuah Tempat Nongkrong di kota Bandung, dan selalu ramai dikunjungi banyak pengunjung, yang tak hanya warga kota bandung saja, akan tetapi wisatawan luar kota juga.', NULL, '', 1, 21, 104, '', 0, '\r', 'Gratis', 'Gratis'),
(23, 'Taman Musik', '-6.9119334', '107.6138291', 'Jl. Sumbawa No.32', 'Taman Musik merupakan Taman yang diperuntukkan bagi mereka gemar musik, terutama anak band. Tempat itu bisa jadi tempat bagi band-band yang ingin manggung.', NULL, '', 1, 21, 103, '', 0, '\r', 'Gratis', 'Gratis'),
(24, 'Bandung Geological Museum', '-6.9007084', '107.6214906', 'Jl. Diponegoro No.57', 'Museum Geologi merupakan tempat yang menyimpan berbagai materi geologi pra sejarah seperti fosil hewan purba, berbagai jenis batu dan mineral. Museum ini sudah lama didirikan, bahkan sebelum Indonesia Merdeka. Suasana ditempat ini sebenarnya cukup tertutup dengan sedikit sinar matahari yang masuk, entah karena ini tipikal bangunan khas Belanda atau karena pengelola memang sengaja untuk tidak terlalu memberikan ruang yang memiliki banyak sinar ultra violet agar materi yang tersedia didalamnya bisa awet.  ', NULL, '', 1, 26, 126, '', 0, '(022) 7213822\r', 'Rp. 3.000', 'Rp. 3.000'),
(25, 'Lactasari Mini Farm', '-6.8903754', '107.5961280', 'Jl. Sukajadi No.131-139', 'Peternakan mini ini ternyata sengaja dibuka di sebuah mal pada Agustus 2011 untuk memberikan kesempatan kepada masyarakat yang ingin merasakan suasana peternakan di tengah kota. Tidak harus menyempatkan waktu yang banyak untuk sengaja pergi ke peternakan yang biasanya berlokasi di pinggir kota. Memberi makanternak bisa jadi salah satu agenda yang bisa dilakukan di mal, selain berbelanja, ngafe, dan jalan-jalan tentunya.', NULL, '', 1, 28, 139, '', 0, '022-6621007\r', 'Rp. 10.000', 'Rp. 50.000 / 1 botol'),
(26, 'Kampung Bamboo', '-6.8714360', '107.6669930', 'Jl. Terusan Padasuka KM.4', 'Kampung Bamboo sendiri menempati luas areal sekitar 8 hektar. Lokasinya yang berada di perbukitan, menjadikan tempat ini sebagai salah satu Tempat Wisata Alam di Bandungyang terbilang masih sangat alami. Beragam tumbuhan yang sengaja dilestarikan di sini seperti buah duren, lengkeng, jambu air, blimbing dan yang lainnya. ', NULL, '', 1, 80, 601, '', 0, '0813-2224-0483\r', 'Rp. 55.00', 'Rp. 40.000'),
(27, 'Trans Studio Bandung', '-6.9258138', '107.6360604', 'Jl. Gatot Subroto No.289', 'Trans Studio di Bandung (TSB) adalah sebuah kawasan wisata terpadu berkonsep Indoor Theme Park kedua di Indonesia, menyusul pendahulunya Trans Studio Resort Makasar di Sulawesi. Namun meski hadir belakangan, Trans Studio di Kota Bandung ini digadang-gadang jauh lebih spektakuler dan lebih dahsyat serta lebih lengkap wahana permainannya dari Trans Studio Makasar. Bahkan bukan hanya itu, Trans Studio Bandung juga diklaim bukan hanya sebagai Indoor Theme Park terbesar di Indonesia saja, namun juga terbesar yang ada di Dunia.', NULL, '', 1, 20, 97, '', 0, '(022) 86012555\r', 'Senin- Kamis : Rp. 1', 'Senin- Kamis : Rp. 1'),
(28, 'Monumen Perjuangan', '-6.8934648', '107.6185381', 'Jalan Dipatiukur No.48', 'Monumen Perjuangan Rakyat Jawa Barat (Monju) adalah Museum Sejarah Perjuangan Rakyat Jawa Barat, di Tatar Pasundan atau Parahyangan. Monumen diresmikan penggunaanya oleh Gubernur Jawa Barat, Raden Nana Nuriana pada tanggal 23 Agustus 1995. Monumen Perjuangan terletak di Jalan Dipati Ukur No. 48, Kota Bandung. Lokasinya berhadapan dengan Gedung Sate dan di depan Kampus Universitas Padjadjaran (Unpad), Kota Bandung. Monumen berdiri di atas tanah seluas ± 72.040 m² dan luas bangunan ± 2.143 m².', NULL, '', 1, 27, 132, '', 0, '(022) 2506771\r', '-', '-'),
(29, 'Upside Down World Bandung', '-6.8963045', '107.6170060', 'Jl. H. Wasid No.31', 'Upside Down World ini berlamat di jalan H.Wasid No 31, Lebakgede, 27 Kota Bandung Jawa Barat, dimana lokasinya sangat dekat dengan jalan Dipatiukur. Tempat wisata ini, sejak dibuka pertama kali berhasil memancing banyak orang untuk datang, setelah beragam foto-foto yang diambil pengunjung dari tempat ini diupload dan tersebar di dunia maya internet. Upside Down World menjadi tempat wisata yang trending sekaligus menjadi buruan para nettizen pecinta fotography. konsep wisata seperti Upside Down World ini sebenarnya merupakan konsep ruangan terbalik yang pertama kali dipopulerkan lewat Film karya Hollywood yang berjudul ” Upside Down “. ', NULL, '', 1, 27, 132, '', 0, '(022) 20454234\r', 'Rp. 60.000', 'Rp. 40.000'),
(30, 'Skywalk ', '-6.8931767', '107.6041947', 'Jl. Cihampelas No.123-131', 'Skywalk Cihampelas adalah sebuah Teras Cihampelas yang berada di atas Jalan Cihampelas Bandung. Luas banguna Skywalk Cihampelas Bandung diperkirakan sekitar setengah hektar. Dengan panjang sekitar 450 meter dan lebar sekitar 9 meter, dan tinggi 4.6 meter. Dari ketinggian Skywalk Cihampelas, pengunjung bisa melihat pemandangan dan kerlap kerlip lampu kota Bandung sambil menikmati jajanan murah yang disajikan dari berbagai kios-kios pedagang kaki lima yang tertata dengan rapi.', NULL, '', 1, 27, 130, '', 0, '\r', 'Gratis', 'Gratis'),
(31, 'Taman Lansia Bandung', '-6.9016497', '107.6205140', 'Jl. Cisangkuy', 'Taman Lansia merupakan salah satu taman kota yang berada di dalam Kota Bandung. Persisnya terletak di sebelah kanan dari Gedung Sate. Taman Lansia sendiri merupakan singkatan dari Taman Lanjut Usia, tempat ini merupakan sarana refreshing dan juga istirahat bagi para pengunjung, baik itu warga kota Bandung ataupun warga luar Bandung yang sedang wisata ke Bandung. Namun jangan salah, meskipun namanya Taman Lansia, disini juga banyak sekali anak muda ataupun keluarga yang sedang rekreasi dan bersantai menikmati lingkungan alam yang indah dan hijau atau makan bersama sambil menikmati sejuknya udara. ', NULL, '', 1, 24, 118, '', 0, '0815-6160-009\r', 'Gratis', 'Gratis'),
(32, 'Saung Angklung Udjo', '-6.8980320', '107.6549650', 'Jl. Padasuka No.118', 'Saung Angklung Udjo (SAU) adalah sebuah tempat wisata atraksi pertunjukan, pusat kerajinan tangan dari bambu, dan workshop instrumen musik dari bambu. Selain itu, tempat ini didirikan sebagai laboratorium pendidikan serta edukasi untuk melestarikan kebudayaan Sunda, khususnya alat musik angklung. ', NULL, '', 1, 25, 124, '', 0, '(022) 7271714\r', 'Rp. 60.000', 'Gratis'),
(33, 'Teras Cikapundung', '-6.8844307', '107.6068384', 'Jl. Siliwangi', 'Teras Cikapundung ini telah dibuka dan dikenalkan kepada masyarakat umum oleh di bulan desember 2015, dan peresmiannya dilakukan oleh Menteri PU bersama pemkot bandung di pertengahan tahun 2016. Tujuan dibangunnya adalah menyediakan ruang umum terbuka untuk warga kota bandung dan sekitarnya, sebagat tempat bersosialisasi, berkumpul di kawasan hijau kota yang nyaman untuk ditinggali. ', NULL, '', 1, 30, 145, '', 0, '\r', 'Rp. 10.000', 'Rp. 5.000'),
(34, 'Zone73', '-6.9262688', '107.7110660', 'Jl. A.H. Nasution No.73', 'Zona73 Adalah sebuah one-stop sportainment pertama di kota Bandung. Dengan fasilitas dan wahana yang kami tawarkan, kami berharap dapat menyajikan sebuah arena rekreasi dan hiburan yang menyehatkan bagi pengunjung sekaligus menjadi tempat berkumpulnya anak muda dalam mengembangkan minat dan bakatnya di bidang olahraga.', NULL, '', 1, 12, 60, '', 0, '(022) 7831177\r', '-', '-'),
(35, 'Museum Konferensi Asia Afrika', '-6.9212134', '107.6095152', 'Jl. Asia Afrika No.65', 'Museum Konferensi Asia Afrika Bandung adalah saksi sejarah bahwa di Bandung tepat pada tanggal 18 – 24 april 1955 pernah diselenggarakan sebuah hajatan akbar bertaraf Internasional yang mempertemukan seluruh pemimpin negara-negara dari kawasan Benua Asia Afrika di Bandung. Tempat Wisata Sejarah Di Bandung ini memiliki konsep bangunan Art Deco dengan bahan lantai dasaar dari marmer yang sengaja didatangkan langsung dari negeri Italia yang terkenal super dan sangat mengkilap dari warnanya.Sementara ruangannya terbuat dari kayu Cikenhout yang terkenal kuat dan penerangannya menggunakan Lampu Kristal bias yang memberikan cahaya gemerlap.   ', NULL, '', 1, 21, 101, '', 0, '(022) 4233564\r', 'Gratis', 'Gratis'),
(36, 'Museum Sri Baduga', '-6.9376785', '107.6035245', 'Jl. BKR No.185', 'Museum Sri Baduga adalah sebuah meuseum di kota Bandung yang berdiri di atas areal lahan yang luasnya mencapai kurang lebih 8.500 m2. Keberadaan bangunan berserta isinya yang merupakan Peninggalan sejarah dan juga kebudayaan khas jawa barat yang mempunyai nilai sejarah dan pendidikan yang tidak ternilai harganya. Museum Sri Baduga ini bisa dikatakan sebagai sebuah tempat wisata bersejarah yang bernilai pendidikan yang sangat bagus untuk pengajaran akan ilmu pengetahuan sejarah Anak-anak yang masih duduk di bangku sekolah.', NULL, '', 1, 5, 27, '', 0, '(022) 5210976\r', 'Rp. 2500', 'Rp. 2500'),
(37, 'Taman Superhero', '-6.9109097', '107.6305259', 'Jl. Bengawan', 'Taman ini sangat cocok untuk anda kunjungi bersama anggota keluarga, terutama bagi mereka para orang tua yang memiliki putra-putri yang masih berusia kecil. Tempatnya selalu dipadati oleh pengunjung terutama di waktu libur akhir pekan dan musim liburan, sehingga jangan heran jika anda melihat aktiftas wisata yang ramai jika berkunjung ke sini.', NULL, '', 1, 24, 119, '', 0, '\r', 'Gratis', 'Gratis'),
(38, 'Taman Hutan Raya Ir. H. D juanda', '-6.8565917', '107.6326667', 'Kompleks Tahura Ir. H. Djuanda No.99, Dago Pakar', 'Luas areal Taman Hutan Juanda Bandung ini meliputi 590 hektar lahan, yang luas arealnya membentang mulai dari kawasan wisata Dago Pakar hingga kawasan Wisata Maribaya lembang Bandung. Lokasi Taman Hutan Raya Kota Bandung ini sendiri berada di atas ketinggian antara 770 hingga 1.330 meter di atas permukaan air laut. Di dalam Kawasan wisata Taman Hutan Raya ini tercatat memiliki tidak kurang dari 2500 jenis tanaman, yang terdiri dari 40 jenis familia serta 112 species. ', NULL, '', 1, 80, 604, '', 0, '(022) 2515895\r', 'Wisatawan Lokal : Rp', 'Wisatawan Lokal : Rp'),
(39, 'Bandung Creative Hub', '-6.9180824', '107.6316746', 'Jl. Laswi No.5', 'Bandung Creative Hub (BCH) ini berdiri di atas sebuah gedung yang terdiri dari enam lantai bangunan. merupakan sebuah tempat yang diklaim akan menjadi seperti ” Alun – Alun Kreatif Bandung ” atau wadah khusus bagi para pegiat atau orang – orang kreatif sebandung raya.  ', NULL, '', 1, 20, 99, '', 0, '\r', 'Gratis', 'Gratis'),
(40, 'Chinatown Bandung', '-6.9172764', '107.5931170', 'Jl. Kelenteng No.41', 'Desa Wisata Kampung China Bandung ini berdiri di atas areal seluas sekitar 3.000, Konsep Chinatown ini benar – benar dibuat sangat unik, dimana suasananya dibuat sedemikian rupa menyerupai sebuah pemukiman warga tionghoa zaman dulu. Untuk menciptakan sensasi suasana khas China Town sungguhan, telah disediakan ornamen hingga properti yang akan membawa imajinasi yang melihatnya,  Yaitu imajinasi berada dalam sebuah tempat baru yang sangat berbeda dengan suasana di luar Kampung China Bandung ini.', NULL, '', 1, 22, 109, '', 0, '(022) 6038114\r', 'Senin - Kamis : Rp. ', 'Senin - Kamis : Rp. '),
(41, 'Museum Nike Ardilla ', '-6.9406015', '107.6725445', 'Komp. Arya Graha, Jl. Aria Utama No. 5', 'Museum ini menempati sebuah bangunan Rumah yang akan menjadi saksi bisu serta menyimpan segala kenangan Nike Ardilla selama hidupnya, dan populer juga dengan sebutan Rumah Nike Ardilla (RNA). Museum Nike Ardilla ini menempati bangunan 2 lantai seluas 500 meter persegi, dimana lantai pertama digunakan sebagai tempat tinggal keluarga almarhumah Nike Ardila dan di lantai 2 Museum Nike Ardilla. ', NULL, '', 1, 10, 52, '', 0, '0815-7211-5999\r', 'Gratis', 'Gratis'),
(42, 'Bandung Carnival Land', '-6.8803058', '107.5949250', 'Jl. Sirna Galih No.2', 'Bandung Carnival Land adalah kawasan wisata yang buat dengan konsep menyerupai Dunia Fantasi di Jakarta.Meski tidak sebesar dan sekomplit fasilitas Dufan,akan tetapi objek wisata di Bandung ini bisa menjadi alternatif wisata murah di Bandung yang bercita rasa Dufan.', NULL, '', 1, 28, 139, '', 0, '0896-6230-5758\r', 'Senin - Jumat : Rp. ', 'Senin - Jumat : Rp. '),
(43, 'Museum Pos Indonesia', '-6.9023181', '107.6199678', 'Jl. Cilaki No.73', 'Museum Pos Indonesia di kota Bandung terdapat beragam benda-benda pos mulai dari timbangan surat, sepeda pengantar pos juga turut dipajang sebagai barang pameran. Barang lainnya yang turut juga dipajang adalah fase perkembangan baju dinas serta peralatan pos dari masa ke masa, mulai dari zaman kolonial hingga waktu saat ini.', NULL, '', 1, 24, 118, '', 0, '(022) 4206195\r', 'Gratis', 'Gratis'),
(44, 'Kebun Binatang Bandung', '-6.8902867', '107.6068401', 'Jalan Kebun Binatang No.6, 27', 'Kebun binatang Bandung saat ini tecatat berdiri di atas lahan seluas 13,5 ha dengan topografi daerah yang bergelombang, Dengan Luas areal tersebut terbagi pemanfaatan dan fungsinya dengan perbandingan 18,25% untuk areal kandang, 55,20% untuk pertamanan dan lesehan, kemudian 4,7% untuk taman ria dan kolam perahu, dan 2,4% untuk pengolahan sampah dan sisanya dipergunakan untuk lahan bangunan kantor, museum aquarium, dan jalan.', NULL, '', 1, 27, 131, '', 0, '(022) 2502770\r', 'Rp. 40.000', '< 3 Tahun gratis'),
(45, 'Museum Wangsit  Mandala  Siliwangi', '-6.9176857', '107.6112641', 'Jl. Lembong No.38', 'Museum Wangsit Mandala Siliwangi adalah museum militer yang berada di Kota Bandung, Jawa Barat. Bangunan ini berdiri di atas tanah seluas 4.176 m2 dengan luas bangunan 1.674 m2. gedung ini diresmikan penggunaannya di tanggal 10 November 1980 oleh Pangdam Siliwangi ke-15, Mayjen Yoga Sugama dan dengan penandatangannan prasasti oleh Presiden Soeharto.', NULL, '', 1, 21, 101, '', 0, '(022) 4203393\r', 'Rp. 10.000', 'Rp. 10.000'),
(46, 'Wot Batu', '-6.8597013', '107.6360980', 'Jl. Bukit Pakar Timur No.98', 'Wot Batu adalah bentuk karya seni instalasi yang akan mengajak setiap penikmatnya untuk lebih memaknai kehidupan di dunia yang fana serta kehidupan yang akan datang. Lewat penempatan batu yang dibentuk sedemikian rupa, artistik, pengunjung akan diajak memahami filosofi kelahiran, interaksi sosial dengan sesama mahluk hidup, serta perkembangan zaman yang manusia alami selama hidupnya.', NULL, '', 1, 80, 604, '', 0, '(022) 82524480\r', 'Rp. 50.000', 'Rp. 50.000 '),
(47, 'Museum Barli', '-6.8782387', '107.5875349', 'Jl. Prof. Ir. Sutami No. 91', 'Museum ini sendiri dibangun di luas tanah sekitar 640 meter oersegi, dengan bangunan menempati luas sekitar 1.200 m2. Museum ini memiliki 3 lantai dan terbagi ke dalam beberapa ruangan museum , dengan memiliki fungsi ruangan yang berbeda denganyang lainnya. Hadirnya museum ini menjadi sarana apreasi karya seni rupa yang penuh nilai-nilai estetik , dan sekaligus menjadi tonggak sejarah perjalanan seni rupa Bandung.', NULL, '', 1, 29, 142, '', 0, '(022) 2011898\r', 'Rp. 15.000', 'Rp. 10.000'),
(48, 'Rabbit Town', '-6.8672484', '107.6103786', 'Jalan Ranca Bentang No.30-32', 'Rabbit Town adalah salah satu objek wisata baru yang kini sedang hits di kalangan wisatawan. Foto - fotonya banyak diunggah di sosial media, sehingga menjadi daya tarik yang cukup besar bagi netizen. Mereka penasaran, terutama yang tinggal di Bandunng. sehinga, ketika hari libur tiba, wisata ini sangat begitu dibanjiri pengunjung. ', NULL, '', 1, 30, 146, '', 0, '(022) 64404848\r', 'Harus mempunyai dan ', 'Harus mempunyai dan '),
(49, 'Indo Wisata Permata', '-6.8616055', '107.6160706', 'Komplek Citra Green Dago Blok N 1-10, Jalan Citra Green', 'Lokasinya yang berada tepat di kaki Bukit Dago cocok untuk melepas penat dari hiruk pikuk perkotaan. Saat menyambangi tempat wisata ini, terlihat bangunan yang megah pada bagian terasnya yang siap menyambut kedatangan wisatawan. IWP merupakan wisata edukasi yang mulai dirintis pada 14 Februari 2016. Wisata edukasi ini mengajak pengunjung melihat langsung proses pembuatan batu mulia menjadi berlian bernilai tinggi.', NULL, '', 1, 30, 146, '', 0, '(022) 20450588\r', 'Rp. 50.000', 'Rp. 50.000'),
(50, 'D\'Moners Home', '-6.9000120', '107.6446390', 'Jl. PH.H. Mustofa No.73', 'Doraemon adalah sebuah tokoh fiktif binatang kucing yang datang dari masa dari abad 222 yang di dalam ceritanya dikirim ke abad 20 untuk menolong tokoh kartin sosok manusia bernama Nobita. hubungannya Doremon dengan D’Moners Home adalah nama tempat cafe yang disediakan khusus bagi anda para pecinta tokoh doraemon,', NULL, '', 1, 25, 125, '', 0, '0818-0988-1927\r', 'Gratis', 'Gratis'),
(51, 'Gubug Makan Mang Engking', '-6.8877010', '107.6026370', 'Jl. Kopo Bihbul No.45', 'Gubug Makan Mang Engking Bandung adalah sebuah rumah makan yang bernuansa alam pedesaan di tengah – tengah hiruk pikuknya kota Bandung. Gubug Makan Mang Engking Bandung bukan hanya sebuah Rumah Makan tapi juga tempat rekreasi yang sangat nyaman dengan fasilitas yang lengkap', NULL, '', 1, 75, 569, '', 0, '(022) 5402900\r', '-', '-'),
(52, 'Rumah Guguk Petshop', '-6.8469509', '107.5954887', 'Jalan Pada Lestari No.23, Cidadap', 'Rumah guguk adalah tempat favorit bagi penggemar anjing. Ketika hari libur tiba, banayak yang mendatanginya, baik itu rombongan keluarga maupun komunitas pecinta anjing. Selain kucing, anjing menjadi bintang peliharaan yang imut dan menggemaskan. biasanya orang yang ingin membeli guguk bisa mengunjungi Rumah Guguk Bandung untuk membelinya', NULL, '', 1, 29, 144, '', 0, '(022) 2009921\r', '-', '-'),
(53, 'Punclut Bandung', '-6.8565089', '107.6109576', 'Jl. Punclut', 'Punclut atau Puncak Ciumbuleuit adalah kawasan dataran tinggi pegunungan yang paling dekat dari pusat kota Bandung, dimana jaraknya hanya 4 Km dari kawasan wisata belanja kota bandung terkenal seperti Cihampelas, dimana di kawasan itu ada Cihampelas walk dan Mox Club. Dengan ketinggian di atas 1000 meter di atas permukaan air laut, menjadikannya sebagai salah satu lokasi wisata yang strategis ', NULL, '', 1, 30, 146, '', 0, '0', 'Gratis', 'Gratis'),
(54, 'Kampung Gajah Wonderland Bandung', '-6.8293960', '107.5955330', 'Jl.Sersan Bajuri KM 3.8 272', 'salah satu lokasiÊObjek wisata di BandungÊyang asyik dan seru untuk kegiatan liburan di Bandung bersama keluarga atau sahabat dan siapa pun teman anda, yang berlokasi tepatnya berada di Jl.Sersan Bajuri Km 3,8 272 45 46 Bandung barat.', NULL, '', 3, 45, 272, '', 0, '022-88884012\r', '25.000', '15.000'),
(55, 'Farm House', '-6.8329750', '107.6057440', 'Jl.Raya 46 No 108', 'Farmhouse 46 bandungÊadalah salah satu tempat wisata terbaik bagi anda yang menyukai fotografi karena banyak spot-spot sangat menarik di sini.', NULL, '', 3, 46, 278, '', 0, '022-82782400\r', '25.000', '25.000'),
(56, 'Dusun Bambu', '-6.7894760', '107.5788280', 'Jl.Kolonel Masturi KM 11, Situ Lembang', 'Dusun Bambu Family Leisure Park 46 menjadi salah satu objek wisata andalan di Bandung. Hal itu terlihat dari sejak pertamakali resmi dibuka untuk umum, objek wisata ini tidak pernah sepi dari pengunjung.', NULL, '', 3, 46, 47, '', 0, '022-82782020\r', '15.000', '15.000'),
(57, 'Jendela Alam', '-6.8193680', '107.5963990', 'Komp.Graha Puspa, Jl.Sersan Bajuri KM 45', 'Jendela Alam BandungÊadalah Tempat wisata yang cocoksebagai sarana belajar anak anda sekaligus tempat rekreasi untuk anak-anak anda di Bandung Barat dengan sentuhan alam daerah 46 yang terkenal sangat indah dengan udara yang sejuk pula, serta sangat ideal sebagai tempat liburan keluarga di bandung untuk lebih mengenalkan anak akan perlunya pelestarian alam dan isinya.', NULL, '', 3, 45, 272, '', 0, '022-2788482\r', '20.000', '15.000'),
(58, 'Wisata Grafika Cikole', '-6.7852450', '107.6517460', 'Jalan Tangkuban Perahu KM.8', 'merupakan tempat wisata, restoran, serta penginapan di 46 di kaki gunung dengan ketinggian 1400 meter diatas permukaan laut. Udara yang sejuk dengan suhu 20 derajat celcius.', NULL, '', 3, 46, 289, '', 0, '022-2787915\r', '10.000', '10.000'),
(59, 'Curug Tilu Leuwi Opat', '-6.7905690', '107.5826390', 'Jalan Ciwangun Indah Camp', 'sebuah tempat wisata alam yang terletak di kawasan Ciwangun 45 Kabupaten Bandung berbatasan langsung dengan kebun pinus dilewati oleh aliran sungai yang menuju Curug Cimahi dari hulu Danau situ 46. Dengan luas kawasan 5 Hektar anda anda dapat dengan bebas menikmati area hijau dan asri. ', NULL, '', 3, 45, 275, '', 0, '0812-2436-5169\r', '10.000', '10.000'),
(60, 'Taman kupu-kupu', '-5.4209580', '105.1886230', 'Jl. 275 No. 58', 'taman kupu-kupu 275 yang asri dan sangat sejuk udaranya ini  dikelilingi dengan jaring besar sebagai jaring pembatas kupu-kupu supaya tidak bisa terbang ke luar lokasi wisata.', NULL, '', 3, 45, 275, '', 0, '022-2786915\r', '10.000', '10.000'),
(61, 'Sapu lidi resto', '-6.8127607', '107.5979286', 'Kompleks Graha Puspa', 'Sapu Lidi adalah sebuah Kawasan Wisata Terpadu yang menawarkan konsep Cafe, Resto dan Galery seni dengan jargon Ó Makan di SawahÓ.', NULL, '', 3, 46, 272, '', 0, '022) 2786915\r', 'Gratis', 'Gratis'),
(62, 'Kampung daun', '-6.8166680', '107.5891190', 'Jalan Sersan Bajuri KM. 4,7', 'Kampung DaunÊadalah sebuah tempat wisata kuliner terbaik di kota bandung,dengan menawarkan konsep Galery alami dan CafeÊ atau biasa disebut dengan istilah Cafe and Cultur Gallery,maka tempat ini siap memberikan service pelayanan dengan memanjakan pengunjung atau wisatawan yang berkunjung untuk menikmati alam dan suasana pedesaan yang hening,fresh dan berhawa dingin serta tentunya dengan aneka menuÊKampung DaunÊyang lezat dan menggairahkan', NULL, '', 3, 45, 273, '', 0, '(022) 2787915\r', '', ''),
(63, 'Rumah Halloween Bandung', '-6.8204562', '107.6106185', 'Jl. Raya 46 No.234', 'Rumah Halloween ini memang sangat mengedepankan sisi serta sensasi tempat yang menakutkan dan pastinya menyeramkan, hal tersebut bisa kita lihat dari bangunan serta dekorasi serta gambar Ð gambar di ruangan museum yang dibuat sedemikian rupa.', NULL, '', 3, 46, 278, '', 0, '0813-1250-7390\r', 'Rp. 50.000', 'Rp. 50.000'),
(64, 'Grace Rose Farm ', '-6.7981328', '107.5754910', 'Jalan Kolonel Masturi No.305', 'kawasan grace rose farm, saat ini sudah tersedia tidak kurang 600 jenis tanaman hias dari rencana target bisa mengoleksi 1000 jenis.', NULL, '', 3, 47, 297, '', 0, '0821-1612-9955\r', 'Rp. 10.000', 'Rp.10.000'),
(65, 'Mullberry hill', '-6.8204759', '107.6865915', 'Jalan Maribaya Timur No 1, RT.01/RW.10', 'Mulberry Hill 46 adalah sebuah tempat penginapan yang lokasinya sangat dekat dengan nama sebuah Gunung yang terkenal denganÊLegenda SangkuriangÊnya,', NULL, '', 3, 46, 292, '', 0, '0811-2339-876\r', 'Gratis', 'Gratis'),
(66, 'Curug Maribaya', '-6.8308092', '107.6565462', 'ÊKampung Cikondang, Lamajang, Pangalengan', 'Dulunya kawasan Maribaya adalah sebuah tempat yang dibiarkan seadanya, dan bahkan pernah ditutup untuk dilakukan renovasi pada tahun 2015. tetapi sekarang Kawasan ini dikenal sebagai salah satu sisi eksotisme wisata alam bandung yang masih sangat asri dan alami.', NULL, '', 3, 46, 292, '', 0, '0\r', '', ''),
(67, 'Puncak Eurad', '-6.7913340', '107.6817800', 'Cibodas-Ciater', 'Kawasan wisata perbukitan ini masih sangat asri dan masih sangat hijau dengan hamparanÊKebun teh Bandung, dan barisan pohon pinus.', NULL, '', 3, 46, 291, '', 0, '0\r', '', ''),
(68, 'De Ranch 46', '-6.8151351', '107.6266597', 'Jl. Maribaya No.17', 'De Ranch adalahÊTempat Wisata di Bandung BaratÊyang merupakan sebuah kawasan wisata yang unik dan eksotis di dataran tinggi pegunungan 46.', NULL, '', 3, 46, 283, '', 0, '(022) 2785865\r', 'Rp. 10.000', 'Rp. 10.000'),
(69, 'Dago Dream Park', '-6.8484428', '107.6261365', 'Jl. Dago Giri KM. 2,2', 'Dago Dreampark adalah tempat wisata keluarga dengan spot dan wahana selfie paling melimpah di Kota Bandung.', NULL, '', 3, 46, 281, '', 0, '0812-2223-8696\r', '', ''),
(70, 'sanghyang heuleut', '-6.8763720', '107.3417319', '', 'Sanghyang Heuleut adalah merupakan sebuah danau kecil yang mengalir di atas arus sungai citarum purba. Tempat ini termasuk ke dalam danau purba di bandung bisa dilihat dari susunan bebatuan (geologis) yang ada di sini.', NULL, '', 3, 42, 238, '', 0, '0\r', 'Rp. 10.000', 'Rp. 10.000'),
(71, 'Ganesha H Equestrian', '-6.8090907', '107.6434871', 'Jl. Raya Tangkuban Parahu KM.3,7', 'Di Taman Lembah Dewata, pengunjung bisa mencoba wisata air berkeliling danau dengan mendayung perahu sambil menikmati hamparan bukit yang ada di sekeliling kawasan wisata ini, terutamaÊGunung Putri 46ÊdanÊGunung Burangrang.', NULL, '', 3, 46, 288, '', 0, '0812-2253-6000\r', 'Rp. 10.000', 'Rp. 10.000'),
(72, 'Curug layung', '-6.7765342', '107.5794889', '', 'Curug Layung yang tidak terlalu tinggi airnya yaitu 4 meter dan tidak deras aliran airnya, sehingga membentuk seperti kolam alami yang cukup luas dan airnya yang jernih adalah daya pikat utamanya.', NULL, '', 3, 45, 277, '', 0, '0822-1912-3245\r', 'Rp. 10.000', 'Rp. 10.000'),
(73, 'Gantole 38', '-6.9588812', '107.4713147', '', 'Gantole 38 sangat luar biasa indahnya, dimana dari lokasi landasan gantole yang menghadap ke arah utara, anda akan secara jelas melihat pemandangan alam yang bagus dari jauh', NULL, '', 3, 38, 201, '', 0, '0\r', '', ''),
(74, 'Taman Begonia', '-6.8260160', '107.6383560', 'Jalan Raya Maribaya No.120 A', 'taman Begonia di 46 ini dengan segala daya tarik yang luar biasanya telah mampu merubah paradigma bahwa keindahan bunga-bunga di taman ini disukai semua orang.', NULL, '', 3, 46, 282, '', 0, '022-2788527\r', '10.000', '10.000'),
(75, 'Taman Lembah Dewata', '-6.8090910', '107.6434870', 'Jl. Raya Tangkuban Parahu KM.3,7', 'Taman Lembah Dewata menjadi satu destinasi yang cukup menarik di daerah 46 Utara. Salah satu daya tariknya yang mengundang banyak wisatawan baik lokal maupun dari luar kota yaitu keberadaan Danau Tadah Hujan yang memiliki pemandangan yang sangat indah.', NULL, '', 3, 46, 288, '', 0, '0812-2253-6000\r', '10.000', '10.000'),
(76, 'Ciwangun indah camp', '-6.7917790', '107.5812640', 'JL. Kolonel. Masturi/Jl. CIC Kp. Ciwangun RT. 03 RW. 15', 'Ciwangun Indah Camp tidak hanya menawarkan wisata alamnya yang sangat menakjubkan, di sini kita juga bisa menikmati berbagai macam wahana seru sambil menghirup sejuknya udara diÊBandung Barat.', NULL, '', 3, 45, 275, '', 0, '(022) 61005867\r', '7.000', '7.000'),
(77, 'The lodge maribaya', '-6.8290520', '107.6879360', 'Jalan Maribaya No. 149/252, RT. 03 / RW. 15', 'The Lodge Maribaya adalah salah satu tempat wisata di 46 yang menawarkan berbagai hal pada pengunjung. Disini kita bisa melakukan berbagai akitivitas seperti camping, trekking mengelilingi area hutan pinus yang indah, acara gathering dan team building, atau bahkan hanya sekedar refreshing menikmati kuliner.', NULL, '', 3, 46, 292, '', 0, '(022) 20454830\r', '25.000', '15.000'),
(78, 'Wana Wisata Pasir Ipis', '-6.7993740', '107.6187610', 'Jl. Pasir Ipis', 'Bandung memiliki satu lagi destinasi wisata alam yang belum banyak dikunjungi dengan memiliki pemandangan hutan pinus Gunung Tangkuban Parahu. Namanya Wana Wisata Pasir Ipis, disini anda bisa menikmati alam terbuka dengan pemandangan ribuan pohon pinus yang menjulang di sekitar wilayah ini.', NULL, '', 3, 46, 287, '', 0, '0857-3262-7120\r', '10.000', '10.000'),
(79, 'Gunung tangkuban perahu', '-6.7596380', '107.6097810', 'Jl.Raya Tangkuban Perahu Lembang', 'Tangkuban Parahu atau Gunung Tangkuban Perahu adalah salah satu gunung yang terletak di Provinsi Jawa Barat, Indonesia. Sekitar 20 km ke arah utara Kota Bandung, dengan rimbun pohon pinus dan hamparan kebun teh di sekitarnya, Gunung Tangkuban Perahu mempunyai ketinggian setinggi 2.084 meter', NULL, '', 3, 46, 285, '', 0, '022-6071383\r', '30.000', '20.000'),
(80, 'Situ Patenggang', '-7.1669650', '107.3575340', 'Jln 50 Ranca Bali', 'Situ Patenggang atau Situ Patengan adalah suatu danau yang terletak di kawasan objek wisata alam Bandung Selatan, Jawa Barat, Indonesia, tepatnya di 50. Terletak di ketinggian 1600 meter di atas permukaan laut, danau ini memiliki pemandangan yang sangat eksotik. Situ patenggang juga memiliki pemandangan alam yang asri, karena disekitarnya terdapat hamparan kebun teh.', NULL, '', 4, 51, 336, '', 0, '081323739973\r', '20.500', '18.000'),
(81, 'Kawah Putih', '-7.1662040', '107.4021260', ' Jl. Raya Soreang 50', 'Kawah Putih Bandung adalah sebuah kawah yang dihasilkan dari letusan Gunung Patuha. Nama Kawah Putih merujuk pada tanah yang notabene berwarna putih. Warna putih tanah tersebut disebabkan oleh beberapa unsur yang bercampur dengan belerang. Yang unik dari kawah ini adalah air yang dimilikinya, dimana air di dalam kawah tidaklah berwarna bening melainkan berwarna putih kehijauan. Salah satu tempat wisata di bandung itu airnya dapat berubah ubah sesuai dengan kadar belerang, suhu, dan cuaca yang terjadi pada saat itu.', NULL, '', 4, 50, 338, '', 0, '081323739973\r', '18.000', '18.000'),
(82, 'Kampung Cai', '-7.1384990', '107.3920280', 'Jl. Raya 50 KM 11', 'Kampung Cai Ranca Upas adalah salah satu bumi perkemahan di Bandung. Memiliki luas area sekitar 215 Hektar, berada pada 1700 meter di atas permukaan laut, dengan suhu udara sekitar 17 °C - 20 °C. Sekitar area, oleh hutan lindung dengan beragam flora seperti Pohon Huru, Hamirug, Jamuju, Kihujan, Kitambang, Kurai, Pasang dan Puspa. Sedangkan fauna terdiri dari beragam jenis burung, serta beberapa satwa jinak lainnya', NULL, '', 4, 50, 337, '', 0, '02285920070\r', '15.000', '15.000'),
(83, 'Gunung Puntang', '-7.1213890', '107.6211110', 'Jl. Gunung Puntang', 'Gunung Puntang juga dikenal dengan nama Bumi Perkemahan Gunung Puntang, objek wisata alam Bandung satu ini juga menjadi tempat perkemahan. Gunung Puntang sendiri memiliki ketinggian 2223 mdpl, sedangkan kawasan bumi perkemahan berada di ketinggian sekitar 1300 mdpl, yang menjadikan udara dikawasan Bumi Perkemahan sangat sejuk dan segar. ', NULL, '', 4, 53, 352, '', 0, '081312192434\r', '15.000', '15.000'),
(84, 'Emte Highland Resort', '-7.1404920', '107.3972680', 'Jl. Raya 50', 'eMTe Highland Resort 50 Bandung merupakan salah satu resort ternama karena berada di wilayah pegunungan 50 yang sejuk dan asri. Resort ini dapat anda jadikan alternatif pilihan untuk bermalam sekaligus menikmati indahnya pemandangan alam 50 yang mempesona.', NULL, '', 4, 51, 336, '', 0, '081320677430\r', '15.000', '15.000'),
(85, 'Kawah Rengganis', '-7.1723520', '107.3768530', 'Jl 51', 'Kawah Rengganis menawarkan pemandangan alam yang indah. Disini para wisatawan bisa menikmati eksotisme sebuah kawah yang terbentuk dari proses alam meletusnya gunung Sunda purba, jutaan tahun yang lalu. Di Kawah Rengganis ini, salah satu daya tarik lainnya adalah adanya air panas di danau yang bisa dimanfaatkan untuk berendam. Kawah Rengganis berlokasi di Jalan 51, Patengan, Kabupaten Bandung.', NULL, '', 4, 51, 336, '', 0, '0\r', '5.000', '5.000'),
(86, 'Perkebunan Teh 51', '-7.1499770', '107.3813460', 'Jl Sindangsirna No 4', 'Perkebunan Teh 51 berada di perlintasan jalan dari Kawah Putih ke Situ Patenggang. Disini para wisatawan bisa menikmati eksotisme pemandangan alam yang hijau dan luas. Jika Kamu akan mengunjungi tempat ini, jangan lupa untuk membawa pakaian hangatnya karena perkebunan Teh 51 berada di atas ketinggian 1.629 meter di atas permukaan air, yang membuat udara di kawasan ini sangat dingin.', NULL, '', 4, 51, 336, '', 0, '02222038966\r', '5.000', '5.000'),
(87, 'Pemandian Air Panas Ciwalini', '-7.1440340', '107.3849260', 'Jl. Raya 50', 'Dikelilingi hamparan pegunungan yang indah, Pemandian Air Panas Ciwalini memiliki 2 kolam renang yang bisa dinikmati para wisatawan. Ada kolam umum, dan ada kolam khusus yang untuk Kamu yang menginginkan suasana lebih tenang dan nyaman. Disini juga ada beberapa fasilitas pendukung lainnya seperti flying fox, ATV Ride, penyewaan sepeda, dan lain-lain.', NULL, '', 4, 51, 336, '', 0, '0\r', '23.500', '16.000'),
(88, 'Ranca Upas Smart Camp Adventure', '-7.1428080', '107.3924260', 'Jl. Raya 50', 'Ranca Upas Smart Camp Adventure merupakan sebuah tempat wisata sebuah perkemahan. Disini para wisatawan bisa melakukan aktivitas camping, jambore, dan lainnya. Lokasi ini juga menjadi salah satu kawasan konservasi hewan Rusa yang menjadi daya tarik para wisatawan untuk berkunjung kesini.', NULL, '', 4, 51, 336, '', 0, '0227808996\r', '10.000', '10.000'),
(89, '50 Valley Resort', '-7.1348300', '107.4163030', 'Jl. Raya Barutunggul Km.17', '50 Valley Water Hot Spring and Resort merupakan objek wisata terbaru yang berada di kawasan 50.  Objek wisata yang baru beroperasi setahun belakangan ini menyediakan fasilitas lengkap yang ramah anak dengan panorama menawan.', NULL, '', 4, 50, 337, '', 0, '02285920222\r', '40.000', '40.000'),
(90, 'Barusen Hills', '-7.1181910', '107.4999230', 'Jl. 50 Margamulya', 'Barusen Hills menjadi salah satu tempat wisata instagramable di wilayah Bandung Selatan. Barusen Hills menghadirkan pemandangan alam khas pegunungan yang hijau dan sangat indah. Beberapa fasilitas menarik bisa ditemui disini, seperti wisata petualangan, tempat bermain anak, kolam renang,, serta Villa Barusen Hills.', NULL, '', 4, 52, 341, '', 0, '08132153447\r', '35.000', '25.000'),
(91, 'Bukit Jamur', '-7.1951100', '107.4312810', '', 'Bukit Jamur merupakan sebuah areal perbukitan setengah lingkaran yang menyerupai semacam taman. Disini banyak ditanami sejenis pohon cemara kerdil yang menyerupai tanaman jamur payung. Tempat ini cocok sebagai tempat istirahat sejenak ketika Kamu sedang menikmati perjalanan di Bandung Selatan.', NULL, '', 4, 50, 55, '', 0, '0\r', 'Gratis', 'Gratis'),
(92, 'Pemandian Air Panas Cimanggu', '-7.1471530', '107.3901420', 'Jl. Raya 50 Patenggang, KM 13', 'Pemandian Air Panas Cimanggu merupakan tempat wisata pemandian air panas yang terletak di 50. Tempat ini sudah menjadi salah satu detinasi para wisatawan', NULL, '', 4, 51, 336, '', 0, '083820856055\r', '23.500', '16.000'),
(93, 'Glamping Lakeside Pinisi Resto', '-7.1670160', '107.3542100', 'Jl. Raya 50', 'Glamping Lakeside Pinisi Resto adalah salah satu tempat wisata bandung yang menawarkan keindahan alam terbuka dengan view pemandangan langsung ke danau situ patenggang. Tempat wisata bandung yang satu ini bisa tergolong masih baru dan letaknya masih bersebelahan dengan Tempat Wisata Situ Patenggang', NULL, '', 4, 51, 336, '', 0, '02285924493\r', '20.000', '20.000'),
(94, 'Taman Air Situ Lembang', '-7.1499620', '107.3758780', '', 'Taman air situ lembang merupakan tempat wisata yang menyuguhkan pemandangan danau', NULL, '', 4, 51, 337, '', 0, '0\r', '5.000', '5.000'),
(95, 'Taman Kelinci 50', '-7.1151210', '107.4378710', 'Jl. Raya 50 51 KM 33.7', 'Taman Kelinci di 50 adalah tempat wisata edukasi untuk keluarga dengan fokus pada hewan Kelinci. Di sini terdapat beraneka jenis kelinci. Tercatat ada dari 100 ekor yang ada 50 adalah jenis lokal dan sisanya jenis kelinci luar seperti Lion Head, Dutch, Rex, New Zealand white dan masih banyak yang lainnya.', NULL, '', 4, 51, 374, '', 0, '02285920160\r', '15.000', '15.000'),
(96, 'Bukit Artapela', '-7.1773750', '107.6483050', '', 'Gunung Artapela Berada di ketinggian 2.194 mdpl, Artapela merupakan gunung tropis yang sudah tidak aktif lagi. Lokasinya berada di Kertasari berbatasan dengan Kecamatan Pangalengan, Kabupaten Bandung.', NULL, '', 4, 55, 377, '', 0, '0\r', '5.000', '5.000'),
(97, 'Situ Cisanti', '-7.2084000', '107.6576020', '', 'Situ Cisanti adalah danau buatan yang menampung air dari 7 mata air utama Sungai Citarum. Yakni mata air Pangsiraman, Cikolebere, Cikawadukan, Cikahuripan, Cisadana, Cihaniwung, dan Cisanti.[1] terletak di Tarumajaya, Kertasari, Bandung dengan luas kurang lebih sekitar 5 hektar dan berada di lahan seluas 7 hektar di kawasan perhutani, kaki Gunung Wayang, dengan ketinggian 1.500–3.000 dpl. Kedalaman situ ini sampai sekarang masih belum ada yang tahu persis berapa meter kedalamannya.', NULL, '', 4, 55, 373, '', 0, '0\r', '10.000', '10.000'),
(98, 'Taman Bougenville', '-7.1107920', '107.6019950', 'Jl. Gunung Puntang', 'Taman Bougenville adalah Resort rekreasi yang berhawa sejuk, terletak di kaki Gunung Puntang. Nikmati suasana alam dengan hutan pegunungan, sawah, ladang yang memberikan nuansa asri', NULL, '', 4, 53, 352, '', 0, '08119102003\r', '35.000', '35.000'),
(99, 'Situ Cileunca', '-7.1933330', '107.5505560', '', 'Situ Cileunca yang berlokasi di Warnasari, Pangalengan, Bandung, Jawa Barat adalah sebuah danau buatan dengan luas mencapai 1.400 hektar dengan latar belakang perbukitan dan pegunungan yang indah. Selain difungsikan sebagai objek wisata, Situ Cileunca juga berfungsi sebagai pembangkit listrik tenaga air (PLTA). Air yang berasal dari danau tersebut dialirkan melalui Sungai Palayangan. Sungai ini pula yang sering dijadikan sebagai arena ber-arung jeram.Kedalaman danau mencapai 17 meter, dan sebelum tahun 1918, ini merupakan hutan belantara yang kemudian diubah menjadi situ, yang berfungsi melayani kebutuhan air masyarakat.', NULL, '', 4, 55, 373, '', 0, '0\r', '5.000', '5.000'),
(100, 'Gunung Rakutak', '-7.1475000', '107.7341670', '', 'Gunung rakutak adalah sebuah gunung yang terletak di kecamatan pancet lebih tepat nya di desa sukarame ,kabupaten bandungjawa barat yang memiliki ketinggian 1922 meter di atas permukaan laut, Gunung Rakutak termasuk kedalam kawasan Cagar Alam Kamojang sesuai Keputusan Menteri Pertanian Nomor: 170/KptsUm/3/1979, penunjukan Cagar Alam Kawah Kamojang seluas 7.500 Ha dan Taman Wisata Alam Kawah Kamojang seluas 500 Ha.', NULL, '', 4, 56, 383, '', 0, '0\r', '10.000', '10.000'),
(101, 'Cibolang Hot Spring Water', '-7.2321140', '107.6169750', '', 'Cibolang Hot Spring Water merupakan sebuah lokasi wisata yang terletak di dataran tinggi pegunungan bandung selatan yaitu dengan ketinggian 1.000 – 1.400 mdpl dengan luas hampir 2 hektar.', NULL, '', 4, 54, 370, '', 0, '0\r', '10.000', '10.000'),
(102, 'Curug Panganten', '-7.1758890', '106.5227870', '', 'Curug Panganten adalah salah satu air terjun Dinamai Curug Panganten adalah karena bentuknya yang memiliki dua aliran air terjun yang saling berdampingan', NULL, '', 4, 54, 368, '', 0, '0\r', 'Gratis', 'Gratis'),
(103, 'Hutan Pinus Rahong', '-7.1807040', '107.5470130', '', 'Hutan Pinus Rahong adalah sebuah hutan pinus yang berada di kawasan Pangalengan. Hutan Pinus Rahong ini selain berfungsi sebagai resapan air, berfungsi juga sebagai sumber penghasil getah pinus. Getah pinus banyak keguaannya, mulai dari sektor industri, hingga kesehatan. Hutan Pinus Rahong ini berada di pinggir jalan raya utama Rahong. Jadi saat kita berkendara, maka kita sudah bisa melihat keindahan dari hutan pinus pinggir jalan ini.', NULL, '', 4, 54, 363, '', 0, '0\r', 'Gratis', 'Gratis'),
(104, 'Perkebunan Teh Malabar', '-7.2227520', '107.5851080', 'Jl. Sindangsirna No. 4', 'Perkebunan teh Malabar merupakan perkebunan teh yang luas dengan hamparan hijau tanaman teh bagai hamparan permadani hijau. Dengan luas wilayah sekitar 2.022 hektar, area perkebunan ini begitu indah dengan pemandangan perkebunan teh yang tak kunjung habis.', NULL, '', 4, 54, 359, '', 0, '085320371164\r', '2.000', '2.000');

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas`
--

CREATE TABLE `fasilitas` (
  `id` int(11) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `harga` int(11) DEFAULT NULL,
  `keterangan` varchar(225) NOT NULL,
  `id_wisata` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gambar`
--

CREATE TABLE `gambar` (
  `id` int(11) NOT NULL,
  `url` varchar(225) NOT NULL,
  `id_wisata` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kecamatan`
--

CREATE TABLE `kecamatan` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `id_kota` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kecamatan`
--

INSERT INTO `kecamatan` (`id`, `nama`, `id_kota`) VALUES
(1, 'BANDUNG KULON', 1),
(2, 'BABAKAN CIPARAY', 1),
(3, 'BOJONGLOA KALER', 1),
(4, 'BOJONGLOA KIDUL', 1),
(5, 'ASTANAANYAR', 1),
(6, 'REGOL', 1),
(7, 'LENGKONG', 1),
(8, 'BANDUNG KIDUL', 1),
(9, 'BUAHBATU', 1),
(10, 'RANCASARI', 1),
(11, 'GEDEBAGE', 1),
(12, 'CIBIRU', 1),
(13, 'PANYILEUKAN', 1),
(14, 'UJUNG BERUNG', 1),
(15, 'CINAMBO', 1),
(16, 'ARCAMANIK', 1),
(17, 'ANTAPANI', 1),
(18, 'MANDALAJATI', 1),
(19, 'KIARACONDONG', 1),
(20, 'BATUNUNGGAL', 1),
(21, 'SUMUR BANDUNG', 1),
(22, 'ANDIR', 1),
(23, 'CICENDO', 1),
(24, 'BANDUNG WETAN', 1),
(25, 'CIBEUNYING KIDUL', 1),
(26, 'CIBEUNYING KALER', 1),
(27, 'COBLONG', 1),
(28, 'SUKAJADI', 1),
(29, 'SUKASARI', 1),
(30, 'CIDADAP', 1),
(31, 'CIMAHI SELATAN', 2),
(32, 'CIMAHI TENGAH', 2),
(33, 'CIMAHI UTARA', 2),
(34, 'RONGGA', 3),
(35, 'GUNUNGHALU', 3),
(36, 'SINDANGKERTA', 3),
(37, 'CILILIN', 3),
(38, 'CIHAMPELAS', 3),
(39, 'CIPONGKOR', 3),
(40, 'BATUJAJAR', 3),
(41, 'SAGULING', 3),
(42, 'CIPATAT', 3),
(43, 'PADALARANG', 3),
(44, 'NGAMPRAH', 3),
(45, 'PARONGPONG', 3),
(46, 'LEMBANG', 3),
(47, 'CISARUA', 3),
(48, 'CIKALONG WETAN', 3),
(49, 'CIPEUNDEUY', 3),
(50, 'CIWIDEY', 4),
(51, 'RANCABALI', 4),
(52, 'PASIRJAMBU', 4),
(53, 'CIMAUNG', 4),
(54, 'PANGALENGAN', 4),
(55, 'KERTASARI', 4),
(56, 'PACET', 4),
(57, 'IBUN', 4),
(58, 'PASEH', 4),
(59, 'CIKANCUNG', 4),
(60, 'CICALENGKA', 4),
(61, 'NAGREG', 4),
(62, 'RANCAEKEK', 4),
(63, 'MAJALAYA', 4),
(64, 'SOLOKAN JERUK', 4),
(65, 'CIPARAY', 4),
(66, 'BALEENDAH', 4),
(67, 'ARJASARI', 4),
(68, 'BANJARAN', 4),
(69, 'CANGKUANG', 4),
(70, 'PAMEUNGPEUK', 4),
(71, 'KATAPANG', 4),
(72, 'SOREANG', 4),
(73, 'KUTAWARINGIN', 4),
(74, 'MARGAASIH', 4),
(75, 'MARGAHAYU', 4),
(76, 'DAYEUHKOLOT', 4),
(77, 'BOJONGSOANG', 4),
(78, 'CILEUNYI', 4),
(79, 'CILENGKRANG', 4),
(80, 'CIMENYAN', 4);

-- --------------------------------------------------------

--
-- Table structure for table `kelurahan`
--

CREATE TABLE `kelurahan` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `id_kecamatan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelurahan`
--

INSERT INTO `kelurahan` (`id`, `nama`, `id_kecamatan`) VALUES
(1, 'GEMPOL SARI', 1),
(2, 'CIGONDEWAH KALER', 1),
(3, 'CIGONDEWAH KIDUL', 1),
(4, 'CIGONDEWAH RAHAYU', 1),
(5, 'CARINGIN', 1),
(6, 'WARUNG MUNCANG', 1),
(7, 'CIBUNTU', 1),
(8, 'CIJERAH', 1),
(9, 'MARGASUKA', 2),
(10, 'CIRANGRANG', 2),
(11, 'MARGAHAYU UTARA', 2),
(12, 'BABAKAN CIPARAY', 2),
(13, 'BABAKAN', 2),
(14, 'SUKAHAJI', 2),
(15, 'KOPO', 3),
(16, 'SUKA ASIH', 3),
(17, 'BABAKAN ASIH', 3),
(18, 'BABAKAN TAROGONG', 3),
(19, 'JAMIKA', 3),
(20, 'CIBADUYUT KIDUL', 4),
(21, 'CIBADUYUT WETAN', 4),
(22, 'MEKAR WANGI', 4),
(23, 'CIBADUYUT', 4),
(24, 'KEBON LEGA', 4),
(25, 'SITUSAEUR', 4),
(26, 'KARASAK', 5),
(27, 'PELINDUNG HEWAN', 5),
(28, 'PANJUNAN', 5),
(29, 'CIBADAK', 5),
(30, 'KARANG ANYAR', 5),
(31, 'CISEUREUH', 6),
(32, 'PASIRLUYU', 6),
(33, 'ANCOL', 6),
(34, 'CIGERELENG', 6),
(35, 'CIATEUL', 6),
(36, 'BALONG GEDE', 6),
(37, 'CIJAGRA', 7),
(38, 'TURANGGA', 7),
(39, 'LINGKAR SELATAN', 7),
(40, 'MALABAR', 7),
(41, 'BURANGRANG', 7),
(42, 'CIKAWAO', 7),
(43, 'PALEDANG', 7),
(44, 'WATES', 8),
(45, 'BATUNUNGGAL', 8),
(46, 'KUJANGSARI', 8),
(47, 'CIJAURA', 9),
(48, 'MARGASARI', 9),
(49, 'SEKEJATI', 9),
(50, 'JATI SARI', 9),
(51, 'DERWATI', 10),
(52, 'CIPAMOKOLAN', 10),
(53, 'MANJAHLEGA', 10),
(54, 'MEKARJAYA', 10),
(55, 'RANCABOLANG', 11),
(56, 'RANCANUMPANG', 11),
(57, 'CISARANTEN KIDUL', 11),
(58, 'CIMINCRANG', 11),
(59, 'PASIR BIRU', 12),
(60, 'CIPADUNG', 12),
(61, 'PALASARI', 12),
(62, 'CISURUPAN', 12),
(63, 'MEKAR MULYA', 13),
(64, 'CIPADUNG KIDUL', 13),
(65, 'CIPADUNG WETAN', 13),
(66, 'CIPADUNG KULON', 13),
(67, 'PASANGGRAHAN', 14),
(68, 'PASIRJATI', 14),
(69, 'PASIR WANGI', 14),
(70, 'CIGENDING', 14),
(71, 'PASIR ENDAH', 14),
(72, 'CISARANTEN WETAN', 15),
(73, 'BABAKAN PENGHULU', 15),
(74, 'PAKEMITAN', 15),
(75, 'SUKAMULYA', 15),
(76, 'CISARANTEN KULON', 16),
(77, 'CISARANTEN BINA HARAPAN', 16),
(78, 'SUKAMISKIN', 16),
(79, 'CISARANTEN ENDAH', 16),
(80, 'ANTAPANI KIDUL', 17),
(81, 'ANTAPANI TENGAH', 17),
(82, 'ANTAPANI WETAN', 17),
(83, 'ANTAPANI KULON', 17),
(84, 'JATIHANDAP', 18),
(85, 'KARANG PAMULANG', 18),
(86, 'SINDANG JAYA', 18),
(87, 'PASIR IMPUN', 18),
(88, 'KEBON KANGKUNG', 19),
(89, 'SUKAPURA', 19),
(90, 'KEBUN JAYANTI', 19),
(91, 'BABAKAN SARI', 19),
(92, 'BABAKAN SURABAYA', 19),
(93, 'CICAHEUM', 19),
(94, 'BINONG', 20),
(95, 'KEBON GEDANG', 20),
(96, 'MALEER', 20),
(97, 'CIBANGKONG', 20),
(98, 'SAMOJA', 20),
(99, 'KACAPIRING', 20),
(100, 'KEBON WARU', 20),
(101, 'BRAGA', 21),
(102, 'KEBON PISANG', 21),
(103, 'MERDEKA', 21),
(104, 'BABAKAN CIAMIS', 21),
(105, 'CAMPAKA', 22),
(106, 'MALEBER', 22),
(107, 'GARUDA', 22),
(108, 'DUNGUS CARIANG', 22),
(109, 'CIROYOM', 22),
(110, 'KEBON JERUK', 22),
(111, 'ARJUNA', 23),
(112, 'PASIRKALIKI', 23),
(113, 'PAMOYANAN', 23),
(114, 'PAJAJARAN', 23),
(115, 'HUSEN SASTRANEGARA', 23),
(116, 'SUKARAJA', 23),
(117, 'TAMAN SARI', 24),
(118, 'CITARUM', 24),
(119, 'CIHAPIT', 24),
(120, 'SUKAMAJU', 25),
(121, 'CICADAS', 25),
(122, 'CIKUTRA', 25),
(123, 'PADASUKA', 25),
(124, 'PASIRLAYUNG', 25),
(125, 'SUKAPADA', 25),
(126, 'CIHAURGEULIS', 26),
(127, 'SUKALUYU', 26),
(128, 'NEGLASARI', 26),
(129, 'CIGADUNG', 26),
(130, 'CIPAGANTI', 27),
(131, 'LEBAK SILIWANGI', 27),
(132, 'LEBAK GEDE', 27),
(133, 'SADANG SERANG', 27),
(134, 'SEKELOA', 27),
(135, 'DAGO', 27),
(136, 'SUKAWARNA', 28),
(137, 'SUKAGALIH', 28),
(138, 'SUKABUNGAH', 28),
(139, 'CIPEDES', 28),
(140, 'PASTEUR', 28),
(141, 'SARIJADI', 29),
(142, 'SUKARASA', 29),
(143, 'GEGERKALONG', 29),
(144, 'ISOLA', 29),
(145, 'HEGARMANAH', 30),
(146, 'CIUMBULEUIT', 30),
(147, 'MELONG', 31),
(148, 'CIBEUREUM', 31),
(149, 'UTAMA', 31),
(150, 'LEUWIGAJAH', 31),
(151, 'CIBEBER', 31),
(152, 'BAROS', 32),
(153, 'CIGUGUR TENGAH', 32),
(154, 'KARANGMEKAR', 32),
(155, 'SETIAMANAH', 32),
(156, 'PADASUKA', 32),
(157, 'CIMAHI', 32),
(158, 'PASIRKALIKI', 33),
(159, 'CIBABAT', 33),
(160, 'CITEUREUP', 33),
(161, 'CIPAGERAN', 33),
(162, 'CICADAS', 34),
(163, 'CIBEDUG', 34),
(164, 'SUKAMANAH', 34),
(165, 'BOJONG', 34),
(166, 'BOJONGSALAM', 34),
(167, 'CINENGAH', 34),
(168, 'SUKARESMI', 34),
(169, 'CIBITUNG', 34),
(170, 'CILANGARI', 35),
(171, 'SINDANGJAYA', 35),
(172, 'BUNIJAYA', 35),
(173, 'SIRNAJAYA', 35),
(174, 'GUNUNGHALU', 35),
(175, 'CELAK', 35),
(176, 'WARGASALUYU', 35),
(177, 'SUKASARI', 35),
(178, 'TAMANJAYA', 35),
(179, 'MEKARWANGI', 36),
(180, 'WENINGGALIH', 36),
(181, 'WANGUNSARI', 36),
(182, 'BUNINAGARA', 36),
(183, 'CIKADU', 36),
(184, 'RANCA SENGGANG', 36),
(185, 'CINTAKARYA', 36),
(186, 'CICANGKANG GIRANG', 36),
(187, 'PUNCAKSARI', 36),
(188, 'PASIRPOGOR', 36),
(189, 'SINDANGKERTA', 36),
(190, 'KARYAMUKTI', 37),
(191, 'NANGGERANG', 37),
(192, 'MUKAPAYUNG', 37),
(193, 'RANCAPANGGUNG', 37),
(194, 'BONGAS', 37),
(195, 'BATULAYANG', 37),
(196, 'CILILIN', 37),
(197, 'KARANGTANJUNG', 37),
(198, 'KIDANGPANANJUNG', 37),
(199, 'BUDIHARJA', 37),
(200, 'KARANGANYAR', 37),
(201, 'SINGAJAYA', 38),
(202, 'TANJUNGWANGI', 38),
(203, 'SITUWANGI', 38),
(204, 'PATARUMAN', 38),
(205, 'CIPATIK', 38),
(206, 'CITAPEN', 38),
(207, 'CIHAMPELAS', 38),
(208, 'MEKARMUKTI', 38),
(209, 'TANJUNGJAYA', 38),
(210, 'MEKARJAYA', 38),
(211, 'CINTAASIH', 39),
(212, 'KARANGSARI', 39),
(213, 'NEGLASARI', 39),
(214, 'GIRIMUKTI', 39),
(215, 'CIJENUK', 39),
(216, 'CICANGKANG HILIR', 39),
(217, 'SUKAMULYA', 39),
(218, 'CITALEM', 39),
(219, 'MEKARSARI', 39),
(220, 'SARINAGEN', 39),
(221, 'CIBENDA', 39),
(222, 'CIJAMBU', 39),
(223, 'SIRNAGALIH', 39),
(224, 'BARANANGSIANG', 39),
(225, 'SELACAU', 40),
(226, 'BATUJAJAR BARAT', 40),
(227, 'BATUJAJAR TIMUR', 40),
(228, 'GIRIASIH', 40),
(229, 'GALANGGANG', 40),
(230, 'PANGAUBAN', 40),
(231, 'CANGKORAH', 40),
(232, 'BOJONGHALEUANG', 41),
(233, 'CIKANDE', 41),
(234, 'GIRIMUKTI', 41),
(235, 'CIPANGERAN', 41),
(236, 'JATI', 41),
(237, 'SAGULING', 41),
(238, 'RAJAMANDALA KULON', 42),
(239, 'CIPTAHARJA', 42),
(240, 'CIPATAT', 42),
(241, 'CITATAH', 42),
(242, 'GUNUNGMASIGIT', 42),
(243, 'CIRAWAMEKAR', 42),
(244, 'NYALINDUNG', 42),
(245, 'SUMURBANDUNG', 42),
(246, 'KERTAMUKTI', 42),
(247, 'SARIMUKTI', 42),
(248, 'MANDALASARI', 42),
(249, 'MANDALAWANGI', 42),
(250, 'LAKSANAMEKAR', 43),
(251, 'CIMERANG', 43),
(252, 'CIPEUNDEUY', 43),
(253, 'KERTAJAYA', 43),
(254, 'JAYAMEKAR', 43),
(255, 'PADALARANG', 43),
(256, 'KERTAMULYA', 43),
(257, 'CIBURUY', 43),
(258, 'TAGOGAPU', 43),
(259, 'CEMPAKAMEKAR', 43),
(260, 'CIMAREME', 44),
(261, 'GADOBANGKONG', 44),
(262, 'TANIMULYA', 44),
(263, 'PAKUHAJI', 44),
(264, 'CILAME', 44),
(265, 'MARGAJAYA', 44),
(266, 'MEKARSARI', 44),
(267, 'NGAMPRAH', 44),
(268, 'SUKATANI', 44),
(269, 'CIMANGGU', 44),
(270, 'BOJONGKONENG', 44),
(271, 'CIWARUGA', 45),
(272, 'CIHIDEUNG', 45),
(273, 'CIGUGUR GIRANG', 45),
(274, 'SARIWANGI', 45),
(275, 'CIHANJUANG', 45),
(276, 'CIHANJUANG RAHAYU', 45),
(277, 'KARYAWANGI', 45),
(278, 'GUDANGKAHURIPAN', 46),
(279, 'WANGUNSARI', 46),
(280, 'PAGERWANGI', 46),
(281, 'MEKARWANGI', 46),
(282, 'LANGENSARI', 46),
(283, 'KAYUAMBON', 46),
(284, 'LEMBANG', 46),
(285, 'CIKAHURIPAN', 46),
(286, 'SUKAJAYA', 46),
(287, 'JAYAGIRI', 46),
(288, 'CIBOGO', 46),
(289, 'CIKOLE', 46),
(290, 'CIKIDANG', 46),
(291, 'WANGUNHARJA', 46),
(292, 'CIBODAS', 46),
(293, 'SUNTENJAYA', 46),
(294, 'PASIRHALANG', 47),
(295, 'JAMBUDIPA', 47),
(296, 'PADAASIH', 47),
(297, 'KERTAWANGI', 47),
(298, 'TUGUMUKTI', 47),
(299, 'PASIRLANGU', 47),
(300, 'CIPADA', 47),
(301, 'SADANGMEKAR', 47),
(302, 'KANANGASARI', 48),
(303, 'MANDALASARI', 48),
(304, 'MEKARJAYA', 48),
(305, 'CIPADA', 48),
(306, 'GANJARSARI', 48),
(307, 'MANDALAMUKTI', 48),
(308, 'CIPTAGUMATI', 48),
(309, 'CIKALONG', 48),
(310, 'PUTERAN', 48),
(311, 'TENJOLAUT', 48),
(312, 'CISOMANG BARAT', 48),
(313, 'WANGUNJAYA', 48),
(314, 'MARGALUYU', 49),
(315, 'NANGGELENG', 49),
(316, 'SIRNARAJA', 49),
(317, 'JATIMEKAR', 49),
(318, 'BOJONGMEKAR', 49),
(319, 'NYENANG', 49),
(320, 'CIPEUNDEUY', 49),
(321, 'MARGALAKSANA', 49),
(322, 'SUKAHAJI', 49),
(323, 'CIHARASHAS', 49),
(324, 'SIRNAGALIH', 49),
(325, 'CIROYOM', 49),
(326, 'PANUNDAAN', 50),
(327, 'CIWIDEY', 50),
(328, 'PANYOCOKAN', 50),
(329, 'LEBAKMUNCANG', 50),
(330, 'RAWABOGO', 50),
(331, 'NENGKELAN', 50),
(332, 'SUKAWENING', 50),
(333, 'CIPELAH', 51),
(334, 'SUKARESMI', 51),
(335, 'INDRAGIRI', 51),
(336, 'PATENGAN', 51),
(337, 'ALAMENDAH', 51),
(338, 'SUGIHMUKTI', 52),
(339, 'MARGAMULYA', 52),
(340, 'TENJOLAYA', 52),
(341, 'CISONDARI', 52),
(342, 'MEKARSARI', 52),
(343, 'CIBODAS', 52),
(344, 'CUKANGGENTENG', 52),
(345, 'PASIRJAMBU', 52),
(346, 'MEKARMAJU', 52),
(347, 'CIKONENG', 52),
(348, 'CIKALONG', 53),
(349, 'MEKARSARI', 53),
(350, 'CIPINANG', 53),
(351, 'CIMAUNG', 53),
(352, 'CAMPAKAMULYA', 53),
(353, 'PASIRHUNI', 53),
(354, 'JAGABAYA', 53),
(355, 'MALASARI', 53),
(356, 'SUKAMAJU', 53),
(357, 'WARJABAKTI', 53),
(358, 'WANASUKA', 54),
(359, 'BANJARSARI', 54),
(360, 'MARGALUYU', 54),
(361, 'SUKALUYU', 54),
(362, 'WARNASARI', 54),
(363, 'PULOSARI', 54),
(364, 'MARGAMEKAR', 54),
(365, 'SUKAMANAH', 54),
(366, 'MARGAMUKTI', 54),
(367, 'PANGALENGAN', 54),
(368, 'MARGAMULYA', 54),
(369, 'TRIBAKTIMULYA', 54),
(370, 'LAMAJANG', 54),
(371, 'NEGLAWANGI', 55),
(372, 'SANTOSA', 55),
(373, 'TARUMAJAYA', 55),
(374, 'CIKEMBANG', 55),
(375, 'CIBEUREUM', 55),
(376, 'CIHAWUK', 55),
(377, 'SUKAPURA', 55),
(378, 'RESMI TINGGAL', 55),
(379, 'CIKITU', 56),
(380, 'GIRIMULYA', 56),
(381, 'SUKARAME', 56),
(382, 'CIKAWAO', 56),
(383, 'NAGRAK', 56),
(384, 'MANDALAHAJI', 56),
(385, 'MARUYUNG', 56),
(386, 'PANGAUBAN', 56),
(387, 'CINANGGELA', 56),
(388, 'MEKARJAYA', 56),
(389, 'MEKARSARI', 56),
(390, 'CIPEUJEUH', 56),
(391, 'TANJUNGWANGI', 56),
(392, 'NEGLASARI', 57),
(393, 'IBUN', 57),
(394, 'LAKSANA', 57),
(395, 'MEKARWANGI', 57),
(396, 'SUDI', 57),
(397, 'CIBEET', 57),
(398, 'PANGGUH', 57),
(399, 'KARYALAKSANA', 57),
(400, 'LAMPEGAN', 57),
(401, 'TALUN', 57),
(402, 'TANGGULUN', 57),
(403, 'LOA', 58),
(404, 'DRAWATI', 58),
(405, 'CIPAKU', 58),
(406, 'SINDANGSARI', 58),
(407, 'SUKAMANTRI', 58),
(408, 'SUKAMANAH', 58),
(409, 'MEKARPAWITAN', 58),
(410, 'CIJAGRA', 58),
(411, 'TANGSIMEKAR', 58),
(412, 'CIPEDES', 58),
(413, 'KARANGTUNGGAL', 58),
(414, 'CIGENTUR', 58),
(415, 'SRIRAHAYU', 59),
(416, 'CILULUK', 59),
(417, 'MEKARLAKSANA', 59),
(418, 'CIHANYIR', 59),
(419, 'CIKANCUNG', 59),
(420, 'MANDALASARI', 59),
(421, 'HEGARMANAH', 59),
(422, 'CIKASUNGKA', 59),
(423, 'TANJUNGLAYA', 59),
(424, 'NAGROG', 60),
(425, 'NARAWITA', 60),
(426, 'MARGAASIH', 60),
(427, 'CICALENGKA WETAN', 60),
(428, 'CIKUYA', 60),
(429, 'WALUYA', 60),
(430, 'PANENJOAN', 60),
(431, 'TENJOLAYA', 60),
(432, 'CICALENGKA KULON', 60),
(433, 'BABAKANPEUTEUY', 60),
(434, 'DAMPIT', 60),
(435, 'TANJUNGWANGI', 60),
(436, 'MANDALAWANGI', 61),
(437, 'BOJONG', 61),
(438, 'CIHERANG', 61),
(439, 'CIARO', 61),
(440, 'NAGREG', 61),
(441, 'CITAMAN', 61),
(442, 'NAGREG KENDAN', 61),
(443, 'GANJAR SABAR', 61),
(444, 'SUKAMANAH', 62),
(445, 'TEGALSUMEDANG', 62),
(446, 'RANCAEKEK KULON', 62),
(447, 'RANCAEKEK WETAN', 62),
(448, 'BOJONGLOA', 62),
(449, 'JELEGONG', 62),
(450, 'LINGGAR', 62),
(451, 'SUKAMULYA', 62),
(452, 'HAURPUGUR', 62),
(453, 'SANGIANG', 62),
(454, 'BOJONGSALAM', 62),
(455, 'CANGKUANG', 62),
(456, 'NANJUNGMEKAR', 62),
(457, 'RANCAEKEK KENCANA', 62),
(458, 'NEGLASARI', 63),
(459, 'WANGISAGARA', 63),
(460, 'PADAMULYA', 63),
(461, 'SUKAMUKTI', 63),
(462, 'PADAULUN', 63),
(463, 'BIRU', 63),
(464, 'SUKAMAJU', 63),
(465, 'MAJASETRA', 63),
(466, 'MAJALAYA', 63),
(467, 'MAJAKERTA', 63),
(468, 'BOJONG', 63),
(469, 'PANYADAP', 64),
(470, 'PADAMUKTI', 64),
(471, 'CIBODAS', 64),
(472, 'LANGENSARI', 64),
(473, 'SOLOKANJERUK', 64),
(474, 'RANCAKASUMBA', 64),
(475, 'BOJONGEMAS', 64),
(476, 'BABAKAN', 65),
(477, 'CIKONENG', 65),
(478, 'SIGARACIPTA', 65),
(479, 'PAKUTANDANG', 65),
(480, 'MANGGUNGHARJA', 65),
(481, 'MEKARSARI', 65),
(482, 'CIPARAY', 65),
(483, 'SUMBERSARI', 65),
(484, 'SARIMAHI', 65),
(485, 'SERANGMEKAR', 65),
(486, 'GUNUNGLEUTIK', 65),
(487, 'CIHEULANG', 65),
(488, 'MEKARLAKSANA', 65),
(489, 'BUMIWANGI', 65),
(490, 'JELEKONG', 66),
(491, 'MANGGAHANG', 66),
(492, 'BALEENDAH', 66),
(493, 'ANDIR', 66),
(494, 'MALAKASARI', 66),
(495, 'BOJONGMALAKA', 66),
(496, 'RANCAMANYAR', 66),
(497, 'WARGAMEKAR', 66),
(498, 'BATUKARUT', 67),
(499, 'MANGUNJAYA', 67),
(500, 'MEKARJAYA', 67),
(501, 'BAROS', 67),
(502, 'LEBAKWANGI', 67),
(503, 'WARGALUYU', 67),
(504, 'ARJASARI', 67),
(505, 'PINGGIRSARI', 67),
(506, 'PATROLSARI', 67),
(507, 'RANCAKOLE', 67),
(508, 'ANCOLMEKAR', 67),
(509, 'MEKARJAYA', 68),
(510, 'BANJARAN WETAN', 68),
(511, 'CIAPUS', 68),
(512, 'SINDANGPANON', 68),
(513, 'NEGLASARI', 68),
(514, 'MARGAHURIP', 68),
(515, 'KIANGROKE', 68),
(516, 'KAMASAN', 68),
(517, 'BANJARAN', 68),
(518, 'TARAJUSARI', 68),
(519, 'PASIRMULYA', 68),
(520, 'JATISARI', 69),
(521, 'NAGRAK', 69),
(522, 'BANDASARI', 69),
(523, 'PANANJUNG', 69),
(524, 'CILUNCAT', 69),
(525, 'CANGKUANG', 69),
(526, 'TANJUNGSARI', 69),
(527, 'BOJONGMANGGU', 70),
(528, 'LANGONSARI', 70),
(529, 'SUKASARI', 70),
(530, 'RANCAMULYA', 70),
(531, 'RANCATUNGKU', 70),
(532, 'BOJONGKUNCI', 70),
(533, 'GANDASARI', 71),
(534, 'KATAPANG', 71),
(535, 'CILAMPENI', 71),
(536, 'PANGAUBAN', 71),
(537, 'BANYUSARI', 71),
(538, 'SANGKANHURIP', 71),
(539, 'SUKAMUKTI', 71),
(540, 'SADU', 72),
(541, 'SUKAJADI', 72),
(542, 'SUKANAGARA', 72),
(543, 'PANYIRAPAN', 72),
(544, 'KARAMATMULYA', 72),
(545, 'SOREANG', 72),
(546, 'PAMEKARAN', 72),
(547, 'PARUNGSERAB', 72),
(548, 'SEKARWANGI', 72),
(549, 'CINGCIN', 72),
(550, 'CILAME', 73),
(551, 'BUNINAGARA', 73),
(552, 'PADASUKA', 73),
(553, 'SUKAMULYA', 73),
(554, 'KUTAWARINGIN', 73),
(555, 'KOPO', 73),
(556, 'CIBODAS', 73),
(557, 'JATISARI', 73),
(558, 'JELEGONG', 73),
(559, 'GAJAHMEKAR', 73),
(560, 'PAMEUNTASAN', 73),
(561, 'NANJUNG', 74),
(562, 'MEKAR RAHAYU', 74),
(563, 'RAHAYU', 74),
(564, 'CIGONDEWAH HILIR', 74),
(565, 'MARGAASIH', 74),
(566, 'LAGADAR', 74),
(567, 'SULAEMAN', 75),
(568, 'SUKAMENAK', 75),
(569, 'SAYATI', 75),
(570, 'MARGAHAYU SELATAN', 75),
(571, 'MARGAHAYU TENGAH', 75),
(572, 'CANGKUANG KULON', 76),
(573, 'CANGKUANG WETAN', 76),
(574, 'PASAWAHAN', 76),
(575, 'DAYEUHKOLOT', 76),
(576, 'CITEUREUP', 76),
(577, 'SUKAPURA', 76),
(578, 'BOJONGSARI', 77),
(579, 'BOJONGSOANG', 77),
(580, 'LENGKONG', 77),
(581, 'CIPAGALO', 77),
(582, 'BUAHBATU', 77),
(583, 'TEGALLUAR', 77),
(584, 'CIBIRU HILIR', 78),
(585, 'CINUNUK', 78),
(586, 'CIMEKAR', 78),
(587, 'CILEUNYI KULON', 78),
(588, 'CILEUNYI WETAN', 78),
(589, 'CIBIRU WETAN', 78),
(590, 'GIRIMEKAR', 79),
(591, 'JATIENDAH', 79),
(592, 'MELATIWANGI', 79),
(593, 'CIPANJALU', 79),
(594, 'CIPOREAT', 79),
(595, 'CILENGKRANG', 79),
(596, 'CIBEUNYING', 80),
(597, 'PADASUKA', 80),
(598, 'MANDALAMEKAR', 80),
(599, 'CIKADUT', 80),
(600, 'SINDANGLAYA', 80),
(601, 'MEKARMANIK', 80),
(602, 'CIMENYAN', 80),
(603, 'MEKARSALUYU', 80),
(604, 'CIBURIAL', 80);

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE `kota` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`id`, `nama`) VALUES
(1, 'Bandung'),
(2, 'Cimahi'),
(3, 'Kab Bandung Barat'),
(4, 'Kab Bandung');

-- --------------------------------------------------------

--
-- Table structure for table `pemilik_wisata`
--

CREATE TABLE `pemilik_wisata` (
  `id` int(11) NOT NULL,
  `username` varchar(225) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `jenis_kelamin` varchar(10) DEFAULT NULL,
  `tanggal_lahir` date NOT NULL,
  `file_ktp` varchar(225) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'pending',
  `id_admin_dinas` int(11) DEFAULT NULL,
  `level` varchar(20) DEFAULT 'pemilik_wisata'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemilik_wisata`
--

INSERT INTO `pemilik_wisata` (`id`, `username`, `password`, `nama`, `email`, `alamat`, `jenis_kelamin`, `tanggal_lahir`, `file_ktp`, `status`, `id_admin_dinas`, `level`) VALUES
(5, 'staramadan', 'f920cc4ac9e5e013838214393ca0ce08', 'Star Ramadhan', 'staramadan@gmail.com', 'Sekeloa Bandung', 'laki-laki', '1997-12-10', 'Image_624259e.jpg', 'aktif', 1, 'pemilik_wisata');

-- --------------------------------------------------------

--
-- Table structure for table `superadmin`
--

CREATE TABLE `superadmin` (
  `id` int(11) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `username` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `level` varchar(10) NOT NULL DEFAULT 'superadmin'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `superadmin`
--

INSERT INTO `superadmin` (`id`, `nama`, `username`, `password`, `email`, `level`) VALUES
(1, 'Fata El Islami', 'admin', '21232F297A57A5A743894A0E4A801FC3', 'superad@gmail.com', 'superadmin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_dinas`
--
ALTER TABLE `admin_dinas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `kota` (`kota`),
  ADD KEY `id_superadmin` (`id_superadmin`);

--
-- Indexes for table `data_wisata`
--
ALTER TABLE `data_wisata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kota` (`id_kota`),
  ADD KEY `id_kecamatan` (`id_kecamatan`),
  ADD KEY `id_kelurahan` (`id_kelurahan`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_wisata` (`id_wisata`);

--
-- Indexes for table `gambar`
--
ALTER TABLE `gambar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_wisata` (`id_wisata`);

--
-- Indexes for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id_kota` (`id_kota`);

--
-- Indexes for table `kelurahan`
--
ALTER TABLE `kelurahan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kecamatan` (`id_kecamatan`);

--
-- Indexes for table `kota`
--
ALTER TABLE `kota`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pemilik_wisata`
--
ALTER TABLE `pemilik_wisata`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `id_admin_dinas` (`id_admin_dinas`);

--
-- Indexes for table `superadmin`
--
ALTER TABLE `superadmin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_dinas`
--
ALTER TABLE `admin_dinas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `data_wisata`
--
ALTER TABLE `data_wisata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `kecamatan`
--
ALTER TABLE `kecamatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `kelurahan`
--
ALTER TABLE `kelurahan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=605;

--
-- AUTO_INCREMENT for table `kota`
--
ALTER TABLE `kota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pemilik_wisata`
--
ALTER TABLE `pemilik_wisata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `superadmin`
--
ALTER TABLE `superadmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_dinas`
--
ALTER TABLE `admin_dinas`
  ADD CONSTRAINT `admin_dinas_ibfk_1` FOREIGN KEY (`kota`) REFERENCES `kota` (`id`),
  ADD CONSTRAINT `admin_dinas_ibfk_2` FOREIGN KEY (`id_superadmin`) REFERENCES `superadmin` (`id`);

--
-- Constraints for table `data_wisata`
--
ALTER TABLE `data_wisata`
  ADD CONSTRAINT `data_wisata_ibfk_1` FOREIGN KEY (`id_kota`) REFERENCES `kota` (`id`),
  ADD CONSTRAINT `data_wisata_ibfk_2` FOREIGN KEY (`id_kecamatan`) REFERENCES `kecamatan` (`id`),
  ADD CONSTRAINT `data_wisata_ibfk_3` FOREIGN KEY (`id_kelurahan`) REFERENCES `kelurahan` (`id`);

--
-- Constraints for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD CONSTRAINT `fasilitas_ibfk_1` FOREIGN KEY (`id_wisata`) REFERENCES `data_wisata` (`id`);

--
-- Constraints for table `gambar`
--
ALTER TABLE `gambar`
  ADD CONSTRAINT `gambar_ibfk_1` FOREIGN KEY (`id_wisata`) REFERENCES `data_wisata` (`id`);

--
-- Constraints for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD CONSTRAINT `kecamatan_ibfk_1` FOREIGN KEY (`id_kota`) REFERENCES `kota` (`id`);

--
-- Constraints for table `kelurahan`
--
ALTER TABLE `kelurahan`
  ADD CONSTRAINT `kelurahan_ibfk_1` FOREIGN KEY (`id_kecamatan`) REFERENCES `kecamatan` (`id`);

--
-- Constraints for table `pemilik_wisata`
--
ALTER TABLE `pemilik_wisata`
  ADD CONSTRAINT `pemilik_wisata_ibfk_1` FOREIGN KEY (`id_admin_dinas`) REFERENCES `admin_dinas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

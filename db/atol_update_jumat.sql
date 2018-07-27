-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 27, 2018 at 09:17 AM
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
  `lat` decimal(10,6) DEFAULT NULL,
  `lang` decimal(10,6) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `keterangan` text,
  `harga_tiket` int(11) DEFAULT NULL,
  `peta_marker` varchar(50) DEFAULT NULL,
  `id_kota` int(11) DEFAULT NULL,
  `id_kecamatan` int(11) DEFAULT NULL,
  `id_kelurahan` int(11) DEFAULT NULL,
  `id_user` varchar(225) DEFAULT NULL,
  `safe_delete` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  ADD PRIMARY KEY (`id`,`nama`),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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

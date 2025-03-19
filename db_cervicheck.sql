-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 19, 2025 at 07:04 AM
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
-- Database: `db_cervicheck`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_responden`
--

CREATE TABLE `data_responden` (
  `id_responden` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `umur` char(25) NOT NULL,
  `alamat` text NOT NULL,
  `pekerjaan` char(100) NOT NULL,
  `pendidikan` varchar(255) NOT NULL,
  `waktu` datetime NOT NULL,
  `status` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data_responden`
--

INSERT INTO `data_responden` (`id_responden`, `nama`, `umur`, `alamat`, `pekerjaan`, `pendidikan`, `waktu`, `status`) VALUES
(11, 'Coba 2', '26', 'Jalan Surabaya', 'DOSEN FMIPA', 'Pascasarjana', '2025-03-19 12:08:35', 'Risiko Tinggi'),
(12, 'Mencoba Full', '28', 'Jalan Mencoba Full', 'Buruh Tani', 'SD', '2025-03-19 12:41:41', 'Risiko Sedang');

-- --------------------------------------------------------

--
-- Table structure for table `f_class_b`
--

CREATE TABLE `f_class_b` (
  `id_f_class_b` int(11) NOT NULL,
  `id_responden` int(11) NOT NULL,
  `b11` char(5) NOT NULL DEFAULT '-',
  `b12` char(5) NOT NULL DEFAULT '-',
  `b13` char(5) NOT NULL DEFAULT '-',
  `b14` char(5) NOT NULL DEFAULT '-',
  `b15` char(5) NOT NULL DEFAULT '-',
  `b21` char(5) NOT NULL DEFAULT '-',
  `b22` char(5) NOT NULL DEFAULT '-',
  `b23` char(5) NOT NULL DEFAULT '-',
  `b24` char(5) NOT NULL DEFAULT '-',
  `b25` char(5) NOT NULL DEFAULT '-',
  `b31` char(5) NOT NULL DEFAULT '-',
  `b32` char(5) NOT NULL DEFAULT '-',
  `b33` char(5) NOT NULL DEFAULT '-',
  `b34` char(5) NOT NULL DEFAULT '-',
  `b35` char(5) NOT NULL DEFAULT '-',
  `b36` char(5) NOT NULL DEFAULT '-',
  `b41` char(5) NOT NULL DEFAULT '-',
  `b42` char(5) NOT NULL DEFAULT '-',
  `b43` char(5) NOT NULL DEFAULT '-',
  `b44` char(5) NOT NULL DEFAULT '-',
  `b45` char(5) NOT NULL DEFAULT '-',
  `b46` char(5) NOT NULL DEFAULT '-',
  `b51` char(5) NOT NULL DEFAULT '-',
  `b52` char(5) NOT NULL DEFAULT '-',
  `b53` char(5) NOT NULL DEFAULT '-',
  `b54` char(5) NOT NULL DEFAULT '-',
  `b55` char(5) NOT NULL DEFAULT '-',
  `b56` char(5) NOT NULL DEFAULT '-',
  `b57` char(5) NOT NULL DEFAULT '-',
  `b58` char(5) NOT NULL DEFAULT '-',
  `b59` char(5) NOT NULL DEFAULT '-',
  `b510` char(5) NOT NULL DEFAULT '-',
  `b511` char(5) NOT NULL DEFAULT '-',
  `b61` char(5) NOT NULL DEFAULT '-',
  `b62` char(5) NOT NULL DEFAULT '-',
  `b63` char(5) NOT NULL DEFAULT '-',
  `b64` char(5) NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `f_class_b`
--

INSERT INTO `f_class_b` (`id_f_class_b`, `id_responden`, `b11`, `b12`, `b13`, `b14`, `b15`, `b21`, `b22`, `b23`, `b24`, `b25`, `b31`, `b32`, `b33`, `b34`, `b35`, `b36`, `b41`, `b42`, `b43`, `b44`, `b45`, `b46`, `b51`, `b52`, `b53`, `b54`, `b55`, `b56`, `b57`, `b58`, `b59`, `b510`, `b511`, `b61`, `b62`, `b63`, `b64`) VALUES
(2, 11, '3', '3', '-', '3', '3', '3', '3', '3', '3', '3', '-', '-', '-', '-', '-', '-', '-', '3', '3', '3', '-', '-', '-', '3', '3', '-', '-', '-', '-', '-', '-', '-', '-', '3', '3', '-', '-'),
(3, 12, '2', '1', '2', '2', '1', '1', '1', '3', '2', '1', '3', '2', '1', '3', '2', '1', '1', '2', '1', '2', '3', '1', '1', '2', '3', '2', '2', '2', '1', '2', '3', '2', '2', '2', '2', '2', '2');

-- --------------------------------------------------------

--
-- Table structure for table `f_class_c`
--

CREATE TABLE `f_class_c` (
  `id_f_class_c` int(11) NOT NULL,
  `id_responden` int(11) NOT NULL,
  `c11` char(5) NOT NULL DEFAULT '-',
  `c12` char(5) NOT NULL DEFAULT '-',
  `c13` char(5) NOT NULL DEFAULT '-',
  `c14` char(5) NOT NULL DEFAULT '-',
  `c15` char(5) NOT NULL DEFAULT '-',
  `c21` char(5) NOT NULL DEFAULT '-',
  `c22` char(5) NOT NULL DEFAULT '-',
  `c23` char(5) NOT NULL DEFAULT '-',
  `c24` char(5) NOT NULL DEFAULT '-',
  `c25` char(5) NOT NULL DEFAULT '-',
  `c31` char(5) NOT NULL DEFAULT '-',
  `c32` char(5) NOT NULL DEFAULT '-',
  `c33` char(5) NOT NULL DEFAULT '-',
  `c34` char(5) NOT NULL DEFAULT '-',
  `c35` char(5) NOT NULL DEFAULT '-',
  `c41` char(5) NOT NULL DEFAULT '-',
  `c42` char(5) NOT NULL DEFAULT '-',
  `c43` char(5) NOT NULL DEFAULT '-',
  `c44` char(5) NOT NULL DEFAULT '-',
  `c51` char(5) NOT NULL DEFAULT '-',
  `c52` char(5) NOT NULL DEFAULT '-',
  `c53` char(5) NOT NULL DEFAULT '-',
  `c54` char(5) NOT NULL DEFAULT '-',
  `c61` char(5) NOT NULL DEFAULT '-',
  `c62` char(5) NOT NULL DEFAULT '-',
  `c63` char(5) NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `f_class_c`
--

INSERT INTO `f_class_c` (`id_f_class_c`, `id_responden`, `c11`, `c12`, `c13`, `c14`, `c15`, `c21`, `c22`, `c23`, `c24`, `c25`, `c31`, `c32`, `c33`, `c34`, `c35`, `c41`, `c42`, `c43`, `c44`, `c51`, `c52`, `c53`, `c54`, `c61`, `c62`, `c63`) VALUES
(1, 11, '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-'),
(2, 12, '1', '1', '1', '1', '2', '2', '1', '1', '2', '2', '3', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2', '1', '1', '1', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `f_class_d`
--

CREATE TABLE `f_class_d` (
  `id_f_class_d` int(11) NOT NULL,
  `id_responden` int(11) NOT NULL,
  `d11` char(5) NOT NULL DEFAULT '-',
  `d12` char(5) NOT NULL DEFAULT '-',
  `d13` char(5) NOT NULL DEFAULT '-',
  `d21` char(5) NOT NULL DEFAULT '-',
  `d22` char(5) NOT NULL DEFAULT '-',
  `d23` char(5) NOT NULL DEFAULT '-',
  `d24` char(5) NOT NULL DEFAULT '-',
  `d25` char(5) NOT NULL DEFAULT '-',
  `d26` char(5) NOT NULL DEFAULT '-',
  `d27` char(5) NOT NULL DEFAULT '-',
  `d28` char(5) NOT NULL DEFAULT '-',
  `d31` char(5) NOT NULL DEFAULT '-',
  `d32` char(5) NOT NULL DEFAULT '-',
  `d33` char(5) NOT NULL DEFAULT '-',
  `d34` char(5) NOT NULL DEFAULT '-',
  `d35` char(5) NOT NULL DEFAULT '-',
  `d36` char(5) NOT NULL DEFAULT '-',
  `d37` char(5) NOT NULL DEFAULT '-',
  `d38` char(5) NOT NULL DEFAULT '-',
  `d39` char(5) NOT NULL DEFAULT '-',
  `d310` char(5) NOT NULL DEFAULT '-',
  `d311` char(5) NOT NULL DEFAULT '-',
  `d312` char(5) NOT NULL DEFAULT '-',
  `d313` char(5) NOT NULL DEFAULT '-',
  `d314` char(5) NOT NULL DEFAULT '-',
  `d315` char(5) NOT NULL DEFAULT '-',
  `d316` char(5) NOT NULL DEFAULT '-',
  `d317` char(5) NOT NULL DEFAULT '-',
  `d318` char(5) NOT NULL DEFAULT '-',
  `d319` char(5) NOT NULL DEFAULT '-',
  `d320` char(5) NOT NULL DEFAULT '-',
  `d321` char(5) NOT NULL DEFAULT '-',
  `d322` char(5) NOT NULL DEFAULT '-',
  `d323` char(5) NOT NULL DEFAULT '-',
  `d41` char(5) NOT NULL DEFAULT '-',
  `d42` char(5) NOT NULL DEFAULT '-',
  `d43` char(5) NOT NULL DEFAULT '-',
  `d44` char(5) NOT NULL DEFAULT '-',
  `d45` char(5) NOT NULL DEFAULT '-',
  `d46` char(5) NOT NULL DEFAULT '-',
  `d51` char(5) NOT NULL DEFAULT '-',
  `d52` char(5) NOT NULL DEFAULT '-',
  `d53` char(5) NOT NULL DEFAULT '-',
  `d54` char(5) NOT NULL DEFAULT '-',
  `d55` char(5) NOT NULL DEFAULT '-',
  `d61` char(5) NOT NULL DEFAULT '-',
  `d62` char(5) NOT NULL DEFAULT '-',
  `d63` char(5) NOT NULL DEFAULT '-',
  `d64` char(5) NOT NULL DEFAULT '-',
  `d65` char(5) NOT NULL DEFAULT '-',
  `d66` char(5) NOT NULL DEFAULT '-',
  `d67` char(5) NOT NULL DEFAULT '-',
  `d68` char(5) NOT NULL DEFAULT '-',
  `d71` char(5) NOT NULL DEFAULT '-',
  `d72` char(5) NOT NULL DEFAULT '-',
  `d73` char(5) NOT NULL DEFAULT '-',
  `d74` char(5) NOT NULL DEFAULT '-',
  `d75` char(5) NOT NULL DEFAULT '-',
  `d76` char(5) NOT NULL DEFAULT '-',
  `d77` char(5) NOT NULL DEFAULT '-',
  `d81` char(5) NOT NULL DEFAULT '-',
  `d82` char(5) NOT NULL DEFAULT '-',
  `d83` char(5) NOT NULL DEFAULT '-',
  `d84` char(5) NOT NULL DEFAULT '-',
  `d85` char(5) NOT NULL DEFAULT '-',
  `d86` char(5) NOT NULL DEFAULT '-',
  `d91` char(5) NOT NULL DEFAULT '-',
  `d92` char(5) NOT NULL DEFAULT '-',
  `d93` char(5) NOT NULL DEFAULT '-',
  `d94` char(5) NOT NULL DEFAULT '-',
  `d95` char(5) NOT NULL DEFAULT '-',
  `d101` char(5) NOT NULL DEFAULT '-',
  `d102` char(5) NOT NULL DEFAULT '-',
  `d103` char(5) NOT NULL DEFAULT '-',
  `d104` char(5) NOT NULL DEFAULT '-',
  `d111` char(5) NOT NULL DEFAULT '-',
  `d112` char(5) NOT NULL DEFAULT '-',
  `d113` char(5) NOT NULL DEFAULT '-',
  `d114` char(5) NOT NULL DEFAULT '-',
  `d115` char(5) NOT NULL DEFAULT '-',
  `d116` char(5) NOT NULL DEFAULT '-',
  `d117` char(5) NOT NULL DEFAULT '-',
  `d118` char(5) NOT NULL DEFAULT '-',
  `d119` char(5) NOT NULL DEFAULT '-',
  `d121` char(5) NOT NULL DEFAULT '-',
  `d122` char(5) NOT NULL DEFAULT '-',
  `d123` char(5) NOT NULL DEFAULT '-',
  `d124` char(5) NOT NULL DEFAULT '-',
  `d131` char(5) NOT NULL DEFAULT '-',
  `d132` char(5) NOT NULL DEFAULT '-',
  `d133` char(5) NOT NULL DEFAULT '-',
  `d134` char(5) NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `f_class_d`
--

INSERT INTO `f_class_d` (`id_f_class_d`, `id_responden`, `d11`, `d12`, `d13`, `d21`, `d22`, `d23`, `d24`, `d25`, `d26`, `d27`, `d28`, `d31`, `d32`, `d33`, `d34`, `d35`, `d36`, `d37`, `d38`, `d39`, `d310`, `d311`, `d312`, `d313`, `d314`, `d315`, `d316`, `d317`, `d318`, `d319`, `d320`, `d321`, `d322`, `d323`, `d41`, `d42`, `d43`, `d44`, `d45`, `d46`, `d51`, `d52`, `d53`, `d54`, `d55`, `d61`, `d62`, `d63`, `d64`, `d65`, `d66`, `d67`, `d68`, `d71`, `d72`, `d73`, `d74`, `d75`, `d76`, `d77`, `d81`, `d82`, `d83`, `d84`, `d85`, `d86`, `d91`, `d92`, `d93`, `d94`, `d95`, `d101`, `d102`, `d103`, `d104`, `d111`, `d112`, `d113`, `d114`, `d115`, `d116`, `d117`, `d118`, `d119`, `d121`, `d122`, `d123`, `d124`, `d131`, `d132`, `d133`, `d134`) VALUES
(2, 11, '3', '-', '-', '2', '3', '3', '-', '3', '3', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '3', '3', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '3', '3', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-', '3', '3', '3', '-', '-', '-', '-', '-', '-', '-', '-', '-'),
(3, 12, '2', '1', '2', '1', '1', '1', '1', '2', '1', '1', '1', '2', '1', '1', '1', '1', '1', '1', '2', '2', '1', '1', '1', '2', '1', '1', '1', '1', '1', '2', '1', '2', '1', '1', '3', '2', '1', '1', '2', '1', '1', '1', '1', '1', '2', '2', '1', '1', '2', '2', '1', '2', '1', '1', '2', '1', '1', '2', '2', '2', '1', '2', '1', '2', '2', '2', '2', '2', '3', '2', '2', '1', '2', '2', '1', '1', '1', '2', '2', '3', '1', '2', '2', '2', '2', '1', '1', '2', '2', '1', '2', '2');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`) VALUES
(1, 'Super Admin', 'admin', 'admin123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_responden`
--
ALTER TABLE `data_responden`
  ADD PRIMARY KEY (`id_responden`);

--
-- Indexes for table `f_class_b`
--
ALTER TABLE `f_class_b`
  ADD PRIMARY KEY (`id_f_class_b`),
  ADD KEY `id_responden` (`id_responden`);

--
-- Indexes for table `f_class_c`
--
ALTER TABLE `f_class_c`
  ADD PRIMARY KEY (`id_f_class_c`),
  ADD KEY `id_responden` (`id_responden`);

--
-- Indexes for table `f_class_d`
--
ALTER TABLE `f_class_d`
  ADD PRIMARY KEY (`id_f_class_d`),
  ADD KEY `id_responden` (`id_responden`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_responden`
--
ALTER TABLE `data_responden`
  MODIFY `id_responden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `f_class_b`
--
ALTER TABLE `f_class_b`
  MODIFY `id_f_class_b` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `f_class_c`
--
ALTER TABLE `f_class_c`
  MODIFY `id_f_class_c` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `f_class_d`
--
ALTER TABLE `f_class_d`
  MODIFY `id_f_class_d` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `f_class_b`
--
ALTER TABLE `f_class_b`
  ADD CONSTRAINT `f_class_b_ibfk_1` FOREIGN KEY (`id_responden`) REFERENCES `data_responden` (`id_responden`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `f_class_c`
--
ALTER TABLE `f_class_c`
  ADD CONSTRAINT `f_class_c_ibfk_1` FOREIGN KEY (`id_responden`) REFERENCES `data_responden` (`id_responden`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `f_class_d`
--
ALTER TABLE `f_class_d`
  ADD CONSTRAINT `f_class_d_ibfk_1` FOREIGN KEY (`id_responden`) REFERENCES `data_responden` (`id_responden`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2018 at 01:21 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `si_prak`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_atr_perm1`
--

CREATE TABLE `tb_atr_perm1` (
  `id_atr_perm1` int(10) NOT NULL,
  `nama_permis` varchar(255) DEFAULT NULL,
  `nilai` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_atr_perm2`
--

CREATE TABLE `tb_atr_perm2` (
  `id_atr_perm2` int(10) NOT NULL,
  `nama_permis` varchar(255) DEFAULT NULL,
  `nilai` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_aturan`
--

CREATE TABLE `tb_aturan` (
  `id_aturan` int(11) NOT NULL,
  `id_perm1` int(11) DEFAULT NULL,
  `id_perm2` int(11) DEFAULT NULL,
  `conclusi` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_hasil_akhir`
--

CREATE TABLE `tb_hasil_akhir` (
  `id_hasil_akhir` int(10) NOT NULL,
  `id_prak_akhir` int(10) DEFAULT NULL,
  `id_responsi` int(10) DEFAULT NULL,
  `id_aturan` int(10) DEFAULT NULL,
  `id_user` int(10) DEFAULT NULL,
  `id_kurikulum` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kurikulum`
--

CREATE TABLE `tb_kurikulum` (
  `id_kurikulum` int(10) NOT NULL,
  `nama_kurikulum` varchar(255) NOT NULL,
  `flag` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_level`
--

CREATE TABLE `tb_level` (
  `id_level` int(10) NOT NULL,
  `level` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_level`
--

INSERT INTO `tb_level` (`id_level`, `level`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pelajaran`
--

CREATE TABLE `tb_pelajaran` (
  `id_pelajaran` int(10) NOT NULL,
  `id_kurikulum` int(10) DEFAULT NULL,
  `id_user` int(10) DEFAULT NULL,
  `nama_pelajaran` varchar(255) DEFAULT NULL,
  `sesi` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_prak_akhir`
--

CREATE TABLE `tb_prak_akhir` (
  `id_prak_akhir` int(10) NOT NULL,
  `id_user` int(10) DEFAULT NULL,
  `id_atr_perm1` int(10) DEFAULT NULL,
  `id_kurikulum` int(10) DEFAULT NULL,
  `id_pelajaran` int(10) DEFAULT NULL,
  `nilai` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_responsi`
--

CREATE TABLE `tb_responsi` (
  `id_responsi` int(10) NOT NULL,
  `id_user` int(10) DEFAULT NULL,
  `nilai_responsi` float DEFAULT NULL,
  `id_atr_prem2` int(10) DEFAULT NULL,
  `id_pelajaran` int(10) DEFAULT NULL,
  `id_kurikulum` int(10) DEFAULT NULL,
  `creation_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_sub_pelajaran`
--

CREATE TABLE `tb_sub_pelajaran` (
  `id_sub` int(10) NOT NULL,
  `id_pelajaran` int(10) DEFAULT NULL,
  `id_user` int(10) DEFAULT NULL,
  `id_nilai_akhir` int(10) DEFAULT NULL,
  `nama_sub` varchar(255) DEFAULT NULL,
  `nilai` float DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `creation_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(10) NOT NULL,
  `kode_pendaftaran` varchar(255) NOT NULL,
  `nama` varchar(60) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `username` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `id_level` int(10) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `kode_pendaftaran`, `nama`, `alamat`, `jenis_kelamin`, `username`, `password`, `id_level`, `pass`) VALUES
(2, 'PD-1001', 'asdf', 'dsf', 'L', 'd', '8277e0910d750195b448797616e091ad', 2, ''),
(3, 'PD-1002', 'werty', 'coba', 'P', 'a', '0cc175b9c0f1b6a831c399e269772661', 1, ''),
(4, 'PD-1003', 'dfgh', 'dsfgh', 'L', 's', '03c7c0ace395d80182db07ae2c30f034', 2, ''),
(5, 'PD-1004', 'sd', '', 'L', 'abc', 'f9ac6b05beccb0fc5837b6a7fef4c1d3', 2, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_atr_perm1`
--
ALTER TABLE `tb_atr_perm1`
  ADD PRIMARY KEY (`id_atr_perm1`);

--
-- Indexes for table `tb_atr_perm2`
--
ALTER TABLE `tb_atr_perm2`
  ADD PRIMARY KEY (`id_atr_perm2`);

--
-- Indexes for table `tb_aturan`
--
ALTER TABLE `tb_aturan`
  ADD PRIMARY KEY (`id_aturan`),
  ADD KEY `id_perm1` (`id_perm1`),
  ADD KEY `id_perm2` (`id_perm2`);

--
-- Indexes for table `tb_hasil_akhir`
--
ALTER TABLE `tb_hasil_akhir`
  ADD PRIMARY KEY (`id_hasil_akhir`),
  ADD KEY `id_prak_akhir` (`id_prak_akhir`),
  ADD KEY `id_responsi` (`id_responsi`),
  ADD KEY `id_aturan` (`id_aturan`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_kurikulum` (`id_kurikulum`);

--
-- Indexes for table `tb_kurikulum`
--
ALTER TABLE `tb_kurikulum`
  ADD PRIMARY KEY (`id_kurikulum`),
  ADD KEY `id_kurikulum` (`id_kurikulum`);

--
-- Indexes for table `tb_level`
--
ALTER TABLE `tb_level`
  ADD PRIMARY KEY (`id_level`);

--
-- Indexes for table `tb_pelajaran`
--
ALTER TABLE `tb_pelajaran`
  ADD PRIMARY KEY (`id_pelajaran`),
  ADD KEY `id_kurikulum` (`id_kurikulum`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tb_prak_akhir`
--
ALTER TABLE `tb_prak_akhir`
  ADD PRIMARY KEY (`id_prak_akhir`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_atr_perm1` (`id_atr_perm1`),
  ADD KEY `id_kurikulum` (`id_kurikulum`),
  ADD KEY `id_pelajaran` (`id_pelajaran`);

--
-- Indexes for table `tb_responsi`
--
ALTER TABLE `tb_responsi`
  ADD PRIMARY KEY (`id_responsi`),
  ADD KEY `id_atr_prem2` (`id_atr_prem2`),
  ADD KEY `id_pelajaran` (`id_pelajaran`),
  ADD KEY `id_kurikulum` (`id_kurikulum`),
  ADD KEY `creation_id` (`creation_id`);

--
-- Indexes for table `tb_sub_pelajaran`
--
ALTER TABLE `tb_sub_pelajaran`
  ADD PRIMARY KEY (`id_sub`),
  ADD KEY `id_pelajaran` (`id_pelajaran`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `creation_id` (`creation_id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_level` (`id_level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_kurikulum`
--
ALTER TABLE `tb_kurikulum`
  MODIFY `id_kurikulum` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_aturan`
--
ALTER TABLE `tb_aturan`
  ADD CONSTRAINT `tb_aturan_ibfk_1` FOREIGN KEY (`id_perm1`) REFERENCES `tb_atr_perm1` (`id_atr_perm1`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_aturan_ibfk_2` FOREIGN KEY (`id_perm2`) REFERENCES `tb_atr_perm2` (`id_atr_perm2`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_hasil_akhir`
--
ALTER TABLE `tb_hasil_akhir`
  ADD CONSTRAINT `tb_hasil_akhir_ibfk_1` FOREIGN KEY (`id_prak_akhir`) REFERENCES `tb_prak_akhir` (`id_prak_akhir`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_hasil_akhir_ibfk_2` FOREIGN KEY (`id_responsi`) REFERENCES `tb_responsi` (`id_responsi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_hasil_akhir_ibfk_3` FOREIGN KEY (`id_aturan`) REFERENCES `tb_aturan` (`id_aturan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_hasil_akhir_ibfk_4` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_hasil_akhir_ibfk_5` FOREIGN KEY (`id_kurikulum`) REFERENCES `tb_kurikulum` (`id_kurikulum`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_pelajaran`
--
ALTER TABLE `tb_pelajaran`
  ADD CONSTRAINT `tb_pelajaran_ibfk_1` FOREIGN KEY (`id_kurikulum`) REFERENCES `tb_kurikulum` (`id_kurikulum`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pelajaran_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_prak_akhir`
--
ALTER TABLE `tb_prak_akhir`
  ADD CONSTRAINT `tb_prak_akhir_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_prak_akhir_ibfk_2` FOREIGN KEY (`id_atr_perm1`) REFERENCES `tb_atr_perm1` (`id_atr_perm1`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_prak_akhir_ibfk_3` FOREIGN KEY (`id_kurikulum`) REFERENCES `tb_kurikulum` (`id_kurikulum`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_prak_akhir_ibfk_4` FOREIGN KEY (`id_pelajaran`) REFERENCES `tb_pelajaran` (`id_pelajaran`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_responsi`
--
ALTER TABLE `tb_responsi`
  ADD CONSTRAINT `tb_responsi_ibfk_1` FOREIGN KEY (`id_atr_prem2`) REFERENCES `tb_atr_perm2` (`id_atr_perm2`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_responsi_ibfk_2` FOREIGN KEY (`id_pelajaran`) REFERENCES `tb_pelajaran` (`id_pelajaran`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_responsi_ibfk_3` FOREIGN KEY (`id_kurikulum`) REFERENCES `tb_kurikulum` (`id_kurikulum`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_responsi_ibfk_4` FOREIGN KEY (`creation_id`) REFERENCES `tb_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_sub_pelajaran`
--
ALTER TABLE `tb_sub_pelajaran`
  ADD CONSTRAINT `tb_sub_pelajaran_ibfk_1` FOREIGN KEY (`id_pelajaran`) REFERENCES `tb_pelajaran` (`id_pelajaran`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_sub_pelajaran_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_sub_pelajaran_ibfk_3` FOREIGN KEY (`creation_id`) REFERENCES `tb_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `tb_level` (`id_level`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

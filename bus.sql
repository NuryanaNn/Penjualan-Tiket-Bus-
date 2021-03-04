-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 08 Jun 2020 pada 18.52
-- Versi Server: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `penumpang`
--

CREATE TABLE `penumpang` (
  `Kode_Penumpang` varchar(20) NOT NULL,
  `Kode_Tiket` varchar(20) NOT NULL,
  `Nama_Penumpang` varchar(20) NOT NULL,
  `Alamat` varchar(20) NOT NULL,
  `No_Telpon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penumpang`
--

INSERT INTO `penumpang` (`Kode_Penumpang`, `Kode_Tiket`, `Nama_Penumpang`, `Alamat`, `No_Telpon`) VALUES
('A222', 'A111', 'Doni', 'Jakarta', '082832838282');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tiket`
--

CREATE TABLE `tiket` (
  `Kode_Tiket` varchar(20) NOT NULL,
  `Jurusan` varchar(20) NOT NULL,
  `Kelas` varchar(20) NOT NULL,
  `Harga` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tiket`
--

INSERT INTO `tiket` (`Kode_Tiket`, `Jurusan`, `Kelas`, `Harga`) VALUES
('1111', 'PILIH JURUSAN', 'PILIH KELAS', ''),
('123', 'PILIH JURUSAN', 'PILIH KELAS', 'hdjkcl'),
('A111', 'Bandung', 'AC', '200000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `No_Transaksi` varchar(20) NOT NULL,
  `Kode_Tiket` varchar(20) NOT NULL,
  `Kode_Penumpang` varchar(20) NOT NULL,
  `Nama_Penumpang` varchar(20) NOT NULL,
  `Jurusan` varchar(20) NOT NULL,
  `Kelas` varchar(20) NOT NULL,
  `Harga` varchar(20) NOT NULL,
  `Jumlah_Tiket` varchar(10) NOT NULL,
  `Harga_Total` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`No_Transaksi`, `Kode_Tiket`, `Kode_Penumpang`, `Nama_Penumpang`, `Jurusan`, `Kelas`, `Harga`, `Jumlah_Tiket`, `Harga_Total`) VALUES
('1', 'A111', 'A222', 'Doni', 'Bandung', 'AC', '50000', '3', '150000.0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `penumpang`
--
ALTER TABLE `penumpang`
  ADD PRIMARY KEY (`Kode_Penumpang`),
  ADD UNIQUE KEY `Kode_Tiket` (`Kode_Tiket`);

--
-- Indexes for table `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`Kode_Tiket`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`No_Transaksi`),
  ADD UNIQUE KEY `Kode_Penumpang` (`Kode_Penumpang`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `penumpang`
--
ALTER TABLE `penumpang`
  ADD CONSTRAINT `penumpang_ibfk_1` FOREIGN KEY (`Kode_Tiket`) REFERENCES `tiket` (`Kode_Tiket`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`Kode_Penumpang`) REFERENCES `penumpang` (`Kode_Penumpang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

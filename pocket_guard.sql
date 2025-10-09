-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 09, 2025 at 01:59 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pocket_guard`
--

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `jenis` enum('Pemasukan','Pengeluaran') NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `metode` varchar(30) NOT NULL,
  `jumlah` decimal(14,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `tanggal`, `keterangan`, `jenis`, `kategori`, `metode`, `jumlah`) VALUES
(1, '2025-09-01', 'Gaji Bulanan', 'Pemasukan', 'Gaji', 'Transfer', 5000000.00),
(2, '2025-09-02', 'Beli Makan Siang', 'Pengeluaran', 'Makan', 'Cash', 25000.00),
(3, '2025-09-03', 'Ongkos Transportasi', 'Pengeluaran', 'Transportasi', 'Cash', 10000.00),
(4, '2025-09-04', 'Nonton Bioskop', 'Pengeluaran', 'Hiburan', 'E-Wallet', 50000.00),
(5, '2025-09-05', 'Beli Pakaian', 'Pengeluaran', 'Belanja', 'Transfer', 200000.00),
(6, '2025-09-06', 'Menabung Rutin', 'Pemasukan', 'Tabungan', 'Transfer', 500000.00),
(7, '2025-09-07', 'Bayar Listrik', 'Pengeluaran', 'Tagihan', 'E-Wallet', 150000.00),
(8, '2025-09-08', 'Bayar Air', 'Pengeluaran', 'Tagihan', 'Transfer', 100000.00),
(9, '2025-09-09', 'Isi Saldo Tabungan', 'Pemasukan', 'Tabungan', 'Transfer', 300000.00),
(10, '2025-09-10', 'Makan Malam di Restoran', 'Pengeluaran', 'Makan', 'Cash', 75000.00),
(11, '2025-09-10', 'Bonus Proyek Mega', 'Pemasukan', 'Gaji', 'Transfer', 500000.00),
(12, '2025-09-11', 'Beli Bensin 1 Liter', 'Pengeluaran', 'Transportasi', 'Cash', 50000.00),
(13, '2025-10-07', 'jalan-jalan ke bigmall', 'Pemasukan', 'Hiburan', 'Transfer', 200000.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

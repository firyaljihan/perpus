-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Jun 2021 pada 03.27
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `belajar_php_native`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `nama_buku` varchar(100) NOT NULL,
  `pengarang` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `nama_buku`, `pengarang`, `deskripsi`, `foto`) VALUES
(1, 'Seni Budaya', 'Edi Arjuno', 'ini buku seni budaya', 'buku5.jpg'),
(2, 'Matematika', 'Sulastri', 'ini buku matematika', 'buku6.jpg'),
(3, 'Matematika', 'udin', 'ini adalah buku matematika', 'buku2.jpg'),
(4, 'IPA', 'Sugeng', 'ini buku ilmu pengetahuan alam', 'buku7.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_peminjaman_buku`
--

CREATE TABLE `detail_peminjaman_buku` (
  `id_detail_peminjaman_buku` int(11) NOT NULL,
  `id_peminjaman_buku` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_peminjaman_buku`
--

INSERT INTO `detail_peminjaman_buku` (`id_detail_peminjaman_buku`, `id_peminjaman_buku`, `id_buku`, `qty`) VALUES
(2, 2, 3, 2),
(3, 2, 4, 4),
(4, 3, 3, 2),
(5, 3, 4, 4),
(6, 4, 1, 1),
(7, 5, 4, 2),
(8, 5, 3, 1),
(9, 6, 1, 3),
(10, 7, 1, 1),
(11, 8, 1, 1),
(12, 9, 3, 1),
(13, 10, 1, 1),
(14, 11, 2, 1),
(15, 12, 4, 1),
(16, 13, 3, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(20) NOT NULL,
  `kelompok` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`, `kelompok`) VALUES
(1, 'XIIR1', 'XII RPL 1'),
(3, 'XIIR2', 'XII RPL 2'),
(4, 'XII', 'RPL6'),
(5, 'XII', 'RPL6'),
(6, 'X', 'RPL 1'),
(7, 'XII RPL 7', 'RPL 7'),
(8, 'XIIRPL8', 'RPL 8');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman_buku`
--

CREATE TABLE `peminjaman_buku` (
  `id_peminjaman_buku` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `peminjaman_buku`
--

INSERT INTO `peminjaman_buku` (`id_peminjaman_buku`, `id_siswa`, `tanggal_pinjam`, `tanggal_kembali`) VALUES
(2, 36, '2021-05-18', '2021-05-20'),
(3, 36, '2021-05-18', '0000-00-00'),
(4, 36, '2021-05-18', '0000-00-00'),
(5, 36, '2021-05-23', '0000-00-00'),
(6, 36, '2021-05-23', '0000-00-00'),
(7, 36, '2021-05-23', '0000-00-00'),
(8, 36, '2021-05-23', '2021-05-28'),
(9, 36, '2021-05-23', '2021-05-28'),
(10, 36, '2021-06-03', '2021-06-08'),
(11, 36, '2021-06-06', '2021-06-11'),
(12, 36, '2021-06-06', '2021-06-11'),
(13, 36, '2021-06-06', '2021-06-11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengembalian_buku`
--

CREATE TABLE `pengembalian_buku` (
  `id_pengembalian_buku` int(11) NOT NULL,
  `id_peminjaman_buku` int(11) NOT NULL,
  `tanggal_pengembalian` date NOT NULL,
  `denda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengembalian_buku`
--

INSERT INTO `pengembalian_buku` (`id_pengembalian_buku`, `id_peminjaman_buku`, `tanggal_pengembalian`, `denda`) VALUES
(12, 2, '2021-05-23', 15000),
(13, 3, '2021-05-23', 115000),
(14, 4, '2021-05-23', 115000),
(15, 5, '2021-05-23', 115000),
(16, 6, '2021-05-23', 115000),
(17, 7, '2021-05-24', 120000),
(18, 10, '2021-06-03', 0),
(19, 8, '2021-06-06', 45000),
(20, 13, '2021-06-06', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `nama_siswa` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `alamat` text DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `id_kelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nama_siswa`, `tanggal_lahir`, `gender`, `alamat`, `username`, `password`, `id_kelas`) VALUES
(36, 'bidin', '2000-12-12', 'L', 'malang', 'bidin', '202cb962ac59075b964b07152d234b70', 3);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`) USING BTREE;

--
-- Indeks untuk tabel `detail_peminjaman_buku`
--
ALTER TABLE `detail_peminjaman_buku`
  ADD PRIMARY KEY (`id_detail_peminjaman_buku`) USING BTREE,
  ADD KEY `id_peminjaman_buku` (`id_peminjaman_buku`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`) USING BTREE;

--
-- Indeks untuk tabel `peminjaman_buku`
--
ALTER TABLE `peminjaman_buku`
  ADD PRIMARY KEY (`id_peminjaman_buku`) USING BTREE,
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indeks untuk tabel `pengembalian_buku`
--
ALTER TABLE `pengembalian_buku`
  ADD PRIMARY KEY (`id_pengembalian_buku`) USING BTREE,
  ADD KEY `id_peminjaman_buku` (`id_peminjaman_buku`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`) USING BTREE,
  ADD KEY `id_kelas` (`id_kelas`) USING BTREE;

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `detail_peminjaman_buku`
--
ALTER TABLE `detail_peminjaman_buku`
  MODIFY `id_detail_peminjaman_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `peminjaman_buku`
--
ALTER TABLE `peminjaman_buku`
  MODIFY `id_peminjaman_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `pengembalian_buku`
--
ALTER TABLE `pengembalian_buku`
  MODIFY `id_pengembalian_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_peminjaman_buku`
--
ALTER TABLE `detail_peminjaman_buku`
  ADD CONSTRAINT `detail_peminjaman_buku_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`),
  ADD CONSTRAINT `detail_peminjaman_buku_ibfk_2` FOREIGN KEY (`id_peminjaman_buku`) REFERENCES `peminjaman_buku` (`id_peminjaman_buku`);

--
-- Ketidakleluasaan untuk tabel `peminjaman_buku`
--
ALTER TABLE `peminjaman_buku`
  ADD CONSTRAINT `peminjaman_buku_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`);

--
-- Ketidakleluasaan untuk tabel `pengembalian_buku`
--
ALTER TABLE `pengembalian_buku`
  ADD CONSTRAINT `pengembalian_buku_ibfk_1` FOREIGN KEY (`id_peminjaman_buku`) REFERENCES `peminjaman_buku` (`id_peminjaman_buku`);

--
-- Ketidakleluasaan untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

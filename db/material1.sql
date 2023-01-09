-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Jan 2023 pada 12.18
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `material1`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `kode_barang` varchar(5) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `stock_toko` varchar(20) NOT NULL,
  `stock_gudang` varchar(20) NOT NULL,
  `satuan` enum('Kit','Test','Vial','Botol','Buah','Buku') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `id_kategori`, `id_supplier`, `kode_barang`, `nama_barang`, `stock_toko`, `stock_gudang`, `satuan`) VALUES
(8, 2, 1, 'BR001', 'Anti-A', '3', '22', 'Vial'),
(9, 3, 3, 'BR002', 'Buku Laporan Crossmatch', '3', '22', 'Buku'),
(10, 5, 1, 'BR003', 'Kantong Darah Double', '3', '397', 'Buah'),
(11, 5, 1, 'BR004', 'Kantong Darah Triple', '3', '197', 'Buah'),
(12, 5, 1, 'BR005', 'Gel Test Across', '3', '7', 'Kit'),
(13, 2, 1, 'BR006', 'Anti-B', '1', '9', 'Vial');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id_barangkeluar` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_permintaanbarang` int(11) NOT NULL,
  `kode_barangkeluar` varchar(5) NOT NULL,
  `tgl_barangkeluar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang_keluar`
--

INSERT INTO `barang_keluar` (`id_barangkeluar`, `id_user`, `id_permintaanbarang`, `kode_barangkeluar`, `tgl_barangkeluar`) VALUES
(7, 4, 11, 'BK001', '2022-12-04'),
(8, 4, 12, 'BK002', '2022-12-05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id_barangmasuk` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_permintaanpembelian` int(11) NOT NULL,
  `kode_barangmasuk` varchar(5) NOT NULL,
  `tgl_barangmasuk` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang_masuk`
--

INSERT INTO `barang_masuk` (`id_barangmasuk`, `id_user`, `id_permintaanpembelian`, `kode_barangmasuk`, `tgl_barangmasuk`) VALUES
(7, 4, 13, 'BM001', '2022-12-04'),
(8, 4, 14, 'BM002', '2022-12-05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_permintaanbarang`
--

CREATE TABLE `detail_permintaanbarang` (
  `id_detailpermintaanbarang` int(11) NOT NULL,
  `id_permintaanbarang` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jumlah_permintaanbarang` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_permintaanbarang`
--

INSERT INTO `detail_permintaanbarang` (`id_detailpermintaanbarang`, `id_permintaanbarang`, `id_barang`, `jumlah_permintaanbarang`) VALUES
(19, 11, 8, '2'),
(20, 11, 9, '1'),
(21, 12, 9, '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_permintaanpembelian`
--

CREATE TABLE `detail_permintaanpembelian` (
  `id_detailpermintaanpembelian` int(11) NOT NULL,
  `id_permintaanpembelian` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jumlah_permintaanpembelian` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_permintaanpembelian`
--

INSERT INTO `detail_permintaanpembelian` (`id_detailpermintaanpembelian`, `id_permintaanpembelian`, `id_barang`, `jumlah_permintaanpembelian`) VALUES
(20, 13, 8, '25'),
(21, 13, 10, '400'),
(22, 13, 11, '200'),
(23, 13, 9, '25'),
(24, 13, 12, '10'),
(25, 14, 13, '10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(2, 'Reagensia'),
(3, 'ATK'),
(4, 'Bahan Pokok'),
(5, 'Alat Habis Pakai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permintaan_barang`
--

CREATE TABLE `permintaan_barang` (
  `id_permintaanbarang` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `kode_permintaanbarang` varchar(5) NOT NULL,
  `tgl_permintaanbarang` date NOT NULL,
  `status_permintaanbarang` enum('Meminta','Setuju','Ditolak') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `permintaan_barang`
--

INSERT INTO `permintaan_barang` (`id_permintaanbarang`, `id_user`, `kode_permintaanbarang`, `tgl_permintaanbarang`, `status_permintaanbarang`) VALUES
(11, 2, 'PB001', '2022-12-04', 'Setuju'),
(12, 2, 'PB002', '2022-12-05', 'Setuju');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permintaan_pembelian`
--

CREATE TABLE `permintaan_pembelian` (
  `id_permintaanpembelian` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `kode_permintaanpembelian` varchar(5) NOT NULL,
  `tgl_permintaanpembelian` date NOT NULL,
  `status_permintaanpembelian` enum('Meminta','Ditolak','Setuju') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `permintaan_pembelian`
--

INSERT INTO `permintaan_pembelian` (`id_permintaanpembelian`, `id_user`, `kode_permintaanpembelian`, `tgl_permintaanpembelian`, `status_permintaanpembelian`) VALUES
(13, 4, 'PP001', '2022-12-04', 'Setuju'),
(14, 4, 'PP002', '2022-12-05', 'Setuju');

-- --------------------------------------------------------

--
-- Struktur dari tabel `po`
--

CREATE TABLE `po` (
  `id_po` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_permintaanpembelian` int(11) NOT NULL,
  `kode_po` varchar(5) NOT NULL,
  `tgl_po` date NOT NULL,
  `status_po` enum('Mengirim','Diterima') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `po`
--

INSERT INTO `po` (`id_po`, `id_user`, `id_permintaanpembelian`, `kode_po`, `tgl_po`, `status_po`) VALUES
(9, 3, 13, 'PO001', '2022-12-04', 'Diterima'),
(10, 3, 14, 'PO002', '2022-12-05', 'Diterima');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `kode_supplier` varchar(5) NOT NULL,
  `nama_supplier` varchar(50) NOT NULL,
  `alamat_supplier` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `kode_supplier`, `nama_supplier`, `alamat_supplier`) VALUES
(1, 'SP001', 'PT. MARGI MAKMUR', 'BEKASI'),
(2, 'SP002', 'CV.VIKA MEDIKA', 'BANDUNG'),
(3, 'SP003', 'PT.CIPTA GRAFIKA', 'KARAWANG');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_petugas`
--

CREATE TABLE `user_petugas` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `jabatan` varchar(30) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `foto_user` varchar(100) NOT NULL,
  `level` enum('admin','pengguna','purchasing','gudang') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_petugas`
--

INSERT INTO `user_petugas` (`id_user`, `nama`, `jabatan`, `phone`, `email`, `password`, `foto_user`, `level`) VALUES
(1, 'Asep Nuramdan', 'Administrator', '08128576511', 'admin@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'anak_cwo.png', 'admin'),
(2, 'Amin Nur Wakhiddatun', 'Kasubag PDR', '087516756155', 'store@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'female-2.png', 'pengguna'),
(3, 'Oni Melani', 'Manager Purchasing', '0270458776', 'purchasing@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'female-1.png', 'purchasing'),
(4, 'Siti Chodijah', 'Manager Gudang', '07347864847', 'gudang@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'female-11.png', 'gudang'),
(8, 'Ade Iwan', 'Kasubag PDN', '1234', 'ade@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '', 'pengguna');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_kategori` (`id_kategori`,`id_supplier`),
  ADD KEY `barang_ibfk_1` (`id_supplier`);

--
-- Indeks untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id_barangkeluar`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_permintaanbarang` (`id_permintaanbarang`);

--
-- Indeks untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id_barangmasuk`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_permintaanpembelian` (`id_permintaanpembelian`);

--
-- Indeks untuk tabel `detail_permintaanbarang`
--
ALTER TABLE `detail_permintaanbarang`
  ADD PRIMARY KEY (`id_detailpermintaanbarang`),
  ADD KEY `id_permintaanbarang` (`id_permintaanbarang`,`id_barang`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `detail_permintaanpembelian`
--
ALTER TABLE `detail_permintaanpembelian`
  ADD PRIMARY KEY (`id_detailpermintaanpembelian`),
  ADD KEY `id_permintaanpembelian` (`id_permintaanpembelian`,`id_barang`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `permintaan_barang`
--
ALTER TABLE `permintaan_barang`
  ADD PRIMARY KEY (`id_permintaanbarang`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `permintaan_pembelian`
--
ALTER TABLE `permintaan_pembelian`
  ADD PRIMARY KEY (`id_permintaanpembelian`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `po`
--
ALTER TABLE `po`
  ADD PRIMARY KEY (`id_po`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_permintaanpembelian` (`id_permintaanpembelian`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indeks untuk tabel `user_petugas`
--
ALTER TABLE `user_petugas`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  MODIFY `id_barangkeluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `id_barangmasuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `detail_permintaanbarang`
--
ALTER TABLE `detail_permintaanbarang`
  MODIFY `id_detailpermintaanbarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `detail_permintaanpembelian`
--
ALTER TABLE `detail_permintaanpembelian`
  MODIFY `id_detailpermintaanpembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `permintaan_barang`
--
ALTER TABLE `permintaan_barang`
  MODIFY `id_permintaanbarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `permintaan_pembelian`
--
ALTER TABLE `permintaan_pembelian`
  MODIFY `id_permintaanpembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `po`
--
ALTER TABLE `po`
  MODIFY `id_po` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user_petugas`
--
ALTER TABLE `user_petugas`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`),
  ADD CONSTRAINT `barang_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);

--
-- Ketidakleluasaan untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD CONSTRAINT `barang_keluar_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user_petugas` (`id_user`),
  ADD CONSTRAINT `barang_keluar_ibfk_2` FOREIGN KEY (`id_permintaanbarang`) REFERENCES `permintaan_barang` (`id_permintaanbarang`);

--
-- Ketidakleluasaan untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD CONSTRAINT `barang_masuk_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user_petugas` (`id_user`),
  ADD CONSTRAINT `barang_masuk_ibfk_2` FOREIGN KEY (`id_permintaanpembelian`) REFERENCES `permintaan_pembelian` (`id_permintaanpembelian`);

--
-- Ketidakleluasaan untuk tabel `detail_permintaanbarang`
--
ALTER TABLE `detail_permintaanbarang`
  ADD CONSTRAINT `detail_permintaanbarang_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `detail_permintaanbarang_ibfk_2` FOREIGN KEY (`id_permintaanbarang`) REFERENCES `permintaan_barang` (`id_permintaanbarang`);

--
-- Ketidakleluasaan untuk tabel `detail_permintaanpembelian`
--
ALTER TABLE `detail_permintaanpembelian`
  ADD CONSTRAINT `detail_permintaanpembelian_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `detail_permintaanpembelian_ibfk_2` FOREIGN KEY (`id_permintaanpembelian`) REFERENCES `permintaan_pembelian` (`id_permintaanpembelian`);

--
-- Ketidakleluasaan untuk tabel `permintaan_barang`
--
ALTER TABLE `permintaan_barang`
  ADD CONSTRAINT `permintaan_barang_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user_petugas` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `permintaan_pembelian`
--
ALTER TABLE `permintaan_pembelian`
  ADD CONSTRAINT `permintaan_pembelian_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user_petugas` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `po`
--
ALTER TABLE `po`
  ADD CONSTRAINT `po_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user_petugas` (`id_user`),
  ADD CONSTRAINT `po_ibfk_2` FOREIGN KEY (`id_permintaanpembelian`) REFERENCES `permintaan_pembelian` (`id_permintaanpembelian`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

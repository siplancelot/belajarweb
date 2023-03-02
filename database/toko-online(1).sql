-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2023 at 07:14 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko-online`
--

-- --------------------------------------------------------

--
-- Table structure for table `checkouts`
--

CREATE TABLE `checkouts` (
  `CheckoutID` int(5) NOT NULL,
  `ProductID` int(5) NOT NULL,
  `UserID` int(5) NOT NULL,
  `CreatedAt` datetime NOT NULL,
  `Status` tinyint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `checkouts`
--

INSERT INTO `checkouts` (`CheckoutID`, `ProductID`, `UserID`, `CreatedAt`, `Status`) VALUES
(1, 6, 2, '2023-01-01 00:00:00', 1),
(2, 13, 1, '2023-02-19 10:02:55', 0),
(3, 14, 1, '2023-02-25 11:02:55', 0),
(4, 14, 2, '2023-02-26 07:13:15', 0),
(5, 13, 2, '2023-02-26 07:39:30', 0),
(6, 14, 2, '2023-02-26 07:45:19', 0),
(7, 14, 2, '2023-02-26 08:47:56', 0),
(8, 14, 2, '2023-02-26 08:48:53', 0),
(9, 14, 2, '2023-02-26 10:17:42', 0),
(10, 14, 2, '2023-02-26 10:18:21', 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(5) NOT NULL,
  `StoreID` int(5) NOT NULL,
  `ProductName` varchar(225) NOT NULL,
  `Category` varchar(225) NOT NULL,
  `Price` int(9) NOT NULL,
  `Image` varchar(225) DEFAULT NULL,
  `IsDeleted` tinyint(5) NOT NULL DEFAULT 0,
  `CreatedAt` datetime DEFAULT NULL,
  `UpdatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `StoreID`, `ProductName`, `Category`, `Price`, `Image`, `IsDeleted`, `CreatedAt`, `UpdatedAt`) VALUES
(6, 1, 'Iphone 11', 'Iphone', 12000000, 'Iphone-13.jpg', 1, '2023-01-27 05:01:18', '2023-01-27 05:01:18'),
(13, 1, 'Samsung S22 Ultra', 'Samsung', 20000000, NULL, 0, '2023-02-19 10:02:55', '2023-02-19 10:02:55'),
(14, 1, 'Asus Nitro 5', 'Laptop', 15000000, NULL, 0, '2023-02-25 07:02:24', '2023-02-25 07:02:24'),
(15, 1, 'Cas Samsung J2 Prime', 'Aksesoris', 20000, NULL, 1, '2023-02-25 08:02:14', '2023-02-25 08:02:14');

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `StoreID` int(5) NOT NULL,
  `UserID` int(5) NOT NULL,
  `StoreName` varchar(50) NOT NULL,
  `Avatar` varchar(225) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`StoreID`, `UserID`, `StoreName`, `Avatar`, `Description`, `City`) VALUES
(1, 1, 'Hp New', 'Hp-New.jpg', 'Hp New adalah toko yang menjual smartphone terkini seprti Iphone, Oppo, Xiaomi, dan Samsung. Toko kami memiliki berbagai stok android ataupun ios terbaru mulai dari harga 1 jutaan hingga  harga puluhan juta!. Tak hanya itu, toko kamu juga menyediakan berbagai aksesoris tambahan untuk smartphone anda. Tunggu apalagi, silahkan melihat-lihat toko kamu dan jangan lupa checkout ya!', 'Jakarta Barat');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(5) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(25) NOT NULL,
  `IsAdmin` tinyint(5) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Username`, `Password`, `IsAdmin`) VALUES
(1, 'admin', '123', 1),
(2, 'valen', '123', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `checkouts`
--
ALTER TABLE `checkouts`
  ADD PRIMARY KEY (`CheckoutID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `StoreID` (`StoreID`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`StoreID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `checkouts`
--
ALTER TABLE `checkouts`
  MODIFY `CheckoutID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `StoreID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `checkouts`
--
ALTER TABLE `checkouts`
  ADD CONSTRAINT `checkouts_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`),
  ADD CONSTRAINT `checkouts_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`StoreID`) REFERENCES `stores` (`StoreID`);

--
-- Constraints for table `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `stores_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

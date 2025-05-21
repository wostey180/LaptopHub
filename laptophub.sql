-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2025 at 09:10 PM
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
-- Database: `laptophub`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `username`) VALUES
(10, 1, 'regan');

-- --------------------------------------------------------

--
-- Table structure for table `cart_product`
--

CREATE TABLE `cart_product` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_product`
--

INSERT INTO `cart_product` (`cart_id`, `product_id`, `quantity`) VALUES
(10, 24, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `total_amount` decimal(10,2) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_date`, `total_amount`, `status`, `user_id`) VALUES
(11, '2025-05-22 00:00:00', 103999.00, 'Completed', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `order_detail_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price_at_purchase` decimal(10,2) DEFAULT NULL,
  `quantity_ordered` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`order_detail_id`, `order_id`, `product_id`, `price_at_purchase`, `quantity_ordered`) VALUES
(15, 11, 23, 103999.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `specs` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `brand`, `model`, `specs`, `price`, `stock_quantity`, `description`, `image_path`) VALUES
(23, 'Macbook Air', 'Apple', 'M1', 'Key Specification:\r\n- 8-core CPU, 7-core GPU, and 16-core Neural Engine\r\n- 8GB Unified Memory | 256GB SSD Storage\r\n- 13.3\" LED-backlit (2560 x 1600) Display\r\n- 2 Years Authorized Warranty | 1 Year Breakage Insurance\r\n- Backlit Keyboard | Genuine VAT Bill', 103999.00, 10, 'Apple MacBook Air M1 Chip (13.3\" (2560 x 1600) Liquid Retina Display | 8GB Unified Memory | 256GB SSD | 8-core CPU | 7-core GPU | 2 Years Authorized Warranty | 1 Year Breakage Insurance | Space Gray)', 'images/products/Macbook Air_Apple_M1_Photo.png'),
(24, 'Aspire Lite', 'Acer', 'Lite', 'Key Specification:\r\n13th Gen Intel Core i3-N300 Processor\r\n8GB DDR5 RAM | 512GB PCIe Gen4 SSD Storage\r\n14-inch WUXGA (1920 x 1200) 16:10 Display\r\nIntel UHD Graphics Card | 1 Year Warranty\r\nFree Laptop Bag, Mouse and Mousepad', 50999.00, 15, 'Acer Aspire Lite (Intel Core i3 N300 Processor | 8GB DDR5 RAM | 512GB NVMe Gen4 SSD | 14-inch WUXGA (1920 x 1200) Display | Intel UHD Graphics | Pure Silver Color | 1 Year Warranty)', 'images/products/Aspire _Acer_Lite_Photo.png'),
(25, 'Alienware M16', 'Dell', 'R2', 'Key Specification:\r\n14th Gen Intel Core Ultra 7 155H Processor\r\n32GB DDR5 RAM | 1TB SSD Storage\r\nNVIDIA GeForce RTX 4070 8GB Graphics Card\r\n16\" QHD+ (2560 x 1600) 240Hz 100% sRGB Display\r\nFree Laptop Bag, Mouse and Mousepad', 289999.00, 14, 'Dell Alienware M16 R2 Gaming Laptop (14th Gen Intel Core Ultra 7 155H Processor | 32GB RAM | 1TB SSD | NVIDIA GeForce RTX 4070 8GB Graphics Card | 16\" QHD+ (2560 x 1600) 240Hz Display | Windows 11 | Per Key RGB | 1 Year Warranty)\r\n', 'images/products/Alienware_Dell_M16_Photo.png'),
(26, 'G15', 'Dell', '5520', 'Key Specification:\r\n12th Generation Intel® Core™ i5-12500H Processor\r\n16GB RAM | 512GB SSD Storage\r\n15.6-inch FHD (1920 x  1080) IPS 120Hz Display\r\nNVIDIA GeForce RTX 3050 4GB Graphics Card\r\nFree Laptop Bag, Gaming Mouse and Mousepad', 121999.00, 15, 'Dell G15 5520 Gaming Laptop (Intel Core i5 12500H Processor | 16GB RAM | 512GB SSD | NVIDIA GeForce RTX 3050 4GB Graphics Card | 15.6-inch FHD (1920 x 1080) IPS 120Hz Display | 2 Years Authorized Warranty)\r\n', 'images/products/G15_Dell_5520_Photo.png'),
(27, 'ROG Strix', 'Asus', 'G16', 'Key Specification:\r\n14th Gen Intel Core i9 14900HX Processor\r\n16GB DDR5 RAM | 1TB SSD Storage\r\nRTX 4070 Graphics | Per-Key RGB Keyboard\r\n16\" WQXGA (2560 x 1600) 240Hz 100% DCI-P3 IPS Display\r\n2 Years Authorized Warranty & 1 Year Breakage Insurance', 313999.00, 15, 'ASUS ROG Strix G16 G614JIR (14th Generation Intel Core i9 14900HX Processor | 16GB RAM | 1TB SSD | RTX 4070 8GB Graphics | 16\" WQXGA (2560 x 1600) 240Hz 100% DCI-P3 IPS Display | 2 Years Warranty & 1 Year ASUS Perfect Warranty)\r\n', 'images/products/ROG Strix_Asus_G16_Photo.png'),
(28, 'GF63', 'MSI', '12UCX ', 'Key Specification:\r\n12th Generation Intel Core i5-12450H Processor\r\n16GB DDR4 RAM | 512GB NVMe PCIe Gen4 SSD\r\nNVIDIA® GeForce RTX™ 2050 Laptop GPU 4GB GDDR6 Graphics\r\n15.6\" FHD (1920x1080), 144Hz, IPS-Level Display\r\n2 Years Warranty\r\nFree MSI Laptop Bag, Mouse and Mousepad', 100000.00, 15, 'MSI Thin GF63 12UCX (12th Gen Intel Core i5-12450H Processor | 16GB DDR4 RAM | 512GB SSD | NVIDIA GeForce RTX 2050 4GB GDDR6 Graphics | 15.6-inc FHD IPS 144Hz Display | 2 Year Warranty)\r\n', 'images/products/GF63_MSI_12UCX _Photo.png'),
(29, 'Predator Helios', 'Acer', 'Neo 16', 'Key Specification:\r\n14th Gen Intel Core i9 14900HX Processor\r\n16GB DDR5 RAM | 1TB SSD Storage\r\nNVIDIA GeForce RTX 4060 8GB Graphics Card\r\n16-inch WUXGA (1920 x 1200) 165Hz IPS Display\r\nFree Laptop Bag, Gaming Mouse, and Mousepad', 191999.00, 15, '[2024] Acer Predator Helios Neo 16 (Intel Core i9 14900HX Processor | 16GB RAM | 1TB SSD | NVIDIA GeForce RTX 4060 8GB Graphics Card | 16-inch WUXGA/WQXGA 165Hz Display | Best Gaming Laptop)\r\n', 'images/products/Predator Helios_Acer_Neo 16_Photo.png'),
(30, 'Inspiron 15', 'Dell', '3520', 'Key Specification:\r\n12th Gen Intel Core i7 1255U Processor\r\n8GB RAM | 512GB SSD Storage\r\n15.6 Inch FHD 120Hz Display | Intel UHD Graphics\r\n1 Year Warranty & Genuine Windows 11\r\nFree Laptop Bag, Wireless Mouse & Mousepad', 100999.00, 15, 'Dell Inspiron 15 3520 (Intel Core i7 - 1255U Processor | 8GB RAM | 512GB SSD | Intel UHD Graphics | 15.6\" FHD 120Hz Display)\r\n', 'images/products/Inspiron 15_Dell_3520_Photo.png'),
(31, 'Legion 5', 'Lenovo', 'Legion', 'Key Specifications\r\nIntel Hexa-Core i7-10750H Processor (2.6GHz, up to 5.0GHz,12MB cache, 6 cores)\r\n24GB DDR4 RAM, 512GB SSD, Nvidia GTX 1650Ti\r\n15.6-inch FHD IPS Non-Touch 120Hz Display(1920×1080), Backlit Keyboard\r\n802.11ax + Bluetooth 5.0, Windows 10 Home 64 bit\r\n1 x USB 3.1 Type-C, 4 x USB 3.1 Type-A, 1 x HDMI, 1 x RJ45', 199999.00, 15, 'Lenovo Legion 5 15.6-inch FHD 120Hz Gaming Laptop PC, Intel Hexa-Core i7-10750H, Nvidia GTX 1650Ti, 24GB DDR4 RAM, 512GB SSD, Backlit Keyboard, Windows 10 Home 64 bit, Black\r\n', 'images/products/Legion 5_Lenovo_Legion_Photo.png'),
(32, 'Legion 7', 'Lenovo', '16IRX9 ', 'Key Specification:\r\n13th Generation Intel Core i7 13650HX Processor\r\n24GB DDR5 RAM | 1TB SSD Storage\r\nNVIDIA GeForce RTX 4060 8GB Graphics Card\r\n16\" WQXGA (2560 x 1600) 165Hz 100% sRGB IPS Display\r\n4-Zone RGB Backlit Keyboard | 1-Year Warranty\r\nFree Laptop Bag, Gaming Mouse, and Mousepad', 189000.00, 15, 'Lenovo Legion 7 16IRX9 (13th Generation Intel Core i7 13650HX Processor | 24GB RAM | 1TB SSD | NVIDIA GeForce RTX 4060 8GB Graphics Card | 16-inch WQXGA (2560 x 1600) 165Hz Display | 4-Zone RGB Backlit Keyboard | 2 Year Authorized Warranty)\r\n', 'images/products/Legion 7_Lenovo_16IRX9 _Photo.png'),
(33, 'LOQ 15', 'Lenovo', '15ARP9', 'Key Specification:\r\nAMD Ryzen 7 7435HS Processor\r\n24GB DDR5 RAM | 512GB SSD Storage\r\nNVIDIA GeForce RTX 4060 8GB Graphics Card\r\n15.6-inch FHD (1920 x 1080) 144Hz 100% sRGB IPS Display\r\nFree Laptop Bag, Gaming Mouse, and Mousepad', 154999.00, 15, 'Lenovo LOQ 15ARP9 (AMD Ryzen 7 7435HS Processor | 24GB RAM | 512GB SSD | NVIDIA GeForce RTX 4060 8GB Graphics Card | 15.6-inch FHD (1920 x 1080) 144Hz Display | 1 Year Warranty)\r\n', 'images/products/LOQ _Lenovo_15ARP9_Photo.png'),
(34, 'Modern 15', 'MSI', 'B12M ', 'Key Specification:\r\n12th Generation Intel Core i7 1255U Processor\r\n16GB RAM | 512GB SSD Storage\r\n15.6\" FHD (1920 x 1080) IPS Display\r\nIntel Iris Xe Graphics | 1 Year Warranty\r\nFree Laptop Bag, Mouse and Mousepad', 98999.00, 15, 'MSI Modern 15 B12M (12th Gen Intel Core i7 1255U Processor | 16GB RAM | 512GB Storage | 15.6\" FHD (1920 x 1080) Display | Intel Iris Xe Graphics | Backlit Keyboard | 1 Year Warranty)\r\n', 'images/products/Modern 15_MSI_B12M _Photo.png'),
(35, 'Nitro 5', 'Acer', 'AN515', 'Key Specification:\r\n12th Gen Intel Core i7 12650H Processor\r\n16GB DDR5 RAM | 512GB SSD Storage\r\n15.6 Inch FHD 144Hz Display | RTX 4060 8GB Graphics\r\n1 Year Warranty\r\nFree Laptop Bag, Mouse and Mousepad', 159999.00, 15, 'Acer Nitro 5 AN515 2023 (Intel Core i7 - 12650H Processor | 16GB RAM | 512GB SSD | NVIDIA RTX 4060 8GB Graphics | 15.6\" FHD 144Hz Display)\r\n', 'images/products/Nitro 5_Acer_AN515_Photo.png'),
(36, 'Macbook Pro', 'Apple', 'M1', 'Key Specification:\r\n8-core CPU, 8-core GPU, 16-core Neural Engine\r\nWith 4 performance cores and 4 efficiency cores\r\n8GB Unified Memory | 512GB SSD Storage\r\n13.3-inch (diagonal) LED-backlit display with IPS technology\r\n1 Year Global Warranty\r\nFree Macbook Sleeve', 180000.00, 15, 'Apple MacBook Pro 2020 M1 Chip (13.3 inch | 8GB RAM | 512GB SSD | 8-core CPU | 8-core GPU )\r\n', 'images/products/Macbook Pro_Apple_M1_Photo.png'),
(37, 'TUF A15', 'Asus', 'FA507', 'Key Specification:\r\nAMD Ryzen 7 7435HS Processor\r\n16GB DDR5 RAM | 512GB SSD Storage\r\n15.6 Inch FHD 144Hz Display | RTX 4050 Graphics\r\nFree Bag, Mouse and Mousepad', 159998.98, 15, 'ASUS TUF Gaming A15 FA507 (AMD Ryzen 7 7435HS Processor | 16GB RAM | 512GB SSD | NVIDIA RTX 4050 6GB Graphics Card | 15.6\" FHD 144Hz Display)\r\n', 'images/products/TUF_Asus_A15 FA507_Photo.png'),
(38, 'Vivobook V16', 'Asus', 'V3607VJ', 'Key Specification:\r\n15th Gen Intel Core 7 240H Series 2 Processor\r\n16GB DDR5 RAM | 1TB Gen4 SSD Storage\r\nRTX 3050 6GB Graphics | Windows 11 Home\r\n16\" WUXGA (1920 x 1200) 16:10 LED Display\r\n2 Years ASUS Authorized Warranty + 1 Year Perfect Warranty\r\nFree Laptop Bag, Gaming Mouse & Mousepad', 179999.00, 15, '2025\'s ASUS VivoBook V16 V3607VJ Gaming Laptop (15th Gen Intel Core 7 240H Series 2 Processor | 16GB RAM | 1TB SSD | RTX 3050 6GB Graphics | 16\" WUXGA (1920 x 1200) LED Display | Backlit Keyboard | 2 Years Authorized Warranty + 1 Year Perfect Warranty)\r\n', 'images/products/Vivobook_Asus_V16 V3607VJ_Photo.png'),
(39, 'Vivobook 14x', 'Asus', 'M1405YA-LY098W', 'Key Specification:\r\nAMD Ryzen 7 7730U Processor\r\n8GB RAM | 512GB M.2 SSD\r\n14-inch FHD WUXGA IPS Display\r\n2 Years Authorized Warranty\r\nFree Laptop Bag, Mouse and Mousepad', 89999.00, 15, 'ASUS VivoBook 14x M1405YA-LY098W (AMD Ryzen 7-7730U Processor| 8GB RAM | 512GB SSD | AMD Radeon Graphics | 14\" FHD WUXGA IPS Display | 2 Years Warranty)\r\n', 'images/products/Vivobook 14x_Asus_M1405YA-LY098W_Photo.png'),
(40, 'Vostro 15', 'Dell', '3520 ', 'Key Specification:\r\n12th Generation Intel Core i5-1235U Processor\r\n8GB DDR4 RAM | 512GB SSD Storage\r\n15.6 Inch FHD | Intel UHD Graphics Card\r\n1 Year Warranty | Windows 11 Home\r\nFree Laptop Bag, Mouse and Mousepad', 63999.00, 14, 'Dell Vostro 15 3520 (Intel Core i5 - 1235U Processor | 8GB RAM | 512GB SSD | Intel UHD Graphics Card | 15.6\" FHD Display)\r\n', 'images/products/Vostro 15_Dell_3520 _Photo.png'),
(41, 'ZenBook 14', 'Asus', 'UX3405MA ', 'Key Specification:\r\nIntel Core Ultra 7 155H Processor\r\n16GB RAM | 1TB SSD Storage\r\n14-inch 3K (2880 x 1800) 120Hz OLED Display\r\nIntel Arc Graphics | Genuine Windows 11 Home\r\n2 Years Authorized Warranty & 1 Year ASUS Perfect Warranty\r\nFree ASUS Premium Sleeve, Mouse and Mousepad', 185000.00, 15, '[2024] ASUS ZenBook 14 OLED UX3405MA (AI-integrated Intel Core Ultra 7 155H Processor | 16GB RAM | 1TB SSD | 14-inch 3K (2880 x 1800) 120Hz OLED Display | Intel Arc Graphics | 2 Years Authorized Warranty & 1 Year Asus Perfect Warranty)\r\n', 'images/products/ZenBook 14_Asus_UX3405MA _Photo.png'),
(42, 'Zephyrus G15', 'Asus', 'GA503RM', 'Key Specification:\r\nAMD Ryzen 9 6900HS Processor\r\n16GB DDR5 RAM | 1TB SSD Storage\r\n15.6\" WQHD 165Hz Display | GeForce RTX 3060 GPU \r\n2 Year Authorized Warranty & Genuine VAT Bill\r\nOfficial ROG Bag pack, ROG Gaming Mouse & Mousepad.', 200000.00, 15, 'Asus ROG Zephyrus G15 GA503RM (AMD Ryzen 9 - 6900HS | 16GB RAM | 1TB SSD | RTX 3060 Graphics | 15.6 WQHD 165Hz Display)\r\n', 'images/products/Zephyrus G15_Asus_GA503RM_Photo.png');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_address` text DEFAULT NULL,
  `user_phone` varchar(15) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `user_role` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `user_email`, `user_password`, `user_address`, `user_phone`, `image_path`, `user_role`) VALUES
(1, 'regan', 'regan2@gmail.com', 'q4KtduyTeVdhXXXMbAIpoKfrLDohcypnXqCFvv8mSpvbry+0+ufZB54XKYfu0yJ3yQ==', 'basundhara', '9812345678', 'images/userimgs/regan_Photo.jpeg', 'user'),
(2, 'admin', 'admin@gmail.com', 'kAUnITt+4tkmvP0rSxaD++3dP2cS4MQBvB7J7vEWboj4Dq25HtUiAAMnRbox', 'admin', '9812345678', 'images/userimgs/admin_Photo.png', 'admin'),
(12, 'test', 'test2@gmail.com', 'wfV5utD7OFLWoiymo1e0vUT29FZiCUxRo7VgTazzQdskiKIIZGY7VAA/+Aek', '12311', '122', 'images/userimgs/test_Photo.png', 'user'),
(13, 'ayush', 'ayush123@gmail.com', 'Kz3GTTYZNrJy7CIVEK9JmoXWdqRBj2jegICfPZbiDmDOClRlNrDFxtKe7KF2Zf21bw==', 'lalitpur', '9123456789', 'images/userimgs/ayush_Photo.png', 'user'),
(14, 'testcase1', 'test@gmail.com', 'hndjdyRvdvnvHL/abXmES/ifvHurXa/OCdnJWMDllkv79p5xoJ/J+Kn8DD/aS1kC', 'testing change', '9801000000', 'images/userimgs/testcase1_Photo.png', 'user'),
(15, 'rabina12', 'rabina122@gmail.com', 'H5VdtoiAKG3+bmTyEgVZ+xickDFmkEMuOKiiefn8egMd6w0+FPKw/1FmOUtx4muGkQEvV6owXg==', 'ktm', '9876543210', 'images/userimgs/rabina12_Photo.jpeg', 'user'),
(16, 'admin@gmail.com', 'wwd@gmail.com', 'fqrcPuGRZ0UM2wJ2mOWyyPZs0uxF1k5oUyH0M//r5YTUfbbXsO9ivd4VldSjsQ==', '233', '0987654321', 'images/userimgs/admin@gmail.com_Photo.png', 'user'),
(17, 'test21', 'test21@gmail.com', 'UOU7IhmLuEGHJ1joR4GHSmclyfiN4WV9End700M30tGuMNCGV1aFP8Wpdh/k', 'Bhaktapur', '9801010901', 'images/userimgs/test21_Photo.jpg', 'user'),
(19, 'gif', 'gin@jsa', 'fgZgC6PkC+OOzZZhAE1QbkOJH8Jf7hc7QlOck0I7XrJDLP2pZfVk0NfPQqpq', '1', '1', 'images/userimgs/gif_Photo.gif', 'user'),
(20, 'regan2', 'wostiayush62@gmail.com', 'N/gGRGSjvW0MI02I8M6mTG4eUxnxcTl0aLTIKZJLuNe/+A54Xyh+xR74+7hqCm+BIw==', 'regan', '9123456789', 'images/userimgs/default.png', 'user'),
(23, 'regan3', 'wostiayush62@gmail.com', '2o3ALOIARAr0sfAPKo1i4rpd/TJdUUfoIITGEiDkjQwqV2Mt5dwFAC/AeIUPkfdI7Q==', 'regan', '9123456789', 'images/userimgs/regan3_Photo.jpeg', 'user'),
(24, 'swave', 'shresthasuave@gmail.com', '/e9g7ko1L6Y6dTysbrB7C4cfPExzrtBq9obkn7BDwKY4jQKuG/uvvmIjDdE+KYLggw==', 'thamel', '9860931063', 'images/userimgs/swave_Photo.png', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_product`
--
ALTER TABLE `cart_product`
  ADD PRIMARY KEY (`cart_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `cart_product`
--
ALTER TABLE `cart_product`
  ADD CONSTRAINT `cart_product_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  ADD CONSTRAINT `cart_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

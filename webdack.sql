-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2021 at 07:46 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webdack`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(255) NOT NULL,
  `Position` int(11) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CategoryID`, `CategoryName`, `Position`) VALUES
(6, 'Điện thoại', 1),
(2, 'Máy tính bảng', 2),
(3, 'Đồng hồ thông minh', 3),
(7, 'Tai nghe', 4),
(8, 'Cáp sạc, dây sạc', 6),
(9, 'Pin, sạc dự phòng', 6);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `GroupID` int(11) NOT NULL,
  `GroupName` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`GroupID`, `GroupName`) VALUES
(1, 'Admin'),
(3, 'Khách hàng');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE `manufacturers` (
  `ManufacturerID` int(11) NOT NULL,
  `ManufacturerName` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`ManufacturerID`, `ManufacturerName`) VALUES
(13, 'Apple'),
(10, 'SamSung'),
(11, 'Oppo'),
(14, 'Xiaomi'),
(15, 'Huawei'),
(17, 'Vivo'),
(18, 'Realme'),
(19, 'Anker'),
(20, 'Lenovo'),
(21, 'Sony'),
(22, 'Energizer');

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`OrderID`, `ProductID`, `Quantity`) VALUES
(48, 52, 1),
(48, 35, 1),
(54, 69, 2),
(56, 72, 1),
(56, 71, 1),
(58, 69, 16),
(59, 69, 1),
(61, 69, 2),
(61, 71, 1),
(64, 69, 12),
(65, 72, 1),
(65, 51, 1),
(66, 71, 1),
(66, 70, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `AddedDate` datetime NOT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Sum` int(11) DEFAULT NULL,
  `Status` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `UserID`, `AddedDate`, `Address`, `Phone`, `Sum`, `Status`) VALUES
(66, 46, '2021-12-19 15:27:00', 'bình định', '123456', 51980000, b'0'),
(65, 45, '2021-12-19 14:37:17', 'bình định', '123', 50480000, b'0'),
(61, 41, '2021-12-06 14:56:08', '123 hung vuong', '0866849018', 118970000, b'0'),
(64, 44, '2021-12-07 13:21:04', '123 hùng vương', '0866849018', 443880000, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `ManufacturerID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `ProductName` varchar(255) NOT NULL,
  `ImageUrl` varchar(255) NOT NULL,
  `Price` int(11) NOT NULL DEFAULT 0,
  `Quantity` int(11) NOT NULL DEFAULT 0,
  `Description` varchar(1000) NOT NULL,
  `Body` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `ManufacturerID`, `CategoryID`, `ProductName`, `ImageUrl`, `Price`, `Quantity`, `Description`, `Body`) VALUES
(69, 13, 6, 'iPhone 13 Pro Max 256GB', '947639797ip13.jpg', 36990000, 30, 'iPhone 13 Pro Max 256GB - siêu phẩm mang trên mình bộ vi xử lý Apple A15 Bionic hàng đầu, màn hình Super Retina XDR 120 Hz, cụm camera khẩu độ f/1.5 cực lớn, tất cả sẽ mang lại cho bạn những trải nghiệm tuyệt vời chưa từng có', 'Màn hình:\r\nOLED6.7\"Super Retina XDR.\r\nHệ điều hành: iOS 15.\r\nCamera sau: 3 camera 12 MP.\r\nCamera trước: 12 MP.\r\nChip: Apple A15 Bionic.\r\nRAM: 6 GB.\r\nBộ nhớ trong: 256 GB.\r\nSIM: 1 Nano SIM & 1 eSIMHỗ trợ 5G.\r\nPin, Sạc: 4352 mAh20 W'),
(70, 11, 6, ' OPPO A95', '1152743176oppo-a95-4g-bac-1-1.jpg', 6990000, 30, 'Bên cạnh phiên bản 5G, OPPO còn bổ sung phiên bản OPPO A95 4G với giá thành phải chăng tập trung vào thiết kế năng động, sạc nhanh và hiệu năng đa nhiệm ấn tượng sẽ giúp cho cuộc sống của bạn thêm phần hấp dẫn, ngập tràn niềm vui.', 'Màn hình:\r\n\r\nAMOLED6.43\"Full HD+\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nCamera sau:\r\n\r\nChính 48 MP & Phụ 2 MP, 2 MP\r\nCamera trước:\r\n\r\n16 MP\r\nChip:\r\n\r\nSnapdragon 662\r\nRAM:\r\n\r\n8 GB\r\nBộ nhớ trong:\r\n\r\n128 GB\r\nSIM:\r\n\r\n2 Nano SIMHỗ trợ 4G\r\nPin, Sạc:\r\n\r\n5000 mAh33 W'),
(71, 10, 6, 'Samsung Galaxy Z Fold3 5G 512GB', '789776877samsung-galaxy-z-fold-3-green-1-600x600.jpg', 44990000, 15, 'Galaxy Z Fold3 5G đánh dấu bước tiến mới của Samsung trong phân khúc điện thoại gập cao cấp khi được cải tiến về độ bền cùng những nâng cấp đáng giá về cấu hình hiệu năng, hứa hẹn sẽ mang đến trải nghiệm sử dụng đột phá cho người dùng.', 'Màn hình:\r\n\r\nDynamic AMOLED 2XChính 7.6\" & Phụ 6.2\"Full HD+\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nCamera sau:\r\n\r\n3 camera 12 MP\r\nCamera trước:\r\n\r\n10 MP & 4 MP\r\nChip:\r\n\r\nSnapdragon 888\r\nRAM:\r\n\r\n12 GB\r\nBộ nhớ trong:\r\n\r\n512 GB\r\nSIM:\r\n\r\n2 Nano SIM + 1 eSIMHỗ trợ 5G\r\nPin, Sạc:\r\n\r\n4400 mAh25 W'),
(72, 17, 6, 'Vivo V23e', '452061097Vivo-V23e-1-2-600x600.jpg', 8490000, 30, 'Vivo V23e - sản phẩm tầm trung được đầu tư lớn về khả năng selfie cùng ngoại hình mỏng nhẹ, bên cạnh thiết kế vuông vức theo xu hướng hiện tại thì V23e còn có hiệu năng tốt và một viên pin có khả năng sạc cực nhanh', 'Màn hình:\r\n\r\nAMOLED6.44\"Full HD+\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nCamera sau:\r\n\r\nChính 64 MP & Phụ 8 MP, 2 MP\r\nCamera trước:\r\n\r\n50 MP\r\nChip:\r\n\r\nMediaTek Helio G96 8 nhân\r\nRAM:\r\n\r\n8 GB\r\nBộ nhớ trong:\r\n\r\n128 GB\r\nSIM:\r\n\r\n2 Nano SIM (SIM 2 chung khe thẻ nhớ)Hỗ trợ 4G\r\nPin, Sạc:\r\n\r\n4050 mAh44 W'),
(51, 13, 2, 'iPad Pro M1 12.9 inch WiFi Cellular 512GB (2021)', '1685162856ipad-pro-2021-129-inch-gray-thumb-600x600.jpg', 41990000, 25, 'iPad Pro M1 12.9 inch Wifi 512GB (2021) là dòng máy tính bảng cao cấp của Apple với nhiều nâng cấp đáng chú ý như chip Apple M1 giống trên MacBook và màn hình mini-LED mới cùng nhiều đột phá công nghệ dẫn đầu khác mang đến trải nghiệm làm việc và giải trí đỉnh cao.', 'Màn hình:\r\n\r\n12.9\"Liquid Retina XDR mini-LED LCD\r\nHệ điều hành:\r\n\r\niPadOS 14\r\nChip:\r\n\r\nApple M1 8 nhân\r\nRAM:\r\n\r\n8 GB\r\nBộ nhớ trong:\r\n\r\n512 GB\r\nKết nối:\r\n\r\n5GNghe gọi qua FaceTime\r\nSIM:\r\n\r\n1 Nano SIM hoặc 1 eSIM\r\nCamera sau:\r\n\r\nChính 12 MP & Phụ 10 MP, TOF 3D LiDAR\r\nCamera trước:\r\n\r\n12 MP\r\nPin, Sạc:\r\n\r\n40.88 Wh (~ 10.835 mAh)20 W'),
(52, 13, 7, 'Tai nghe Bluetooth AirPods Pro Wireless Charge', '1946310442tai-nghe-bluetooth-airpods-pro-apple-mwp22-thumb-600x600.jpg', 4990000, 30, 'AirPods Pro với thiết kế gọn gàng, đẹp và tinh tế, tai nghe được thiết kế theo dạng In-ear thay vì Earbuds như AirPods 2, cho phép chống ồn tốt hơn, khó rớt khi đeo và đặc biệt là êm tai hơn.', 'Thời gian tai nghe:\r\n\r\nDùng 4.5 giờ - Sạc 2 giờ\r\nThời gian hộp sạc:\r\n\r\nDùng 24 giờ - Sạc 3 giờ\r\nCổng sạc:\r\n\r\nLightningSạc không dây\r\nCông nghệ âm thanh:\r\n\r\nActive Noise CancellationAdaptive EQTransparency Mode\r\nTương thích:\r\n\r\nAndroidiOS (iPhone)\r\nỨng dụng kết nối:\r\n\r\nSiri\r\nTiện ích:\r\n\r\nChống nướcChống ồnCó mic thoại\r\nHỗ trợ kết nối:\r\n\r\nBluetooth 5.0\r\nĐiều khiển bằng:\r\n\r\nCảm ứng chạm'),
(64, 13, 7, 'Tai nghe Bluetooth AirPods 2 Apple MV7N2 ', '266963494bluetooth-airpods-2-apple-mv7n2-imei-ava-600x600.jpg', 2990000, 60, 'Tai nghe Bluetooth AirPods 2 Apple MV7N2 Trắng vẫn giữ cho mình thiết kế hiện đại, cao cấp, hợp thời trang', 'Pin:\r\n\r\nDùng 5 giờ - Sạc 2 giờ\r\nCổng sạc:\r\n\r\nLightning\r\nTương thích:\r\n\r\nAndroidiOS (iPhone)\r\nỨng dụng kết nối:\r\n\r\nSiri\r\nTiện ích:\r\n\r\nCó mic thoại\r\nĐiều khiển bằng:\r\n\r\nCảm ứng chạm'),
(65, 13, 7, 'Tai nghe chụp tai Bluetooth AirPods Max Apple MGYH3', '232970830bluetooth-airpods-max-apple-ava-600x600.jpg', 13990000, 10, 'Tai Bluetooth AirPods Max Apple MGYH3/ MGYJ3/ MGYL3 dễ dàng cuốn hút bạn ngay từ cái nhìn đầu tiên, với nét sang trọng và cực kỳ tinh tế đến từ sự tối giản trong thiết kế và màu sắc, tạo sự khác biệt ấn tượng với các sản phẩm tai nghe hiện có trên thị trường', 'Pin:\r\n\r\nDùng 20 giờ - Sạc 3 giờ\r\nCổng sạc:\r\n\r\nLightning\r\nCông nghệ âm thanh:\r\n\r\nActive Noise CancellationAdaptive EQSpatial AudioTransparency Mode\r\nTương thích:\r\n\r\nAndroidiOS (iPhone)\r\nTiện ích:\r\n\r\nChống ồn\r\nĐiều khiển bằng:\r\n\r\nPhím nhấn'),
(66, 13, 7, 'Tai nghe nhét tai Earpods Apple MNHF2', '1697716692tai-nghe-earpods-apple-md827fea-avatar-1-600x600.jpg', 790000, 100, 'Thiết kế hiện đại, sang trọng và thoải mái.\r\nCó phím điều chỉnh âm lượng, nghe/nhận cuộc gọi.\r\nCổng 3.5mm phù hợp nhiều loại điện thoại, máy tính bảng, laptop.\r\nSản phẩm chính hãng Apple, nguyên seal 100%.\r\nLưu ý: Thanh toán trước khi mở seal.', 'Jack cắm:\r\n\r\n3.5 mm\r\nTương thích:\r\n\r\nAndroidiOS (iPhone)WindowsWindows Phone\r\nTiện ích:\r\n\r\nCó mic thoại\r\nĐiều khiển bằng:\r\n\r\nPhím nhấn\r\nPhím điều khiển:\r\n\r\nChuyển bài hátMic thoạiNghe/nhận cuộc gọiPhát/dừng chơi nhạcTăng/giảm âm lượng'),
(49, 13, 3, 'Apple Watch S6 40mm viền nhôm dây cao su', '350217503apple-watch-s6-40mm-vien-nhom-day-cao-su-hong-thumb-1-600x600.jpg', 8992000, 20, 'Apple Watch S6 mang đến những nâng cấp hữu ích để hỗ trợ người dùng một cách tối ưu nhất. Nổi bật trong số đó là chip xử lý S6 cải thiện hiệu năng, hệ điều hành watchOS 7 với nhiều tính năng mới hứa hẹn sẽ mang đến những trải nghiệm tốt hơn, thú vị hơn', 'Màn hình:\r\n\r\nOLED1.57 inch\r\nThời lượng pin:\r\n\r\nKhoảng 1.5 ngày\r\nKết nối với hệ điều hành:\r\n\r\niOS 14 trở lên\r\nMặt:\r\n\r\nIon-X strengthened glass40 mm\r\nTính năng cho sức khỏe:\r\n\r\nChế độ luyện tậpTheo dõi giấc ngủTính lượng calories tiêu thụTính quãng đường chạyĐiện tâm đồĐo nhịp timĐo nồng độ oxy (SpO2)Đếm số bước chân'),
(58, 13, 2, 'iPad Air 4 Wifi 64GB (2020)', '196609957ipad-4-cellular-den-new-600x600-600x600.jpg', 17790000, 33, 'Apple đã trình làng máy tính bảng iPad Air 4 Wifi 64 GB (2020). Đây là thiết bị đầu tiên của hãng được trang bị chip A14 Bionic - chip di động mạnh nhất của Apple (năm 2020). Và có màn lột xác nhờ thiết kế được thừa hưởng từ iPad Pro với viền màn hình mỏng bo cong quanh máy', 'Màn hình:\r\n\r\n10.9\"Liquid Retina\r\nHệ điều hành:\r\n\r\niPadOS 14\r\nChip:\r\n\r\nApple A14 Bionic\r\nRAM:\r\n\r\n4 GB\r\nBộ nhớ trong:\r\n\r\n64 GB\r\nKết nối:\r\n\r\nNghe gọi qua FaceTime\r\nCamera sau:\r\n\r\n12 MP\r\nCamera trước:\r\n\r\n7 MP\r\nPin, Sạc:\r\n\r\n28.65 Wh (~ 7600 mAh)20 W'),
(54, 13, 2, 'iPad Pro M1 11 inch WiFi Cellular 512GB', '711531571ipad-pro-2021-11-inch-gray-thumb-600x600.jpg', 33990000, 25, 'iPad Pro M1 11 inch WiFi Cellular 512GB (2021) có thiết kế sang trọng, màn hình công nghệ Liquid Retina cho hình ảnh hiển thị sắc nét cùng với con chip M1 mang lại hiệu năng vô cùng mạnh mẽ giúp bạn thỏa sức sáng tạo trong các tác vụ đồ họa nâng cao hay chơi game, giải trí tốt hơn nhờ các công nghệ nổi bật đi kèm', 'Màn hình:\r\n\r\n11\"Liquid Retina\r\nHệ điều hành:\r\n\r\niPadOS 14\r\nChip:\r\n\r\nApple M1 8 nhân\r\nRAM:\r\n\r\n8 GB\r\nBộ nhớ trong:\r\n\r\n512 GB\r\nKết nối:\r\n\r\n5GNghe gọi qua FaceTime\r\nSIM:\r\n\r\n1 Nano SIM hoặc 1 eSIM\r\nCamera sau:\r\n\r\nChính 12 MP & Phụ 10 MP, TOF 3D LiDAR\r\nCamera trước:\r\n\r\n12 MP\r\nPin, Sạc:\r\n\r\n28.65 Wh (~ 7538 mAh)20 W'),
(56, 13, 2, 'iPad mini 6 WiFi 64GB ', '1494840679ipad-mini-6-wifi-cellular-pink-1-600x600.jpg', 15990000, 23, 'Sau thời gian dài chờ đợi thì tháng 09/2021 iPad mini 6 WiFi 64GB cũng đã được Apple trình làng với thiết kế vừa quen thuộc vừa mới lạ, máy có nhiều cải tiến trong cấu hình lẫn phần mềm nhằm gia tăng lợi ích sử dụng, mang lại sự hài lòng cao hơn cho người dùng khi lựa chọn', 'Màn hình:\r\n\r\n8.3\"LED-backlit IPS LCD\r\nHệ điều hành:\r\n\r\niPadOS 15\r\nChip:\r\n\r\nApple A15 Bionic\r\nRAM:\r\n\r\n4 GB\r\nBộ nhớ trong:\r\n\r\n64 GB\r\nKết nối:\r\n\r\nNghe gọi qua FaceTime\r\nCamera sau:\r\n\r\n12 MP\r\nCamera trước:\r\n\r\n12 MP\r\nPin, Sạc:\r\n\r\n19.3 Wh20 W'),
(42, 13, 6, 'iPhone SE 64GB (2020) (Hộp mới) ', '588941635iphone-se-2020-trang-600x600-600x600.jpg', 11990000, 20, 'iPhone SE 2020 đã bất ngờ ra mắt với thiết kế 4.7 inch nhỏ gọn, chip A13 Bionic mạnh mẽ như trên iPhone 11 và đặc biệt sở hữu mức giá tốt chưa từng có', 'Màn hình:\r\n\r\nIPS LCD4.7\"Retina HD\r\nHệ điều hành:\r\n\r\niOS 14\r\nCamera sau:\r\n\r\n12 MP\r\nCamera trước:\r\n\r\n7 MP\r\nChip:\r\n\r\nApple A13 Bionic\r\nRAM:\r\n\r\n3 GB\r\nBộ nhớ trong:\r\n\r\n64 GB\r\nSIM:\r\n\r\n1 Nano SIM & 1 eSIMHỗ trợ 4G\r\nPin, Sạc:\r\n\r\n1821 mAh18 W'),
(61, 13, 8, 'Cáp Type C - Lightning 1m Apple MM0A3 Trắng', '1071187584cap-type-c-lightning-1m-apple-mm0a3-trang-thumb-600x600.jpeg', 590000, 100, 'Cáp sạc màu trắng sang trọng, có chiều dài 1 m, phù hợp dùng tại nhà, công ty.\r\nSạc pin mạnh mẽ với mức công suất lên đến 87 W. \r\nĐồng bộ hóa dữ liệu hiệu quả giữa điện thoại và laptop. \r\nĐầu vào Type-C và đầu ra Lightning sử dụng với các thiết bị Apple, adapter sạc, sạc dự phòng.\r\nMẫu dây cáp Apple MM0A3 giống Apple MX0K2, chỉ khác mã lô.\r\nHàng chính hãng Apple, nguyên seal 100%.\r\nLưu ý: Thanh toán trước khi mở seal.', 'Chức năng\r\n\r\nSạcTruyền dữ liệu\r\nĐầu vào\r\n\r\nUSB Type-C\r\nĐầu ra\r\n\r\nLightning\r\nĐộ dài dây\r\n\r\n1 m\r\nCông suất tối đa\r\n\r\n87 W\r\nSản xuất tại\r\n\r\nTrung Quốc\r\nThương hiệu của\r\n\r\nMỹ'),
(62, 13, 8, 'Cáp sạc không dây Apple Watch Magnetic 0.3m Apple MX2G2 Trắng', '11090461674-cap-sac-apple-watch-magnetic-1m-apple-mx2e2-1-600x600.jpg', 790000, 100, 'Cáp sạc Apple Watch Magnetic 0.3m Apple MX2G2 Trắng với thiết kế gọn nhẹ cùng màu sắc trang nhã giúp bạn dễ dàng mang theo bên người để nạp năng lượng cho thiết bị của bạn lúc cần thiết.', 'Công nghệ/Tiện ích\r\n\r\nMagsafe\r\nChức năng\r\n\r\nSạc\r\nĐầu vào\r\n\r\nUSB Type-A\r\nĐầu ra\r\n\r\nĐế nam châm từ tính\r\nĐộ dài dây\r\n\r\n30 cm\r\nSản xuất tại\r\n\r\nViệt Nam/Trung Quốc (tùy lô hàng)\r\nThương hiệu của\r\n\r\nMỹ'),
(63, 13, 8, 'Adapter chuyển đổi Type C sang HDMI/Type C/USB Apple MUF82 Trắng', '1807125576adapter-type-c-sang-hdmi-type-c-usb-apple-muf82-avatar-1-600x600.jpg', 2290000, 300, 'Adapter chuyển đổi Type C sang HDMI/Type C/USB Apple MUF82 Trắng có thiết kế nhỏ gọn, sang trọng giúp người dùng dễ dàng mang theo bên mình sử dụng. Adapter là sản phẩm chính hãng của Apple được thiết kế cho Macbook và iPad Pro', 'Công nghệ/Tiện ích\r\n\r\nKhông có\r\nModel\r\n\r\nMUF82\r\nChức năng\r\n\r\nChuyển đổi cổng kết nốiSạc\r\nĐầu vào\r\n\r\nType-C\r\nĐầu ra\r\n\r\n1 cổng USB\r\n\r\nHDMI\r\n\r\nUSB Type-C\r\n\r\nJack kết nối\r\n\r\nType-C\r\nKích thước\r\n\r\nDài 15.9 cm - Rộng 6.6 cm - Dày 1.78 cm - Nặng 45 g\r\nSản xuất tại\r\n\r\nViệt Nam / Trung Quốc (tùy lô hàng)\r\nThương hiệu của\r\n\r\nMỹ'),
(45, 13, 3, 'Apple Watch Series 7 LTE 45mm viền thép', '1265541765applewatch7.jpeg', 21990000, 30, 'Apple Watch Series 7 LTE 45mm viền thép là một phiên bản nâng cấp nhè nhẹ so với S6, sở hữu đường nét thiết kế có phần tinh tế hơn và màn hình lớn hơn để thao tác vuốt chạm dễ dàng. Dây đeo chất liệu silicone êm ái, co giãn tốt, chống thấm mồ hôi mang lại cảm giác thoải mái cho người dùng.\r\n\r\n', 'Màn hình:\r\n\r\nOLED1.77 inch\r\nThời lượng pin:\r\n\r\nKhoảng 1.5 ngày\r\nKết nối với hệ điều hành:\r\n\r\niOS 15 trở lên\r\nMặt:\r\n\r\nKính Sapphire45 mm\r\nTính năng cho sức khỏe:\r\n\r\nChế độ luyện tậpTheo dõi giấc ngủTính lượng calories tiêu thụTính quãng đường chạyĐiện tâm đồĐo nhịp timĐo nồng độ oxy (SpO2)Đếm số bước chân'),
(55, 13, 2, 'iPad mini 7.9 inch Wifi Cellular 64GB (2019)', '1586990155ipad-mini-79-inch-wifi-cellular-64gb-2019-gold-600x600-1-600x600.jpg', 15790000, 30, 'iPad mini 7.9 inch Wifi Cellular 64GB (2019) đánh dấu sự trở lại mạnh mẽ của Apple trong phân khúc máy tính bảng nhỏ gọn, có thể dễ dàng mang theo bên mình', ''),
(154, 13, 6, 'ip xs', '78432103ảnhphóngtobịvỡvàìnhchéolộnềntrắng.png', 100000, 25, 'Hàng xách tay', '99%'),
(46, 13, 3, 'Apple Watch Series 7 LTE 41mm dây thép', '1370582884apple-watch-s7-lte-41mm-day-thep-bac-thumb-1-600x600.jpg', 20990000, 20, 'Apple Watch S7 LTE 41 mm được trang bị khung viền thép không gỉ cứng cáp, trang nhã cùng phần thiết kế bo cong mềm mại quen thuộc của nhà Apple, bên cạnh đó bề mặt đồng hồ có kích thước 1.61 inch (diện tích màn hình tăng 20% so với phiên bản cũ) được bảo vệ bởi lớp kính Sapphire cao cấp. Phần viền của đồng hồ được làm trau chuốt hơn với độ dày chỉ 1.7 mm, tạo cảm giác tràn viền nhiều hơn (phần viền mỏng hơn 60% so với Apple Watch S6)', 'Màn hình:\r\n\r\nOLED1.61 inch\r\nThời lượng pin:\r\n\r\nKhoảng 1.5 ngày\r\nKết nối với hệ điều hành:\r\n\r\niOS 15 trở lên\r\nMặt:\r\n\r\nKính Sapphire41 mm\r\nTính năng cho sức khỏe:\r\n\r\nChế độ luyện tậpTheo dõi giấc ngủTính lượng calories tiêu thụTính quãng đường chạyĐiện tâm đồĐo nhịp timĐo nồng độ oxy (SpO2)Đếm số bước chân'),
(53, 13, 3, 'Apple Watch S3 LTE 42mm viền nhôm dây cao su đen', '1216357617apple-watch-s3-lte-42mm-vien-nhom-day-cao-su-thumb-2-1-600x600.jpg', 8191000, 20, 'Apple Watch S3 LTE 42 mm viền nhôm dây cao su là phiên bản đồng hồ thông minh hỗ trợ eSim vừa được giới thiệu. Đồng hồ có thiết kế trẻ trung, hiện đại cùng nhiều tiện ích về sức khỏe, thể thao dành cho người dùng', 'Màn hình:\r\n\r\nOLED1.65 inch\r\nThời lượng pin:\r\n\r\nKhoảng 1.5 ngày\r\nKết nối với hệ điều hành:\r\n\r\niOS 13 trở lên\r\nMặt:\r\n\r\nIon-X strengthened glass42 mm\r\nTính năng cho sức khỏe:\r\n\r\nChế độ luyện tậpTheo dõi giấc ngủTính lượng calories tiêu thụĐo nhịp timĐếm số bước chân'),
(47, 13, 3, 'Apple Watch SE 40mm viền nhôm dây cao su', '7023079se-40mm-vien-nhom-day-cao-su-hong-thumb-1-600x600.jpg', 7641000, 40, 'Apple Watch SE 40mm viền nhôm dây cao su hồng có khung viền chắc chắn, thiết kế bo tròn 4 góc giúp thao tác vuốt chạm thoải mái hơn. Mặt kính cường lực Ion-X strengthened glass với kích thước 1.57 inch, hiển thị rõ ràng. Khung viền nhôm chắc chắn cùng dây đeo cao su có độ đàn hồi cao, êm ái, tạo cảm giác thoải mái khi đeo', 'Màn hình:\r\n\r\nOLED1.57 inch\r\nThời lượng pin:\r\n\r\nKhoảng 1.5 ngày\r\nKết nối với hệ điều hành:\r\n\r\niOS 14 trở lên\r\nMặt:\r\n\r\nIon-X strengthened glass40 mm\r\nTính năng cho sức khỏe:\r\n\r\nChế độ luyện tậpTheo dõi giấc ngủTính lượng calories tiêu thụTính quãng đường chạyĐo nhịp timĐếm số bước chân'),
(41, 13, 6, 'iPhone 13 mini 128GB ', '1904282948iphone-13-mini-midnight-1-600x600.jpg', 21490000, 23, 'iPhone 13 mini được Apple ra mắt với hàng loạt nâng cấp về cấu hình và các tính năng hữu ích, lại có thiết kế vừa vặn. Chiếc điện thoại này hứa hẹn là một thiết bị hoàn hảo hướng tới những khách hàng thích sự nhỏ gọn nhưng vẫn giữ được sự mạnh mẽ bên trong', 'Màn hình:\r\n\r\nOLED5.4\"Super Retina XDR\r\nHệ điều hành:\r\n\r\niOS 15\r\nCamera sau:\r\n\r\n2 camera 12 MP\r\nCamera trước:\r\n\r\n12 MP\r\nChip:\r\n\r\nApple A15 Bionic\r\nRAM:\r\n\r\n4 GB\r\nBộ nhớ trong:\r\n\r\n128 GB\r\nSIM:\r\n\r\n1 Nano SIM & 1 eSIMHỗ trợ 5G\r\nPin, Sạc:\r\n\r\n2438 mAh20 W'),
(67, 13, 6, 'Samsung Galaxy A52s 5G', '653991048ssa52.jpg', 10690000, 60, 'Samsung đã chính thức giới thiệu chiếc điện thoại Galaxy A52s 5G đến người dùng, đây phiên bản nâng cấp của Galaxy A52 5G ra mắt cách đây không lâu, với ngoại hình không đổi nhưng được nâng cấp đáng kể về thông số cấu hình bên trong', 'Màn hình 6.5\", Chip Snapdragon 778G 5G 8 nhân\r\n\r\nRAM 8 GB, ROM 128 GB\r\n\r\nCamera sau: Chính 64 MP & Phụ 12 MP, 5 MP, 5 MP\r\n\r\nCamera trước: 32 MP\r\n\r\nPin 4500 mAh, Sạc 25 W'),
(68, 10, 6, 'Samsung Galaxy Z Flip3 5G 256GB', '1909536141samsung-galaxy-z-flip-3-violet-1-600x600.jpg', 2699000, 30, 'Samsung Galaxy Z Flip3 5G dễ dàng lấy lòng phái nữ khi thiết kế của nó được lấy cảm hứng từ hộp đựng phấn trang điểm. Kết hợp với 7 màu sắc khác nhau, giúp bạn thoải mái thể hiện cá tính, từ mạnh mẽ sang trọng đến hiện đại trẻ trung', 'Màn hình:\r\n\r\nDynamic AMOLED 2XChính 6.7\" & Phụ 1.9\"Full HD+\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nCamera sau:\r\n\r\n2 camera 12 MP\r\nCamera trước:\r\n\r\n10 MP\r\nChip:\r\n\r\nSnapdragon 888\r\nRAM:\r\n\r\n8 GB\r\nBộ nhớ trong:\r\n\r\n256 GB\r\nSIM:\r\n\r\n1 Nano SIM & 1 eSIMHỗ trợ 5G\r\nPin, Sạc:\r\n\r\n3300 mAh15 W'),
(40, 13, 6, 'iPhone XR 64GB', '2002924667iphone-xr-hopmoi-den-600x600-2-600x600.jpg', 13490000, 30, 'Là chiếc điện thoại iPhone có mức giá dễ chịu, phù hợp với nhiều khách hàng hơn, iPhone Xr vẫn được ưu ái trang bị chip Apple A12 mạnh mẽ, màn hình tai thỏ cùng khả năng kháng nước kháng bụi', 'Màn hình:\r\n\r\nIPS LCD6.1\"Liquid Retina\r\nHệ điều hành:\r\n\r\niOS 14\r\nCamera sau:\r\n\r\n12 MP\r\nCamera trước:\r\n\r\n7 MP\r\nChip:\r\n\r\nApple A12 Bionic\r\nRAM:\r\n\r\n3 GB\r\nBộ nhớ trong:\r\n\r\n64 GB\r\nSIM:\r\n\r\n1 Nano SIM & 1 eSIMHỗ trợ 4G\r\nPin, Sạc:\r\n\r\n2942 mAh15 W'),
(57, 13, 2, 'iPad 9 WiFi 64GB', '2134704252ipad-gen-9-wifi-cellular-sliver-600x600.jpg', 10990000, 15, 'Sau thành công của iPad 8, Apple cho đã cho ra mắt iPad 9 WiFi 64GB - phiên bản tiếp theo của dòng iPad 10.2 inch, về cơ bản nó kế thừa những điểm mạnh từ các phiên bản trước đó và được cải tiến thêm hiệu suất, trải nghiệm người dùng nhằm giúp nhu cầu sử dụng giải trí và làm việc tiện lợi, linh hoạt hơn', 'Màn hình:\r\n\r\n10.2\"Retina IPS LCD\r\nHệ điều hành:\r\n\r\niPadOS 15\r\nChip:\r\n\r\nApple A13 Bionic 6 nhân\r\nRAM:\r\n\r\n3 GB\r\nBộ nhớ trong:\r\n\r\n64 GB\r\nKết nối:\r\n\r\nNghe gọi qua FaceTime\r\nCamera sau:\r\n\r\n8 MP\r\nCamera trước:\r\n\r\n12 MP\r\nPin, Sạc:\r\n\r\n32.4 Wh (~ 8600 mAh)20 W'),
(59, 13, 8, 'Adapter Sạc Type C 20W dùng cho iPhone/iPad Apple MHJE3 Trắng', '734454284adapter-sac-type-c-20w-cho-iphone-ipad-apple-mhje3-avatar-1-1-600x600.jpg', 549000, 100, 'Adapter sạc nhanh Type C dành cho iPhone, iPad.\r\nThiết kế nhỏ gọn, chuôi 2 chấu phổ biến.\r\nCổng ra Type-C, kết nối thêm dây cáp để sạc cho điện thoại, máy tính bảng.\r\nCông suất 20W cho tốc độ sạc nhanh chóng.\r\nSản phẩm chính hãng Apple, nguyên seal 100%.\r\nLưu ý: Thanh toán trước khi mở seal.', 'Model:\r\n\r\nMHJE3\r\nChức năng:\r\n\r\nSạc\r\nĐầu ra:\r\n\r\nType C: 20W\r\nDòng sạc tối đa:\r\n\r\n20 W\r\nCông nghệ/Tiện ích:\r\n\r\nPower Delivery\r\nThương hiệu của:\r\n\r\nMỹ\r\nSản xuất tại:\r\n\r\nTrung Quốc'),
(60, 13, 8, 'Adapter sạc 5W Apple iPhone MD813ZM-A', '307451951adapter-sac-5w-iphone-ipad-ipod-apple-md813zma-6-600x600.jpg', 450000, 100, 'Phù hợp với tất cả các dòng iPhone, iPad, iPod.\r\nKết hợp thêm với dây cáp để sạc cho thiết bị khác.\r\nĐảm bảo 100% tương thích, không ảnh hưởng đến máy.\r\nSản phẩm chính hãng Apple, nguyên seal 100%.\r\nLưu ý: Thanh toán trước khi mở seal.', 'Model:\r\n\r\nMD813ZM-A\r\nChức năng:\r\n\r\nSạc\r\nĐầu ra:\r\n\r\nUSB: 5V - 1A\r\nDòng sạc tối đa:\r\n\r\n5 W\r\nThương hiệu của:\r\n\r\nMỹ\r\nSản xuất tại:\r\n\r\nViệt Nam / Trung Quốc (tùy lô hàng)'),
(36, 13, 6, 'iPhone 13 Pro Max 256GB', '92366320ip13.jpg', 36990000, 30, 'iPhone 13 Pro Max 256GB - siêu phẩm mang trên mình bộ vi xử lý Apple A15 Bionic hàng đầu, màn hình Super Retina XDR 120 Hz, cụm camera khẩu độ f/1.5 cực lớn, tất cả sẽ mang lại cho bạn những trải nghiệm tuyệt vời chưa từng có', 'Màn hình:\r\nOLED6.7\"Super Retina XDR.\r\nHệ điều hành: iOS 15.\r\nCamera sau: 3 camera 12 MP.\r\nCamera trước: 12 MP.\r\nChip: Apple A15 Bionic.\r\nRAM: 6 GB.\r\nBộ nhớ trong: 256 GB.\r\nSIM: 1 Nano SIM & 1 eSIMHỗ trợ 5G.\r\nPin, Sạc: 4352 mAh20 W'),
(37, 13, 6, 'iPhone 12 Pro Max 128GB', '898147604ip12.jpg', 32990000, 30, 'iPhone 12 Pro Max 128 GB một siêu phẩm smartphone đến từ Apple. Máy có một hiệu năng hoàn toàn mạnh mẽ đáp ứng tốt nhiều nhu cầu đến từ người dùng và mang trong mình một thiết kế đầy vuông vức, sang trọng.', 'Màn hình:\r\n\r\nOLED6.7\"Super Retina XDR\r\nHệ điều hành:\r\n\r\niOS 14\r\nCamera sau:\r\n\r\n3 camera 12 MP\r\nCamera trước:\r\n\r\n12 MP\r\nChip:\r\n\r\nApple A14 Bionic\r\nRAM:\r\n\r\n6 GB\r\nBộ nhớ trong:\r\n\r\n128 GB\r\nSIM:\r\n\r\n1 Nano SIM & 1 eSIMHỗ trợ 5G\r\nPin, Sạc:\r\n\r\n3687 mAh20 W'),
(38, 13, 6, 'iPhone 11 128GB', '1453429299ip11.jpeg', 21490000, 30, 'Được xem là một trong những phiên bản iPhone \"giá rẻ\" của bộ 3 iPhone 11 series nhưng iPhone 11 128GB vẫn sở hữu cho mình rất nhiều ưu điểm mà hiếm có một chiếc smartphone nào khác sở hữu.', 'Màn hình:\r\n\r\nIPS LCD6.1\"Liquid Retina\r\nHệ điều hành:\r\n\r\niOS 14\r\nCamera sau:\r\n\r\n2 camera 12 MP\r\nCamera trước:\r\n\r\n12 MP\r\nChip:\r\n\r\nApple A13 Bionic\r\nRAM:\r\n\r\n4 GB\r\nBộ nhớ trong:\r\n\r\n128 GB\r\nSIM:\r\n\r\n1 Nano SIM & 1 eSIMHỗ trợ 4G\r\nPin, Sạc:\r\n\r\n3110 mAh18 W'),
(73, 10, 6, 'Samsung Galaxy S21 Ultra 5G 128GB', '1460274493samsung-galaxy-s21-ultra-bac-600x600-1-600x600.jpg', 25990000, 30, 'Sự đẳng cấp được Samsung gửi gắm thông qua chiếc smartphone Galaxy S21 Ultra 5G với hàng loạt sự nâng cấp và cải tiến không chỉ ngoại hình bên ngoài mà còn sức mạnh bên trong, hứa hẹn đáp ứng trọn vẹn nhu cầu ngày càng cao của người dùng', 'Màn hình:\r\n\r\nDynamic AMOLED 2X6.8\"Quad HD+ (2K+)\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nCamera sau:\r\n\r\nChính 108 MP & Phụ 12 MP, 10 MP, 10 MP\r\nCamera trước:\r\n\r\n40 MP\r\nChip:\r\n\r\nExynos 2100\r\nRAM:\r\n\r\n12 GB\r\nBộ nhớ trong:\r\n\r\n128 GB\r\nSIM:\r\n\r\n2 Nano SIM hoặc 1 Nano SIM + 1 eSIMHỗ trợ 5G\r\nPin, Sạc:\r\n\r\n5000 mAh25 W'),
(74, 10, 2, 'Samsung Galaxy S21+ 5G 128GB', '316407411samsung-galaxy-s21-plus-den-600x600-600x600.jpg', 20990000, 30, 'Ẩn đằng sau thiết kế tuyệt tác của siêu phẩm Galaxy S21+ 5G là cả một kỳ quan công nghệ, mà ở đó bạn có thể trải nghiệm hiệu năng mạnh mẽ nhất, những công nghệ tiên phong, dẫn đầu trào lưu với cụm camera đỉnh cao đến từ Samsung', 'Màn hình:\r\n\r\nDynamic AMOLED 2X6.7\"Full HD+\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nCamera sau:\r\n\r\nChính 12 MP & Phụ 64 MP, 12 MP\r\nCamera trước:\r\n\r\n10 MP\r\nChip:\r\n\r\nExynos 2100\r\nRAM:\r\n\r\n8 GB\r\nBộ nhớ trong:\r\n\r\n128 GB\r\nSIM:\r\n\r\n2 Nano SIM hoặc 1 Nano SIM + 1 eSIMHỗ trợ 5G\r\nPin, Sạc:\r\n\r\n4800 mAh25 W'),
(75, 10, 2, ' Samsung Galaxy A51 (6GB/128GB)', '425899018samsung-galaxy-a51-silver-600x600.jpg', 7490000, 100, 'Theo Strategy Analytics, Galaxy A51 là Smartphone Android Bán Chạy Nhất Thế Giới Quý 1/2020, máy sở hữu cụm 4 camera, bao gồm camera macro chụp cận cảnh lần đầu xuất hiện trên smartphone Samsung, màn hình tràn viền vô cực cùng mặt lưng họa tiết kim cương nổi bật', 'Màn hình:\r\n\r\nSuper AMOLED6.5\"Full HD+\r\nHệ điều hành:\r\n\r\nAndroid 10\r\nCamera sau:\r\n\r\nChính 48 MP & Phụ 12 MP, 5 MP, 5 MP\r\nCamera trước:\r\n\r\n32 MP\r\nChip:\r\n\r\nExynos 9611\r\nRAM:\r\n\r\n6 GB\r\nBộ nhớ trong:\r\n\r\n128 GB\r\nSIM:\r\n\r\n2 Nano SIMHỗ trợ 4G\r\nPin, Sạc:\r\n\r\n4000 mAh15 W'),
(76, 10, 6, ' Samsung Galaxy A31', '1581603896samsung-galaxy-a31-trang-new-600x600-600x600.jpg', 5790000, 30, 'Galaxy A31 là mẫu smartphone tầm trung được ra mắt đầu năm 2020 của Samsung. Thiết bị gây ấn tượng mạnh với ngoại hình thời trang, cụm 4 camera đa chức năng, vân tay dưới màn hình và viên pin khủng lên đến 5000 mAh', 'Màn hình:\r\n\r\nSuper AMOLED6.4\"Full HD+\r\nHệ điều hành:\r\n\r\nAndroid 10\r\nCamera sau:\r\n\r\nChính 48 MP & Phụ 8 MP, 5 MP, 5 MP\r\nCamera trước:\r\n\r\n20 MP\r\nChip:\r\n\r\nMediaTek MT6768 (Helio P65)\r\nRAM:\r\n\r\n6 GB\r\nBộ nhớ trong:\r\n\r\n128 GB\r\nSIM:\r\n\r\n2 Nano SIMHỗ trợ 4G\r\nPin, Sạc:\r\n\r\n5000 mAh15 W'),
(77, 10, 6, 'Samsung Galaxy A02', '219868833samsung-galaxy-a02-xanhduong-600x600-600x600.jpg', 2590000, 300, 'Samsung bổ sung thêm tùy chọn smartphone trong phân khúc giá rẻ mang tên Galaxy A02, máy trang bị một cấu hình ổn định cùng mức pin khủng 5000 mAh cho thời lượng vượt trội trong tầm giá mang đến bạn nhiều trải nghiệm thú vị hơn', 'Màn hình:\r\n\r\nPLS TFT LCD6.5\"HD+\r\nHệ điều hành:\r\n\r\nAndroid 10\r\nCamera sau:\r\n\r\nChính 13 MP & Phụ 2 MP\r\nCamera trước:\r\n\r\n5 MP\r\nChip:\r\n\r\nMediaTek MT6739W\r\nRAM:\r\n\r\n3 GB\r\nBộ nhớ trong:\r\n\r\n32 GB\r\nSIM:\r\n\r\n2 Nano SIMHỗ trợ 4G\r\nPin, Sạc:\r\n\r\n5000 mAh7.8 W'),
(78, 10, 2, 'Samsung Galaxy Tab S7 FE 4G', '2000225568samsung-galaxy-tab-s7-fe-green-600x600.jpg', 13990000, 50, 'Samsung chính thức trình làng mẫu máy tính bảng có tên Galaxy Tab S7 FE, máy trang bị cấu hình mạnh mẽ, màn hình giải trí siêu lớn và điểm ấn tượng nhất là viên pin siêu khủng được tích hợp bên trong, giúp tăng hiệu suất làm việc nhưng vẫn có tính di động cực cao', 'Màn hình:\r\n\r\n12.4\"TFT LCD\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nChip:\r\n\r\nSnapdragon 750G\r\nRAM:\r\n\r\n4 GB\r\nBộ nhớ trong:\r\n\r\n64 GB\r\nKết nối:\r\n\r\nHỗ trợ 4GCó nghe gọi\r\nSIM:\r\n\r\n1 Nano SIM\r\nCamera sau:\r\n\r\n8 MP\r\nCamera trước:\r\n\r\n5 MP\r\nPin, Sạc:\r\n\r\n10090 mAh45 W'),
(79, 10, 2, 'Samsung Galaxy Tab A7 Lite', '1837086186samsung-galaxy-tab-a7-lite-sliver-600x600.jpg', 4490000, 100, 'Galaxy Tab A7 Lite là phiên bản rút gọn của dòng máy tính bảng \"ăn khách\" Galaxy Tab A7 thuộc thương hiệu Samsung, đáp ứng nhu cầu giải trí của khách hàng thuộc phân khúc bình dân với màn hình lớn nhưng vẫn gọn nhẹ hợp túi tiền', 'Màn hình:\r\n\r\n8.7\"TFT LCD\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nChip:\r\n\r\nMediaTek MT8768T 8 nhân\r\nRAM:\r\n\r\n3 GB\r\nBộ nhớ trong:\r\n\r\n32 GB\r\nKết nối:\r\n\r\nHỗ trợ 4GCó nghe gọi\r\nSIM:\r\n\r\n1 Nano SIM\r\nCamera sau:\r\n\r\n8 MP\r\nCamera trước:\r\n\r\n2 MP\r\nPin, Sạc:\r\n\r\n5100 mAh15 W'),
(80, 10, 2, 'Samsung Galaxy Tab A7 (2020)', '803321555samsung-galaxy-tab-a7-2020-vangdong-600x600.jpg', 7990000, 60, 'Samsung Galaxy Tab A7 (2020) là một chiếc máy tính bảng có thiết kế đẹp, cấu hình khá, nhiều tính năng tiện ích, một công cụ đắc lực hỗ trợ bạn trong công việc cũng như trong học tập hay giải trí', 'Màn hình:\r\n\r\n10.4\"TFT LCD\r\nHệ điều hành:\r\n\r\nAndroid 10\r\nChip:\r\n\r\nSnapdragon 662\r\nRAM:\r\n\r\n3 GB\r\nBộ nhớ trong:\r\n\r\n64 GB\r\nKết nối:\r\n\r\nHỗ trợ 4GCó nghe gọi\r\nSIM:\r\n\r\n1 Nano SIM\r\nCamera sau:\r\n\r\n8 MP\r\nCamera trước:\r\n\r\n5 MP\r\nPin, Sạc:\r\n\r\n7040 mAh10 W'),
(81, 10, 7, 'Tai nghe Bluetooth True Wireless Samsung Galaxy Buds Live R180 Gold', '899768666true-wireless-samsung-galaxy-buds-live-r180-141021-103922-600x600.jpg', 1990000, 60, 'Ngoại hình độc đáo, mới lạ, chất âm tốt.\r\nĐàm thoại được cải thiện rõ rệt.\r\nKết nối tiện lợi với Bluetooth 5.0 .\r\nTương thích với hệ sinh thái Galaxy.\r\nHiệu quả chống ồn đạt 97%.\r\nTận hưởng âm nhạc cùng bạn bè qua Buds Together.\r\nTrợ lý ảo Bixby, kháng nước IPX2.\r\nNghe nhạc 6 giờ liên tục (21 giờ nếu kết hợp hộp sạc).\r\n5 phút sạc sử dụng đuợc 1 giờ nghe nhạc.\r\nĐiều khiển cảm ứng dừng/phát, trả lời cuộc gọi', 'Thời gian tai nghe:\r\n\r\nDùng 6 giờ - Sạc 1 giờ\r\nThời gian hộp sạc:\r\n\r\nDùng 21 giờ - Sạc 1 giờ\r\nCổng sạc:\r\n\r\nType-C\r\nCông nghệ âm thanh:\r\n\r\nActive Noise Cancellation\r\nTương thích:\r\n\r\nAndroid, iOS (iPhone, iPad), Windows\r\nỨng dụng kết nối:\r\n\r\nBluetooth TWS\r\nTiện ích:\r\n\r\nCó mic thoạiSử dụng độc lập 1 bên tai nghe\r\nHỗ trợ kết nối:\r\n\r\nBluetooth 5.0\r\nĐiều khiển bằng:\r\n\r\nCảm ứng chạm'),
(82, 10, 7, 'Tai nghe nhét tai Samsung EG920', '303584453tai-nghe-nhet-tai-samsung-eg920b-avatar-600x600.jpg', 280000, 300, 'Thiết kế gọn đẹp, có 2 màu đen và đỏ.\r\nDây dài 1.2 m, đệm tai có móc giúp đeo chắc chắn.\r\nÂm thanh trong trẻo, trung thực.\r\nCó mic thoại, nút chỉnh nhận cuộc gọi, chuyển bài hát, dừng/chơi nhạc, tăng/giảm âm lượng', 'Jack cắm:\r\n\r\n3.5 mm\r\nTương thích:\r\n\r\nAndroidWindowsWindows Phone\r\nTiện ích:\r\n\r\nCó mic thoạiĐệm tai đi kèmTai nghe nhét tai\r\nĐiều khiển bằng:\r\n\r\nPhím nhấn\r\nPhím điều khiển:\r\n\r\nMic thoạiNghe/nhận cuộc gọiPhát/dừng chơi nhạcTăng/giảm âm lượng'),
(83, 10, 9, 'Pin sạc dự phòng Polymer 20.000 mAh Type C PD Samsung EB-P5300 ', '1309380524polymer-20000mah-type-c-25w-samsung-eb-p5300-avatar-1-600x600.jpg', 1490000, 100, 'Thiết kế gọn nhẹ, sang trọng, vỏ bọc nhựa tối ưu trọng lượng.\r\nHỗ trợ các công nghệ sạc nhanh Super Fast Charging, Power Delivery, Quick Charge 2.0.\r\nDung lượng pin cao 20.000 mAh, lõi pin Polymer an toàn.\r\nCông suất nguồn ra qua cổng USB, Type C tối đa 25W.\r\nPhù hợp với nhiều loại thiết bị', 'Hiệu suất sạc:\r\n\r\n60%\r\nDung lượng pin:\r\n\r\n20.000 mAh\r\nThời gian sạc đầy pin:\r\n\r\n12 - 14 giờ (dùng Adapter 2A)\r\nNguồn vào:\r\n\r\nType C: 5V - 3A, 9V - 2.77A, 12V - 2.1A, 15V - 1.66A, 20V - 1.25A\r\nNguồn ra:\r\n\r\nType C (PD): 5V - 3A, 9V - 2.77A, 15V - 1.66A, 20V - 1.25A, (PPS) 3.3-5.9V - 3A, 3.3-11V - 2.25AUSB: 5V - 2A, 9V - 2A, 12V - 2.1A\r\nLõi pin:\r\n\r\nPolymer\r\nCông nghệ/Tiện ích:\r\n\r\nĐèn LED báo hiệuPower Delivery\r\nKích thước:\r\n\r\nDài 14.3 cm - Rộng 7 cm - Dày 2.5 cm\r\nTrọng lượng:\r\n\r\n392 g\r\nThương hiệu của:\r\n\r\nHàn Quốc\r\nSản xuất tại:\r\n\r\nTrung Quốc'),
(84, 10, 9, 'Pin sạc dự phòng Polymer 10.000 mAh Type C PD Samsung EB-P3300', '1950975546polymer-10000mah-type-c-25w-samsung-eb-p3300-600x600.jpg', 792000, 100, 'Thiết kế nhỏ gọn, mỏng, trọng lượng nhẹ.\r\nTrang bị công nghệ sạc nhanh Super Fast Charging và Power Delivery.\r\nDung lượng pin cao 10.000 mAh, lõi pin Polymer an toàn.\r\nNguồn ra tối đa cổng Type C 25W, cổng USB 18W.\r\nTương thích với nhiều loại thiết bị', 'Hiệu suất sạc:\r\n\r\n60%\r\nDung lượng pin:\r\n\r\n10.000 mAh\r\nThời gian sạc đầy pin:\r\n\r\n10 - 11 giờ (dùng Adapter 1A)6 - 8 giờ (dùng Adapter 2A)\r\nNguồn vào:\r\n\r\nType C: 5V - 2A, 9V - 1.67A, 12V - 2.1A (Adaptive Fast Charging)Type C: 5V - 3A, 9V - 2.77A (Power Delivery)\r\nNguồn ra:\r\n\r\nUSB: 5V - 2A, 9V - 1.7A, 12V - 2.1AType C: 5V - 2A, 9V - 2A, 12V - 2.1A\r\nLõi pin:\r\n\r\nPolymer\r\nCông nghệ/Tiện ích:\r\n\r\nSuper Fast ChargingĐèn LED báo hiệuPower Delivery\r\nKích thước:\r\n\r\nDài 14 cm - Ngang 7 cm - Dày 1.3 cm\r\nTrọng lượng:\r\n\r\n240 g\r\nThương hiệu của:\r\n\r\nHàn Quốc\r\nSản xuất tại:\r\n\r\nTrung Quốc'),
(85, 11, 6, 'OPPO Reno6 Z 5G ', '579345088oppo-reno6-z-5g-aurora-1-600x600.jpg', 9490000, 100, 'Reno6 Z 5G đến từ nhà OPPO với hàng loạt sự nâng cấp và cải tiến không chỉ ngoại hình bên ngoài mà còn sức mạnh bên trong. Đặc biệt, chiếc điện thoại được hãng đánh giá “chuyên gia chân dung bắt trọn mọi cảm xúc chân thật nhất”, đây chắc chắn sẽ là một “siêu phẩm\" mà bạn không thể bỏ qua', 'Màn hình:\r\n\r\nAMOLED6.43\"Full HD+\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nCamera sau:\r\n\r\nChính 64 MP & Phụ 8 MP, 2 MP\r\nCamera trước:\r\n\r\n32 MP\r\nChip:\r\n\r\nMediaTek Dimensity 800U 5G\r\nRAM:\r\n\r\n8 GB\r\nBộ nhớ trong:\r\n\r\n128 GB\r\nSIM:\r\n\r\n2 Nano SIMHỗ trợ 5G\r\nPin, Sạc:\r\n\r\n4310 mAh30 W'),
(86, 11, 6, 'Điện thoại OPPO Reno5 5G', '1183956654oppo-reno5-5g-thumb-600x600.jpg', 11990000, 60, 'OPPO đã trình làng OPPO Reno5 5G phiên bản kết nối 5G internet siêu nhanh ra thị trường. Chiếc điện thoại với hàng loạt các tính năng nổi bật cùng vẻ ngoài thời thượng giúp tôn lên vẻ sang trọng cho người sở hữu', 'Màn hình:\r\n\r\nAMOLED6.43\"Full HD+\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nCamera sau:\r\n\r\nChính 64 MP & Phụ 8 MP, 2 MP, 2 MP\r\nCamera trước:\r\n\r\n32 MP\r\nChip:\r\n\r\nSnapdragon 765G\r\nRAM:\r\n\r\n8 GB\r\nBộ nhớ trong:\r\n\r\n128 GB\r\nSIM:\r\n\r\n2 Nano SIMHỗ trợ 5G\r\nPin, Sạc:\r\n\r\n4300 mAh65 W'),
(87, 11, 6, 'OPPO Reno4 Pro', '793826664oppo-reno4-pro-den-600x600.jpg', 10490000, 50, 'OPPO chính thức trình làng chiếc smartphone có tên OPPO Reno4 Pro. Máy trang bị cấu hình vô cùng cao cấp với vi xử lý chip Snapdragon 720G, bộ 4 camera đến 48 MP ấn tượng, cùng công nghệ sạc siêu nhanh 65 W nhưng được bán với mức giá vô ưu đãi, dễ tiếp cận', 'Màn hình:\r\n\r\nAMOLED6.5\"Full HD+\r\nHệ điều hành:\r\n\r\nAndroid 10\r\nCamera sau:\r\n\r\nChính 48 MP & Phụ 8 MP, 2 MP, 2 MP\r\nCamera trước:\r\n\r\n32 MP\r\nChip:\r\n\r\nSnapdragon 720G\r\nRAM:\r\n\r\n8 GB\r\nBộ nhớ trong:\r\n\r\n256 GB\r\nSIM:\r\n\r\n2 Nano SIMHỗ trợ 4G\r\nPin, Sạc:\r\n\r\n4000 mAh65 W'),
(88, 11, 6, 'OPPO Find X3 Pro 5G', '1230591145oppo-find-x3-pro-black-001-1-600x600.jpg', 23990000, 50, 'Màn hình 6.7\", Chip Snapdragon 888\r\n\r\nRAM 12 GB, ROM 256 GB\r\n\r\nCamera sau: Chính 50 MP & Phụ 50 MP, 13 MP, 3 MP\r\n\r\nCamera trước: 32 MP\r\n\r\nPin 4500 mAh, Sạc 65 W', 'Màn hình 6.7\", Chip Snapdragon 888\r\n\r\nRAM 12 GB, ROM 256 GB\r\n\r\nCamera sau: Chính 50 MP & Phụ 50 MP, 13 MP, 3 MP\r\n\r\nCamera trước: 32 MP\r\n\r\nPin 4500 mAh, Sạc 65 W'),
(89, 11, 6, 'OPPO A94', '1086531568oppo-a94-bac-600x600.jpg', 7690000, 100, 'Màn hình 6.43\", Chip MediaTek Helio P95\r\n\r\nRAM 8 GB, ROM 128 GB\r\n\r\nCamera sau: Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP\r\n\r\nCamera trước: 32 MP\r\n\r\nPin 4310 mAh, Sạc 30 W', 'Màn hình 6.43\", Chip MediaTek Helio P95\r\n\r\nRAM 8 GB, ROM 128 GB\r\n\r\nCamera sau: Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP\r\n\r\nCamera trước: 32 MP\r\n\r\nPin 4310 mAh, Sạc 30 W'),
(90, 11, 6, 'OPPO A93', '999401626oppo-a93-trang-14-600x600.jpg', 6490000, 100, 'Màn hình 6.43\", Chip MediaTek Helio P95\r\n\r\nRAM 8 GB, ROM 128 GB\r\n\r\nCamera sau: Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP\r\n\r\nCamera trước: Chính 16 MP & Phụ 2 MP\r\n\r\nPin 4000 mAh, Sạc 18 W', 'Màn hình 6.43\", Chip MediaTek Helio P95\r\n\r\nRAM 8 GB, ROM 128 GB\r\n\r\nCamera sau: Chính 48 MP & Phụ 8 MP, 2 MP, 2 MP\r\n\r\nCamera trước: Chính 16 MP & Phụ 2 MP\r\n\r\nPin 4000 mAh, Sạc 18 W'),
(91, 11, 6, 'OPPO A16K', '1520235761OPPO-a16k-den-600x600.jpg', 3690000, 100, 'Màn hình 6.52\", Chip MediaTek Helio G35\r\n\r\nRAM 3 GB, ROM 32 GB\r\n\r\nCamera sau: 13 MP\r\n\r\nCamera trước: 5 MP\r\n\r\nPin 4230 mAh, Sạc 10 W', 'Màn hình 6.52\", Chip MediaTek Helio G35\r\n\r\nRAM 3 GB, ROM 32 GB\r\n\r\nCamera sau: 13 MP\r\n\r\nCamera trước: 5 MP\r\n\r\nPin 4230 mAh, Sạc 10 W'),
(92, 11, 3, 'Oppo Watch 46mm dây silicone', '145217879oppo-watch-46mm-day-silicone-thumb-1-1-600x600.jpg', 5752000, 60, 'Màn hình: AMOLED, 1.91 inch, 46 mm\r\n\r\nTương thích: Android 6.0 trở lên (trừ Android Go), iOS 12 trở lên\r\n\r\nChế độ luyện tập, Theo dõi giấc ngủ, Tính lượng calories tiêu thụ', 'Màn hình: AMOLED, 1.91 inch, 46 mm\r\n\r\nTương thích: Android 6.0 trở lên (trừ Android Go), iOS 12 trở lên\r\n\r\nChế độ luyện tập, Theo dõi giấc ngủ, Tính lượng calories tiêu thụ'),
(93, 11, 3, 'Oppo Watch 46mm dây silicone', '1935466083oppo-watch-46mm-day-silicone-hong-thumb-1-1-600x600.jpg', 5752000, 50, 'Màn hình: AMOLED, 1.91 inch, 46 mm\r\n\r\nTương thích: Android 6.0 trở lên, iOS 12 trở lên\r\n\r\nChế độ luyện tập, Theo dõi giấc ngủ, Tính lượng calories tiêu thụ', 'Màn hình: AMOLED, 1.91 inch, 46 mm\r\n\r\nTương thích: Android 6.0 trở lên, iOS 12 trở lên\r\n\r\nChế độ luyện tập, Theo dõi giấc ngủ, Tính lượng calories tiêu thụ'),
(94, 11, 3, 'Oppo Watch 41mm dây silicone', '67161618oppo-watch-41mm-day-silicone-den-thumb-1-1-600x600.jpg', 4312000, 50, 'Màn hình: AMOLED, 1.6 inch, 41 mm\r\n\r\nTương thích: Android 6.0 trở lên, iOS 12 trở lên\r\n\r\nChế độ luyện tập, Theo dõi giấc ngủ, Tính lượng calories tiêu thụ', 'Màn hình: AMOLED, 1.6 inch, 41 mm\r\n\r\nTương thích: Android 6.0 trở lên, iOS 12 trở lên\r\n\r\nChế độ luyện tập, Theo dõi giấc ngủ, Tính lượng calories tiêu thụ'),
(95, 11, 3, 'Oppo Band', '1436432401oppo-band-thumb-600x600.jpg', 711000, 30, 'Màn hình: AMOLED, 1.1 inch\r\n\r\nTương thích: Android 6.0 trở lên, iOS 10 trở lên\r\n\r\nTheo dõi giấc ngủ, Đo nhịp tim, Đo nồng độ oxy (SpO2)', 'Màn hình: AMOLED, 1.1 inch\r\n\r\nTương thích: Android 6.0 trở lên, iOS 10 trở lên\r\n\r\nTheo dõi giấc ngủ, Đo nhịp tim, Đo nồng độ oxy (SpO2)'),
(96, 11, 9, 'Pin sạc dự phòng Polymer 10.000 mAh Type C PD QC3.0 VOOC OPPO PBV02', '628759833oppo-vooc-30w-pbv02-1-600x600.jpg', 1620000, 50, 'Dung lượng lớn 10.000 mAh, hiệu suất sạc 65%.\r\nTích hợp chuẩn sạc nhanh chuẩn VOOC 30W qua dòng điện thoại Oppo.\r\nSạc nhanh hơn qua công nghệ Qualcomm Quick Charge và Power Delivery trên cổng Type-C.\r\nThiết kế sang trọng, tinh tế, vỏ nhựa bền tốt.\r\nAn toàn khi dùng với lõi pin Polymer.\r\nNguồn vào cổng Type-C PD.\r\nTương thích với nhiều loại điện thoại và máy tính bảng với 2 nguồn ra (USB và Type-C).', 'Hiệu suất sạc:\r\n\r\n65%\r\nDung lượng pin:\r\n\r\n10.000 mAh\r\nThời gian sạc đầy pin:\r\n\r\n10 - 11 giờ (dùng Adapter 1A)5 - 6 giờ (dùng Adapter 2A)\r\nNguồn vào:\r\n\r\nType C: 5V - 2A, 5V - 3A, 5V - 6A, 9V - 3A, 12V - 2.5A\r\nNguồn ra:\r\n\r\nType C: 5V - 3A, 9V - 3A, 12V - 2.5A, 15V - 2AUSB: 5V - 2A, 5V - 6A, 9V - 2A, 12V - 1.5A\r\nLõi pin:\r\n\r\nPolymer\r\nCông nghệ/Tiện ích:\r\n\r\nPower DeliveryQualcomm Quick ChargeSạc nhanh VOOC\r\nKích thước:\r\n\r\nDày 1.5 cm - Rộng 7 cm - Dài 15 cm\r\nTrọng lượng:\r\n\r\n230 g\r\nThương hiệu của:\r\n\r\nTrung Quốc\r\nSản xuất tại:\r\n\r\nTrung Quốc'),
(97, 11, 9, 'Pin sạc dự phòng Polymer 10.000 mAh Type C PD QC3.0 OPPO PBT02', '681946871oppo-pbt02-600x600.jpg', 882000, 30, 'Thiết kế nhỏ gọn, có 2 màu đen, trắng thời trang.\r\nDung lượng pin lớn 10.000 mAh, lõi pin Polymer an toàn.\r\nCổng Type C trang bị công nghệ sạc nhanh Power Delivery 18W cho cả nguồn ra và nguồn vào.\r\nCổng USB tích hợp công nghệ sạc nhanh Quick Charge 3.0 18W.\r\nTương thích với nhiều loại điện thoại và máy tính bảng.', 'Hiệu suất sạc:\r\n\r\n65%\r\nDung lượng pin:\r\n\r\n10.000 mAh\r\nThời gian sạc đầy pin:\r\n\r\n10 - 11 giờ (dùng Adapter 1A)5 - 6 giờ (dùng Adapter 2A)\r\nNguồn vào:\r\n\r\nType C: 5V - 3A, 9V - 2A\r\nNguồn ra:\r\n\r\nType-C PD: 5V - 3A, 9V - 2A, 12V - 1.5AUSB QC: 5V - 2.4A, 9V - 2A, 12V - 1.5A\r\nLõi pin:\r\n\r\nPolymer\r\nCông nghệ/Tiện ích:\r\n\r\nĐèn LED báo hiệuPower DeliveryQualcomm Quick Charge\r\nKích thước:\r\n\r\nDài 15 cm - Rộng 7.2 cm - Dày 1.5 cm\r\nTrọng lượng:\r\n\r\n273 g\r\nThương hiệu của:\r\n\r\nTrung Quốc\r\nSản xuất tại:\r\n\r\nTrung Quốc'),
(98, 11, 7, 'Tai nghe Bluetooth True Wireless OPPO ENCO Buds ETI81', '887320272bluetooth-tws-oppo-enco-buds-eti81-ava-2-600x600.jpg', 790000, 30, 'Thiết kế nhỏ gọn, đeo êm ái, dễ mang theo. \r\nMang đến chất âm sống động với driver 8 mm, mã hóa âm thanh AAC.\r\nKết nối Bluetooth 5.2 cho khoảng cách dùng trong 10 m. \r\nYên tâm khi luyện tập thể thao với chuẩn chống nước, bụi IP54.\r\nDùng tai nghe liên tục 6 giờ, với hộp sạc cho 24 giờ, nạp pin đầy cho cả hộp sạc và tai nghe là 2.5 giờ.\r\nSử dụng cảm ứng chạm tùy chỉnh nhận/kết thúc cuộc gọi, phát/dừng nhạc, chuyển bài hát,...', 'Thời gian tai nghe:\r\n\r\nDùng 6 giờ - Sạc 2.5 giờ\r\nThời gian hộp sạc:\r\n\r\nDùng 24 giờ - Sạc 2.5 giờ\r\nCổng sạc:\r\n\r\nType-C\r\nTương thích:\r\n\r\nAndroid, iOS (iPhone, iPad), Windows\r\nTiện ích:\r\n\r\nChống nước\r\nĐiều khiển bằng:\r\n\r\nCảm ứng chạm'),
(99, 11, 7, 'Tai nghe Có Dây EP OPPO MH151 ', '1986545068co-day-ep-oppo-mh151-10-600x600.jpg', 590000, 30, 'Thiết kế cá tính, có 2 màu bạc - đen, thích hợp dùng nghe nhạc, chơi game,...\r\nÂm thanh chân thực, rõ ràng với màng loa 11.2 mm.\r\nDây có chiều dài 1.2 m, jack cắm 3.5 mm kết nối với nhiều thiết bị tiện lợi.\r\nThu nhận giọng nói sắc nét với mic thoại. \r\nĐiều khiển dễ chỉnh nhận cuộc gọi, phát/dừng chơi nhạc. \r\n Tai nghe có tích hợp công nghệ HI-Res .\r\nHỗ trợ màng loa 11mm, tạo hiệu ứng âm thanh 3D, cách âm tốt .', 'Jack cắm:\r\n\r\n3.5 mm\r\nTương thích:\r\n\r\nAndroidWindows\r\nTiện ích:\r\n\r\nCó mic thoại\r\nĐiều khiển bằng:\r\n\r\nPhím nhấn\r\nPhím điều khiển:\r\n\r\nChuyển bài hátNghe/nhận cuộc gọiPhát/dừng chơi nhạc'),
(100, 11, 7, 'Tai nghe Có Dây EP OPPO MH320', '531755983co-day-ep-oppo-mh320-600x600.jpg', 180000, 100, 'Kiểu dáng gọn nhẹ, dây dài 1.2 m, đeo nghe nhạc, gọi điện thuận tiện. \r\nTái tạo chất âm sống động, rõ nét. \r\nTích hợp đầu cắm 3.5 mm kết hợp dùng với đa dạng thiết bị. \r\nCó micro cho chất lượng đàm thoại cao. \r\nNút nhấn dễ chỉnh trả lời cuộc gọi, dừng/chơi nhạc, chuyển bài. ', 'Jack cắm:\r\n\r\n3.5 mm\r\nTương thích:\r\n\r\nAndroidWindows\r\nTiện ích:\r\n\r\nCó mic thoại\r\nĐiều khiển bằng:\r\n\r\nPhím nhấn\r\nPhím điều khiển:\r\n\r\nChuyển bài hátNghe/nhận cuộc gọiPhát/dừng chơi nhạc'),
(101, 10, 3, 'Galaxy Watch 4 LTE Classic 46mm ', '1332366411samsung-galaxy-watch-4-lte-classic-46mm-thumb-660x600.jpg', 9990000, 30, 'Samsung Galaxy Watch 4 LTE Classic 46mm mang nét sang trọng, hiện đại cùng với bộ khung viền thép không gỉ cứng cáp, màn hình SUPER AMOLED được bao bọc bởi lớp kính cường lực Gorrilla Glass Dx+ bền bỉ, chịu lực tốt. Dây đeo silicone êm nhẹ, độ đàn hồi cao, không thấm nước, thiết kế đục lỗ cho người dùng sự thông thoáng khi mang', 'Màn hình:\r\n\r\nSUPER AMOLED1.36 inch\r\nThời lượng pin:\r\n\r\nKhoảng 1.5 ngày\r\nKết nối với hệ điều hành:\r\n\r\nAndroid dùng Google Mobile Service\r\nMặt:\r\n\r\nKính cường lực Gorrilla Glass Dx+46 mm\r\nTính năng cho sức khỏe:\r\n\r\nChế độ luyện tậpTheo dõi giấc ngủĐo nhịp timĐo nồng độ oxy (SpO2)Đếm số bước chân'),
(102, 10, 3, 'Galaxy Watch 3 LTE 41mm viền thép dây da đen', '128189087samsung-galaxy-watch-3-45mm-bac-thumb-1-1-600x600.jpg', 5490000, 30, 'Samsung Galaxy Watch 3 LTE 41mm mang trong mình thiết kế cổ điển pha lẫn chút hiện đại nhưng không kém phần cao cấp, lịch lãm. Sở hữu màn hình hiển thị 1.2 inch, rực rỡ và sắc nét với công nghệ màn hình Super AMOLED cao cấp mang lại trải nghiệm tốt nhất. Dây đồng hồ bằng chất liệu da cao cấp, vừa sang trọng vừa thoải mái khi đeo trên tay. Khung viền xoay bezel bằng thép không gỉ chắc chắn nhưng vẫn giữ được độ mỏng tối ưu, gọn gàng cho mặt đồng hồ.', 'Màn hình:\r\n\r\nSUPER AMOLED1.2 inch\r\nThời lượng pin:\r\n\r\nKhoảng 40 tiếng\r\nKết nối với hệ điều hành:\r\n\r\nAndroid 5.0 trở lêniOS 9 trở lên\r\nMặt:\r\n\r\nKính cường lực Gorrilla Glass Dx+41 mm\r\nTính năng cho sức khỏe:\r\n\r\nChế độ luyện tậpTheo dõi giấc ngủTính lượng calories tiêu thụTính quãng đường chạyĐo nhịp timĐo nồng độ oxy (SpO2)Đếm số bước chân'),
(103, 10, 3, 'Vòng tay thông minh Samsung Galaxy Fit2 đen', '1228858796samsung-galaxy-fit2-den-thumb-1-1-600x600.jpg', 750000, 30, 'Vòng tay thông minh Samsung là phụ kiện nhỏ gọn, hỗ trợ nhiều tính năng hiện đại đi kèm với giá thành rẻ hơn nhiều so với một chiếc SmartWatch. Trong đó, Samsung Galaxy Fit 2 là dòng sản phẩm mới ra gần đây, được cập nhật thêm các tính năng hữu ích và cải tiến thời lượng pin tới 15 ngày.', 'Màn hình:\r\n\r\nAMOLED1.1 inch\r\nThời lượng pin:\r\n\r\nKhoảng 15 ngày\r\nKết nối với hệ điều hành:\r\n\r\nAndroid 5.0 trở lêniOS 12 trở lêniPhone 7 trở lên\r\nMặt:\r\n\r\nKính cường lực27.8 mm\r\nDây:\r\n\r\n24 cm\r\nTính năng cho sức khỏe:\r\n\r\nChế độ luyện tậpTheo dõi giấc ngủTính lượng calories tiêu thụTính quãng đường chạyĐo nhịp timĐếm số bước chân\r\nTiện ích:\r\n\r\nCài đặt thời gian rửa tayCó chống nướcRung thông báoThay mặt đồng hồTrả lời nhanh tin nhắn có sẵnĐiều khiển chơi nhạc'),
(104, 17, 6, 'Vivo V21 5G ', '346924776vivo-v21-5g-xanh-den-600x600.jpg', 9490000, 60, 'Chụp selfie bùng nổ trong đêm, thiết kế mới hiện đại đón đầu xu hướng, cùng với đó là tốc độ kết nối mạng 5G hàng đầu, tất cả những tính năng ấn tượng này đều có trong Vivo V21 5G mẫu điện thoại cận cao cấp đến từ Vivo', 'Màn hình:\r\n\r\nAMOLED6.44\"Full HD+\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nCamera sau:\r\n\r\nChính 64 MP & Phụ 8 MP, 2 MP\r\nCamera trước:\r\n\r\n44 MP\r\nChip:\r\n\r\nMediaTek Dimensity 800U 5G\r\nRAM:\r\n\r\n8 GB + 3 GB (Công nghệ mở rộng RAM)\r\nBộ nhớ trong:\r\n\r\n128 GB\r\nSIM:\r\n\r\n2 Nano SIMHỗ trợ 5G\r\nPin, Sạc:\r\n\r\n4000 mAh33 W'),
(105, 17, 6, 'Vivo X70 Pro 5G ', '1404417564vivo-x70-pro-xanh-hong-1-600x600.jpg', 18990000, 90, 'Vivo cho ra mắt Vivo X70 Pro, một sản phẩm cao cấp ấn tượng với kiểu dáng lẫn hiệu năng tuyệt vời. Đặc biệt, camera còn được nâng cấp hàng loạt các tính năng thông minh, cùng bạn sáng tạo nên những kiệt tác đầy nghệ thuật', 'Màn hình:\r\n\r\nAMOLED6.56\"Full HD+\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nCamera sau:\r\n\r\nChính 50 MP & Phụ 12 MP, 12 MP, 8 MP\r\nCamera trước:\r\n\r\n32 MP\r\nChip:\r\n\r\nMediaTek Dimensity 1200\r\nRAM:\r\n\r\n12 GB\r\nBộ nhớ trong:\r\n\r\n256 GB\r\nSIM:\r\n\r\n2 Nano SIMHỗ trợ 5G\r\nPin, Sạc:\r\n\r\n4450 mAh44 W'),
(106, 17, 6, 'Vivo Y20s', '657966107vivo-y20s-xanh-1-600x600.jpg', 4990000, 100, 'Sau Y20 thì Vivo đã tung ra mẫu điện thoại Y20s. Mẫu smartphone được nâng cấp dung lượng bộ nhớ và RAM cao hơn mang đến trải nghiệm mượt mà, lưu trữ thoải mái, đi kèm thiết kế đẹp mắt ấn tượng, dung lượng pin lớn đáp ứng nhu cầu giải trí cả ngày dài', 'Màn hình:\r\n\r\nIPS LCD6.51\"HD+\r\nHệ điều hành:\r\n\r\nAndroid 10\r\nCamera sau:\r\n\r\nChính 13 MP & Phụ 2 MP, 2 MP\r\nCamera trước:\r\n\r\n8 MP\r\nChip:\r\n\r\nSnapdragon 460\r\nRAM:\r\n\r\n6 GB\r\nBộ nhớ trong:\r\n\r\n128 GB\r\nSIM:\r\n\r\n2 Nano SIMHỗ trợ 4G\r\nPin, Sạc:\r\n\r\n5000 mAh18 W'),
(107, 14, 6, 'Xiaomi 11T 5G 256GB ', '1161304029xiaomi-11t-grey-1-600x600.jpg', 11990000, 100, 'Xiaomi 11T 5G sở hữu màn hình AMOLED, viên pin siêu khủng cùng camera độ phân giải 108 MP, chiếc smartphone này của Xiaomi sẽ đáp ứng mọi nhu cầu sử dụng của bạn, từ giải trí đến làm việc đều vô cùng mượt mà', 'Màn hình:\r\n\r\nAMOLED6.67\"Full HD+\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nCamera sau:\r\n\r\nChính 108 MP & Phụ 8 MP, 5 MP\r\nCamera trước:\r\n\r\n16 MP\r\nChip:\r\n\r\nMediaTek Dimensity 1200\r\nRAM:\r\n\r\n8 GB\r\nBộ nhớ trong:\r\n\r\n256 GB\r\nSIM:\r\n\r\n2 Nano SIMHỗ trợ 5G\r\nPin, Sạc:\r\n\r\n5000 mAh67 W'),
(108, 14, 6, 'Xiaomi Mi 11 5G', '1561074405xiaomi-mi-11-xanhduong-600x600-600x600.jpg', 1990000, 60, 'Xiaomi Mi 11 một siêu phẩm đến từ Xiaomi, máy cho trải nghiệm hiệu năng hàng đầu với vi xử lý Qualcomm Snapdragon 888, cùng loạt công nghệ đỉnh cao, khiến bất kỳ ai cũng sẽ choáng ngợp về smartphone này', 'Màn hình:\r\n\r\nAMOLED6.81\"Quad HD+ (2K+)\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nCamera sau:\r\n\r\nChính 108 MP & Phụ 13 MP, 5 MP\r\nCamera trước:\r\n\r\n20 MP\r\nChip:\r\n\r\nSnapdragon 888\r\nRAM:\r\n\r\n8 GB\r\nBộ nhớ trong:\r\n\r\n256 GB\r\nSIM:\r\n\r\n2 Nano SIMHỗ trợ 5G\r\nPin, Sạc:\r\n\r\n4600 mAh55 W'),
(109, 14, 6, 'Xiaomi Redmi Note 10 Pro (8GB/128GB)', '1443970673redmi-10-gray-600x600.jpg', 7490000, 300, 'Kế thừa và nâng cấp từ thế hệ trước, Xiaomi đã cho ra mắt Xiaomi Redmi Note 10 Pro (8GB/128GB) sở hữu một thiết kế cao cấp, sang trọng bên cạnh cấu hình vô cùng mạnh mẽ, hứa hẹn mang đến sự cạnh tranh lớn trong phân khúc smartphone tầm trung', 'Màn hình:\r\n\r\nAMOLED6.67\"Full HD+\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nCamera sau:\r\n\r\nChính 108 MP & Phụ 8 MP, 5 MP, 2 MP\r\nCamera trước:\r\n\r\n16 MP\r\nChip:\r\n\r\nSnapdragon 732G\r\nRAM:\r\n\r\n8 GB\r\nBộ nhớ trong:\r\n\r\n128 GB\r\nSIM:\r\n\r\n2 Nano SIMHỗ trợ 4G\r\nPin, Sạc:\r\n\r\n5020 mAh33 W'),
(110, 14, 6, 'Xiaomi Redmi Note 10 5G 8GB', '89947082xiaomi-redmi-note-10-5g-xanh-bong-dem-1-600x600.jpg', 5990000, 100, 'Redmi Note 10 5G một trong những mẫu điện thoại thuộc series Redmi Note 10 của Xiaomi, không chỉ sở hữu hiệu năng mạnh mẽ đáp ứng tốt nhu cầu chơi game, đây còn là chiếc điện thoại có hỗ trợ mạng 5G cho tốc độ kết nối nhanh chóng', 'Màn hình:\r\n\r\nIPS LCD6.5\"Full HD+\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nCamera sau:\r\n\r\nChính 48 MP & Phụ 2 MP, 2 MP\r\nCamera trước:\r\n\r\n8 MP\r\nChip:\r\n\r\nMediaTek Dimensity 700\r\nRAM:\r\n\r\n8 GB\r\nBộ nhớ trong:\r\n\r\n128 GB\r\nSIM:\r\n\r\n2 Nano SIMHỗ trợ 5G\r\nPin, Sạc:\r\n\r\n5000 mAh18 W'),
(111, 14, 2, 'Xiaomi Pad 5 256GB ', '119049276xiaomi-pad-5-grey-600x600.jpg', 10490000, 50, 'Xiaomi cho ra mắt Xiaomi Pad 5 256GB, chiếc máy tính bảng có thiết kế mỏng nhẹ, thời trang cùng cấu hình hàng đầu đáp ứng hết các nhu cầu của bạn, dù là học tập, giải trí hay làm việc đều trở nên vô cùng trơn tru', 'Màn hình:\r\n\r\n11\"IPS LCD\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nChip:\r\n\r\nSnapdragon 860 8 nhân\r\nRAM:\r\n\r\n6 GB\r\nBộ nhớ trong:\r\n\r\n256 GB\r\nCamera sau:\r\n\r\n13 MP\r\nCamera trước:\r\n\r\n8 MP\r\nPin, Sạc:\r\n\r\n8720 mAh33 W'),
(112, 14, 2, 'Xiaomi Pad 5 128GB', '1678589246xiaomi-pad-5-white-600x600.jpg', 8990000, 50, 'Xiaomi đã mang dòng máy tính bảng quay trở lại sau một thời gian dài vắng bóng bằng việc ra mắt Xiaomi Pad 5. Sản phẩm này được trang bị một thiết kế hiện đại cùng hàng loạt nâng cấp về cấu hình và các tính năng hữu ích', 'Màn hình:\r\n\r\n11\"IPS LCD\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nChip:\r\n\r\nSnapdragon 860 8 nhân\r\nRAM:\r\n\r\n6 GB\r\nBộ nhớ trong:\r\n\r\n128 GB\r\nCamera sau:\r\n\r\n13 MP\r\nCamera trước:\r\n\r\n8 MP\r\nPin, Sạc:\r\n\r\n8720 mAh33 W'),
(113, 14, 3, 'Đồng hồ thông minh Mi Watch', '1551279312mi-watch-den-thumb-600x600.jpg', 2390000, 50, 'Đồng hồ thông minh Mi Watch này mang phong cách trẻ trung, cá tính và đậm chất thể thao. Đồng hồ được trang bị công nghệ màn hình AMOLED với kích thước 1.39 inch cùng độ phân giải 454 x 454 pixels và độ sáng lên đến 450 nits giúp người dùng có thể quan sát thông tin rõ nét, chất lượng. Bên cạnh đó, đồng hồ còn được trang bị mặt kính cường lực Gorilla Glass 3 hạn chế trầy xước và tăng độ bền cho thiết bị', 'Màn hình:\r\n\r\nAMOLED1.39 inch\r\nThời lượng pin:\r\n\r\nKhoảng 16 ngàyKhoảng 50 giờ cho chế độ thể thao và GPS\r\nKết nối với hệ điều hành:\r\n\r\nAndroid 5.0 trở lêniOS 11 trở lên\r\nMặt:\r\n\r\nKính cường lực Gorilla Glass 346 mm\r\nTính năng cho sức khỏe:\r\n\r\nChế độ luyện tậpTheo dõi giấc ngủTính lượng calories tiêu thụTự động phát hiện chế độ tập luyệnĐo nhịp timĐo nồng độ oxy (SpO2)Đếm số bước chân');
INSERT INTO `products` (`ProductID`, `ManufacturerID`, `CategoryID`, `ProductName`, `ImageUrl`, `Price`, `Quantity`, `Description`, `Body`) VALUES
(114, 14, 2, 'Vòng đeo tay thông minh Mi Band 6 ', '1425958561mi-band-6-thumb-1-1-600x600.jpg', 990000, 50, '', 'Màn hình:\r\n\r\nAMOLED1.56 inch\r\nThời lượng pin:\r\n\r\nKhoảng 15 ngày\r\nKết nối với hệ điều hành:\r\n\r\nAndroid 5.0 trở lêniOS 10 trở lên\r\nMặt:\r\n\r\nKính cường lực\r\nDây:\r\n\r\n22 cm\r\nTính năng cho sức khỏe:\r\n\r\nChế độ luyện tậpTheo dõi giấc ngủTheo dõi mức độ stressTính lượng calories tiêu thụĐo nhịp timĐo nồng độ oxy (SpO2)Đếm số bước chân\r\nTiện ích:\r\n\r\nBáo thứcDự báo thời tiếtRung thông báoThay mặt đồng hồĐiều khiển chơi nhạcĐiều khiển chụp ảnh'),
(115, 14, 3, 'Vòng đeo tay thông minh Mi Band 5 ', '1106754590mi-band-5-thumb-1-1-600x600.jpg', 590000, 30, 'Vòng đeo tay thông minh Mi Band 5 có màn hình 1.1 inch cùng độ phân giải là 126 x 294 pixels, lớn hơn so với phiên bản 0.95 inch của Mi Band 4. Mật độ điểm ảnh trên Mi Band 5 được nâng cấp lên đến 300ppi, vì thế người dùng có thể quan sát các thông báo rõ ràng trên màn hình. Dây đeo làm từ silicone với thiết kế ôm trọn cổ tay, mang lại cảm giác vô cùng mềm mại và không bị phai màu khi sử dụng sau một thời gian dài.', 'Màn hình:\r\n\r\nAMOLED1.1 inch\r\nThời lượng pin:\r\n\r\nKhoảng 14 ngày\r\nKết nối với hệ điều hành:\r\n\r\nAndroid 5.0 trở lêniOS 10 trở lên\r\nMặt:\r\n\r\nKính cường lực19 mm\r\nDây:\r\n\r\n22.6 cm\r\nTính năng cho sức khỏe:\r\n\r\nChế độ luyện tậpTheo dõi giấc ngủTính quãng đường chạyĐo nhịp timĐếm số bước chân\r\nTiện ích:\r\n\r\nBáo thứcDự báo thời tiếtRung thông báoThay mặt đồng hồTừ chối cuộc gọiĐiều khiển chụp ảnhĐồng hồ bấm giờ'),
(116, 14, 9, 'Pin sạc dự phòng không dây Polymer 10.000 mAh Type C Xiaomi Mi Wireless Power Bank Essential ', '152406844sac-du-phong-polymer-10000mah-khong-day-xiaomi-avatar-1-600x600.jpg', 629000, 30, 'Thiết kế mỏng nhẹ, chắc chắn.\r\nTích hợp sạc không dây chuẩn Qi với công suất tối đa 10 W.\r\nSạc nhanh với đầu ra USB - A công suất 18 W.\r\nCó thể sạc đồng thời hai tính năng sạc có dây và không dây.\r\nĐầu vào USB - C với 3 mức 5V - 3A | 9V - 2A | 12V - 1.5A.\r\nDung lượng pin lến đến 10.000 mAh với hiệu suất sạc 58%.\r\nTrang bị 9 lớp bảo vệ vi mạch đảm bảo an toàn.', 'Hiệu suất sạc:\r\n\r\n58%\r\nDung lượng pin:\r\n\r\n10.000 mAh\r\nThời gian sạc đầy pin:\r\n\r\n3 - 4 giờ (dùng 9V/2A hoặc 12V/1.5A)5 - 6 giờ (dùng Adapter 5V - 3A )\r\nNguồn vào:\r\n\r\nType C: 5V - 3A, 9V - 2A, 12V - 1.5A\r\nNguồn ra:\r\n\r\nSạc không dây: 10 W (Android), 5 W/7.5 W (iOS)USB QC: 5V - 2.4A, 9V - 2A, 12V - 1.5A\r\nLõi pin:\r\n\r\nPolymer\r\nCông nghệ/Tiện ích:\r\n\r\nĐèn LED báo hiệuSạc không dây chuẩn Qi\r\nKích thước:\r\n\r\nDài 14.8 cm - Rộng 7 cm - Dày 1.6 cm\r\nTrọng lượng:\r\n\r\n310 g\r\nThương hiệu của:\r\n\r\nTrung Quốc\r\nSản xuất tại:\r\n\r\nTrung Quốc'),
(117, 14, 9, 'Pin sạc dự phòng Polymer 10.000 mAh Type C Xiaomi Power Bank 3 Ultra Compact', '1812477282polymer-10000mah-xiaomi-ultra-compact-avt-1-1-600x600.jpg', 790000, 30, 'Pin sạc dự phòng Polymer 10.000mAh Type C Xiaomi Power Bank 3 Ultra Compact đen gần như chỉ bằng 1 tấm thẻ ngân hàng, trọng lượng 200 gram, không chiếm diện tích, cho bạn dễ dàng bỏ vào túi quần, balo, túi xách và mang theo bên mình khi cần. Bề mặt phủ màu đen tuyền phong cách, có đường kẻ dọc bám tay, cầm nắm chắc chắn hơn.', 'Hiệu suất sạc:\r\n\r\n55%\r\nDung lượng pin:\r\n\r\n10.000 mAh\r\nThời gian sạc đầy pin:\r\n\r\n10 - 11 giờ (dùng Adapter 1A)6 - 8 giờ (dùng Adapter 2A)\r\nNguồn vào:\r\n\r\nType C: 5V - 3A, 9V - 2.5A, 12V - 1.85AMicro USB: 5V - 2A, 9V - 2A\r\nNguồn ra:\r\n\r\nType C: 5V - 3A, 9V - 2.5A, 12V - 1.85AUSB: 5V - 2.4A, 9V - 2.5A, 12V - 1.85A\r\nLõi pin:\r\n\r\nPolymer\r\nCông nghệ/Tiện ích:\r\n\r\nĐèn LED báo hiệuPower Delivery\r\nKích thước:\r\n\r\nDài 9 cm - Rộng 6.5 cm - Dày 2.5 cm\r\nTrọng lượng:\r\n\r\n200 g\r\nThương hiệu của:\r\n\r\nTrung Quốc\r\nSản xuất tại:\r\n\r\nTrung Quốc'),
(118, 14, 7, 'Tai nghe Bluetooth True Wireless Xiaomi Earbuds Basic 2 BHR4272GL', '1993793706bluetooth-tws-xiaomi-earbuds-basic-2-ava-1-600x600.jpg', 553000, 60, 'Tai nghe Bluetooth True Wireless Xiaomi Earbuds Basic 2 BHR4272GL có kích thước nhỏ gọn chỉ nặng 35.4 g không hề nặng tai khi sử dụng lâu. Tai nghe tặng kèm 2 nút đệm tai với kích thước khác nhau giúp bạn dễ dàng lựa chọn phù hợp với tai tránh lỏng lẻo, rơi rớt', 'Thời gian tai nghe:\r\n\r\nDùng 4 giờ - Sạc 1.5 giờ\r\nThời gian hộp sạc:\r\n\r\nDùng 12 giờ - Sạc 2 giờ\r\nCổng sạc:\r\n\r\nMicro USB\r\nCông nghệ âm thanh:\r\n\r\nLọc âm, khử ồn DSP\r\nTương thích:\r\n\r\nAndroidiOS (iPhone)Windows\r\nTiện ích:\r\n\r\nChống nước\r\nĐiều khiển bằng:\r\n\r\nPhím nhấn'),
(119, 14, 7, 'Tai nghe Bluetooth True Wireless Earphones 2 Xiaomi ZBW4493GL Trắng ', '1513135964226701-600x600.jpg', 1813000, 60, 'Kiểu dáng nhỏ gọn cùng thiết kế hiện đại, trẻ trung.\r\nKết nối nhanh chóng và ổn định trong phạm vi 10 m nhờ Bluetooth 5.0.\r\nDễ dàng điều khiển chỉ bằng cảm ứng thao tác chạm.\r\nTrò chuyện điện thoại thoải mái và rõ ràng hơn nhờ công nghệ khử tiếng ồn.\r\nBảo vệ tai nghe khỏi tác hại của nước với chuẩn chống nước IPX5.\r\nChất âm sống động, tận hưởng trọn vẹn các giai điệu.\r\nThời gian sử dụng 4 giờ, kèm hộp sạc 18 giờ và sạc 1 giờ.', 'Thời gian tai nghe:\r\n\r\nDùng 4 giờ - Sạc 1 giờ\r\nThời gian hộp sạc:\r\n\r\nDùng 18 giờ - Sạc 1.5 giờ\r\nCổng sạc:\r\n\r\nType-C\r\nTương thích:\r\n\r\nAndroidiOS (iPhone)Windows\r\nTiện ích:\r\n\r\nChống nước\r\nĐiều khiển bằng:\r\n\r\nCảm ứng chạm'),
(120, 14, 7, 'ai nghe Bluetooth True Wireless Earphones 2 Basic Xiaomi BHR4089GL Trắng', '910348719226702-600x600.jpg', 1113000, 60, 'Tai nghe Bluetooth TWS Earphones 2 Basic Xiaomi BHR4089GL có hộp đựng cũng là hộp sạc hình vuông cho cảm giác cầm nắm vừa tay, cùng gam màu trắng thời thượng tạo nên phong cách cho bạn. Tai nghe đi kèm với chiếc hộp đựng được làm bằng nhựa, mặt trước có đèn Led thông báo thời lượng pin, mặt sau hộp có cổng sạc USB Type C', 'Thời gian tai nghe:\r\n\r\nDùng 5 giờ - Sạc 1.5 giờ\r\nThời gian hộp sạc:\r\n\r\nDùng 20 giờ - Sạc 1.5 giờ\r\nCổng sạc:\r\n\r\nType-C\r\nCông nghệ âm thanh:\r\n\r\ncodecAAC\r\nTương thích:\r\n\r\nAndroidiOS (iPhone)Windows\r\nTiện ích:\r\n\r\nChống nước\r\nĐiều khiển bằng:\r\n\r\nCảm ứng chạm'),
(121, 18, 6, 'Realme C11 (2021)', '406862828realme-c11-2021-blue-1-600x600.jpg', 2990000, 50, 'Các dòng smartphone giá rẻ ngày càng được ưa chuộng trên thị trường di động, nắm bắt được nhu cầu đó Realme cũng đã cho ra mắt chiếc điện thoại Realme C11 (2021) là một phiên bản đồng tên gọi với Realme C11 ra mắt trước đó.', 'Màn hình:\r\n\r\nLCD6.5\"HD+\r\nHệ điều hành:\r\n\r\nAndroid 11 (Go Edition)\r\nCamera sau:\r\n\r\n8 MP\r\nCamera trước:\r\n\r\n5 MP\r\nChip:\r\n\r\nSpreadtrum SC9863A\r\nRAM:\r\n\r\n2 GB\r\nBộ nhớ trong:\r\n\r\n32 GB\r\nSIM:\r\n\r\n2 Nano SIMHỗ trợ 4G\r\nPin, Sạc:\r\n\r\n5000 mAh10 W'),
(122, 18, 6, 'Realme 8 Pro Vàng Rực Rỡ', '449368213realme-8-pro-vang-600x600.jpg', 8690000, 60, 'Realme 8 Pro Vàng Rực Rỡ là sản phẩm được kết hợp giữa sức mạnh đáng ngưỡng mộ của Realme 8 Pro và màu vàng đầy sang trọng. Chiếc điện thoại hứa hẹn sẽ đem lại sự hài lòng đáng mong đợi cho người dùng bởi sự hoàn hảo của nó', 'Màn hình:\r\n\r\nSuper AMOLED6.4\"Full HD+\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nCamera sau:\r\n\r\nChính 108 MP & Phụ 8 MP, 2 MP, 2 MP\r\nCamera trước:\r\n\r\n16 MP\r\nChip:\r\n\r\nSnapdragon 720G\r\nRAM:\r\n\r\n8 GB\r\nBộ nhớ trong:\r\n\r\n128 GB\r\nSIM:\r\n\r\n2 Nano SIMHỗ trợ 4G\r\nPin, Sạc:\r\n\r\n4500 mAh50 W'),
(123, 18, 6, ' Realme 7 Pro', '195126921realme-7-pro-bac-600x600.jpg', 8690000, 60, 'Chiếc điện thoại Realme 7 Pro của Realme chính thức ra mắt. Nổi bật với 4 camera sau AI chuyên nghiệp, cấu hình mạnh mẽ và công nghệ sạc cực nhanh SuperDart 65 W đi kèm nhiều tính năng nổi trội khác', 'Màn hình:\r\n\r\nSuper AMOLED6.4\"Full HD+\r\nHệ điều hành:\r\n\r\nAndroid 10\r\nCamera sau:\r\n\r\nChính 64 MP & Phụ 8 MP, 2 MP, 2 MP\r\nCamera trước:\r\n\r\n32 MP\r\nChip:\r\n\r\nSnapdragon 720G\r\nRAM:\r\n\r\n8 GB\r\nBộ nhớ trong:\r\n\r\n128 GB\r\nSIM:\r\n\r\n2 Nano SIMHỗ trợ 4G\r\nPin, Sạc:\r\n\r\n4500 mAh65 W'),
(124, 18, 6, 'Realme 6 Pro ', '698683538realme-6-pro-do-600x600.jpg', 6990000, 60, 'Realme 6 Pro là mẫu smartphone cao cấp hơn trong bộ đôi Realme 6 Series của Realme. Vẫn với tiêu chí smartphone cấu hình mạnh - giá tốt, Realme 6 Pro còn nổi bật với cụm 6 camera ấn tượng, màn hình siêu mượt 90 Hz theo xu hướng', 'Màn hình:\r\n\r\nIPS LCD6.6\"Full HD+\r\nHệ điều hành:\r\n\r\nAndroid 10\r\nCamera sau:\r\n\r\nChính 64 MP & Phụ 12 MP, 8 MP, 2 MP\r\nCamera trước:\r\n\r\nChính 16 MP & Phụ 8 MP\r\nChip:\r\n\r\nSnapdragon 720G\r\nRAM:\r\n\r\n8 GB\r\nBộ nhớ trong:\r\n\r\n128 GB\r\nSIM:\r\n\r\n2 Nano SIMHỗ trợ 4G\r\nPin, Sạc:\r\n\r\n4300 mAh30 W'),
(125, 18, 6, 'Realme C21Y 4GB', '905964129realme-c21-y-black-600x600.jpg', 4290000, 60, 'Realme C21Y chiếc điện thoại với thiết kế đẹp mắt, tinh tế hướng đến đối tượng người dùng phổ thông đang tìm kiếm một sản phẩm với cấu hình tốt, đầy đủ tính năng hấp dẫn và đặc biệt là pin khủng cho một ngày làm việc sử dụng lâu dài. ', 'Màn hình:\r\n\r\nIPS LCD6.5\"HD+\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nCamera sau:\r\n\r\nChính 13 MP & Phụ 2 MP, 2 MP\r\nCamera trước:\r\n\r\n5 MP\r\nChip:\r\n\r\nSpreadtrum T610 8 nhân\r\nRAM:\r\n\r\n4 GB\r\nBộ nhớ trong:\r\n\r\n64 GB\r\nSIM:\r\n\r\n2 Nano SIMHỗ trợ 4G\r\nPin, Sạc:\r\n\r\n5000 mAh10 W'),
(126, 20, 2, 'Lenovo Tab P11 Plus', '633183072lenovo-tab-p11-plus-2-600x600.jpg', 8190000, 60, 'Lenovo Tab P11 Plus sẽ là một lựa chọn để làm việc thay thế laptop khi nhu cầu sử dụng không quá cao, máy được trang bị cấu hình mạnh mẽ, màn hình lớn cùng các chế độ tiện ích đa dạng, đáp ứng được hầu hết nhu cầu của một người sáng tạo với mức giá phải chăng đến từ Lenovo', 'Màn hình:\r\n\r\n11\"IPS LCD\r\nHệ điều hành:\r\n\r\nAndroid 11\r\nChip:\r\n\r\nMediaTek Helio G90T\r\nRAM:\r\n\r\n4 GB\r\nBộ nhớ trong:\r\n\r\n64 GB\r\nKết nối:\r\n\r\nHỗ trợ 4G\r\nSIM:\r\n\r\n1 Nano SIM\r\nCamera sau:\r\n\r\n13 MP\r\nCamera trước:\r\n\r\n8 MP\r\nPin, Sạc:\r\n\r\n7700 mAh20 W'),
(127, 20, 2, 'Lenovo Tab M10 - FHD Plus', '1968049412tab-m10-fhd-plus-600-600x600.jpg', 6190000, 60, 'Từ việc sử dụng các thiết bị điện tử đa dạng của các gia đình hiện nay, Lenovo đã nắm bắt được nhu cầu thiết yếu này và cho ra mắt chiếc máy tính bảng Lenovo Tab M10 - FHD Plus với những tính năng tiện ích ấn tượng, “khoác chiếc áo” của thời đại và có mức giá siêu ưu đãi', 'Màn hình:\r\n\r\n10.3\"IPS LCD\r\nHệ điều hành:\r\n\r\nAndroid 9\r\nChip:\r\n\r\nMediaTek Helio P22T\r\nRAM:\r\n\r\n4 GB\r\nBộ nhớ trong:\r\n\r\n64 GB\r\nKết nối:\r\n\r\nHỗ trợ 4G\r\nSIM:\r\n\r\n1 Nano SIM\r\nCamera sau:\r\n\r\n8 MP\r\nCamera trước:\r\n\r\n5 MP\r\nPin, Sạc:\r\n\r\n5000 mAh10 W'),
(128, 20, 2, ' Lenovo Tab M10 - Gen 2 ', '778532414tab-m10-gen-2-600x600-600x600.jpg', 4990000, 60, 'Lenovo Tab M10 Gen 2 từ nhà Lenovo nổi bật trong phân khúc tầm trung khi sở hữu thiết kế gọn nhẹ, hiện đại cùng khả năng kết nối mạnh mẽ, viên pin ấn tượng và cấu hình ổn định trong tầm giá.', 'Màn hình:\r\n\r\n10\"IPS LCD\r\nHệ điều hành:\r\n\r\nAndroid 10\r\nChip:\r\n\r\nMediaTek Helio P22T\r\nRAM:\r\n\r\n2 GB\r\nBộ nhớ trong:\r\n\r\n32 GB\r\nKết nối:\r\n\r\nHỗ trợ 4GCó nghe gọi\r\nSIM:\r\n\r\n1 Nano SIM\r\nCamera sau:\r\n\r\n8 MP\r\nCamera trước:\r\n\r\n5 MP\r\nPin, Sạc:\r\n\r\n5000 mAh10 W'),
(129, 20, 2, 'Lenovo Tab M8 ', '1207852322lenovo-tab-m8-bac-600x600.jpg', 3990000, 60, 'Lenovo Tab M8 chiếc máy tính bảng giá rẻ, cấu hình ổn, thiết kế cao cấp trong tầm giá, hoàn toàn phù hợp với các nhu cầu cơ bản như đọc báo, xem phim, lướt web hằng ngày.', 'Màn hình:\r\n\r\n8\"IPS LCD\r\nHệ điều hành:\r\n\r\nAndroid 9\r\nChip:\r\n\r\nMediaTek Helio A22\r\nRAM:\r\n\r\n3 GB\r\nBộ nhớ trong:\r\n\r\n32 GB\r\nKết nối:\r\n\r\nHỗ trợ 4GCó nghe gọi\r\nSIM:\r\n\r\n1 Nano SIM\r\nCamera sau:\r\n\r\n5 MP\r\nCamera trước:\r\n\r\n2 MP\r\nPin, Sạc:\r\n\r\n5000 mAh5 W'),
(130, 15, 2, 'Huawei MatePad 11', '212328638huawei-matepad-11-grey-600x600.jpg', 13990000, 10, 'Màn hình 10.9\", IPS LCD\r\n\r\nChip Snapdragon 865 8 nhân\r\n\r\nRAM 6 GB, ROM 128 GB\r\n\r\nPin 7250 mAh, Sạc 18 W', 'Màn hình 10.9\", IPS LCD\r\n\r\nChip Snapdragon 865 8 nhân\r\n\r\nRAM 6 GB, ROM 128 GB\r\n\r\nPin 7250 mAh, Sạc 18 W'),
(131, 15, 2, 'Huawei MatePad 128GB (Nền tảng Huawei Mobile Service)', '424720103huawei-matepad-xam-128gb-600x600.jpg', 7790000, 30, 'Màn hình 10.4\", IPS LCD\r\n\r\nChip Kirin 820 8 nhân\r\n\r\nRAM 4 GB, ROM 128 GB\r\n\r\nPin 7250 mAh, Sạc 22.5 W', 'Màn hình 10.4\", IPS LCD\r\n\r\nChip Kirin 820 8 nhân\r\n\r\nRAM 4 GB, ROM 128 GB\r\n\r\nPin 7250 mAh, Sạc 22.5 W'),
(132, 15, 2, 'Huawei MatePad T10s 4GB', '1505257283Huawei-MatePad-T10s-600x600.jpg', 5990000, 10, 'Màn hình 10.1\", IPS LCD\r\n\r\nChip Kirin 710A\r\n\r\nRAM 4 GB, ROM 64 GB\r\n\r\nHỗ trợ 4G, Có nghe gọi\r\n\r\nPin 5100 mAh, Sạc 10 W', 'Màn hình 10.1\", IPS LCD\r\n\r\nChip Kirin 710A\r\n\r\nRAM 4 GB, ROM 64 GB\r\n\r\nHỗ trợ 4G, Có nghe gọi\r\n\r\nPin 5100 mAh, Sạc 10 W'),
(133, 15, 2, 'Huawei MatePad T10', '139827597Huawei-MatePad-T10-1-2-600x600.jpg', 4990000, 10, 'Màn hình 9.7\", IPS LCD\r\n\r\nChip Kirin 710A\r\n\r\nRAM 2 GB, ROM 32 GB\r\n\r\nHỗ trợ 4G, Có nghe gọi\r\n\r\nPin 5100 mAh, Sạc 5 W', 'Màn hình 9.7\", IPS LCD\r\n\r\nChip Kirin 710A\r\n\r\nRAM 2 GB, ROM 32 GB\r\n\r\nHỗ trợ 4G, Có nghe gọi\r\n\r\nPin 5100 mAh, Sạc 5 W'),
(134, 15, 7, 'Tai nghe Bluetooth True Wireless Huawei FreeBuds 3', '1435928948tai-nghe-bluetooth-tws-huawei-freebuds-3-avatar-1-600x600.jpg', 4290000, 10, '', ''),
(135, 19, 9, 'Anker PowerCore A1263', '652073478sac-du-phong-anker-powercore-a1263-avatar-1-600x600.jpg', 750000, 100, '', ''),
(136, 19, 9, 'Anker PowerCore Select A1223', '1599475725sac-du-phong-10000mah-anker-powercore-select-a1223-avatar-1-600x600.jpg', 570000, 100, '', ''),
(137, 19, 9, 'Anker PowerCore II A1230', '857482709sac-du-phong-10000mah-anker-powercore-ii-a1230-avatar-1-600x600.jpg', 712000, 100, '', ''),
(138, 13, 9, 'Anker PowerCore Essential A1287', '888998119pin-polymer-20000mah-type-c-pd-20w-anker-a1287-avatar-600x600.jpg', 1330000, 100, '', ''),
(139, 19, 8, 'Sạc Anker PowerPort III Nano A2633', '1243480612230266-600x600.jpg', 380000, 100, '', ''),
(140, 13, 8, 'Sạc 2 cổng Anker Powerport Speed 2 - A2025', '643580130adapter-sac-2-cong-3a-anker-a2025-den-avatar-1-600x600.jpg', 693000, 100, '', ''),
(141, 19, 8, 'Cáp Type C - Lightning Anker PowerLine+ II A8652', '1918770944cap-type-c-lightning-mfi-anker-powerline-ii-a8652-avatar-1-600x600.jpg', 475000, 100, '', ''),
(142, 19, 8, 'Cáp Lightning Anker PowerLine+ II A8452', '1608071911cap-lightning-mfi-09m-anker-powerline-ii-a8452-avatar-1-600x600.jpg', 322000, 100, '', ''),
(143, 22, 9, 'Energizer UE20011PQ', '610699341energizer-ue20011pq-ava-fix2-600x600-1-600x600.jpg', 825000, 60, '', ''),
(144, 22, 9, 'Energizer Báo Xám QE10000GY', '906059605pin-du-phong-c-wireless-energizer-qc10000gy-xam-avatar-1-1-600x600.jpg', 810000, 60, '', ''),
(145, 22, 9, 'Energizer QE10007PQ', '1155618504pin-sac-khong-day-10000mah-type-c-pd-qc3-qe10007pq-avatar-1-600x600.jpg', 900000, 60, '', ''),
(146, 22, 9, 'Energizer Chiến Binh II UE10046', '333905960pin-du-phong-polymer-10000mah-energizer-ue10046-xa-avatar-1-1-600x600.jpg', 495000, 60, '', ''),
(147, 21, 7, 'Tai nghe True Wireless Sony WF-1000XM4', '954419945bluetooth-true-wireless-sony-wf-1000xm4-thumb1-600x600.jpg', 6490000, 60, '', ''),
(148, 21, 7, 'Tai nghe Bluetooth True Wireless Sony WF-C500', '2028886524bluetooth-true-wireless-sony-wf-c500-thumb-600x600.jpg', 2290000, 60, '', ''),
(149, 21, 7, 'Tai nghe Bluetooth True Wireless Sony WF-1000XM3', '1194185379tai-nghe-bluetooth-tws-sony-wf-1000xm3-avatar-1-600x600.jpg', 4790000, 60, '', ''),
(150, 21, 7, 'Tai nghe Bluetooth Chụp Tai Sony WH-1000XM4', '627410749tai-nghe-chup-tai-bluetooth-sony-wh-1000xm4-avatar-1-600x600.jpg', 8490000, 60, '', ''),
(151, 21, 7, 'Tai nghe Bluetooth Sony WI-C200', '893509330tai-nghe-ep-bluetooth-sony-wi-xb400-avatar-1-600x600.jpg', 990000, 60, '', ''),
(152, 21, 7, 'Tai nghe Có Dây Sony MDR-EX155AP', '620656766tai-nghe-nhet-tai-ep-sony-mdr-ex155ap-avatar-1-600x600.jpg', 390000, 100, '', ''),
(155, 14, 6, 'test', '1674819369đăngnhập.jpg', 132, 10, 'Điệnt thoại', 'điện thoại thôn gminh');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `UserName` varchar(20) NOT NULL,
  `PassWord` varchar(32) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `GroupID`, `FullName`, `UserName`, `PassWord`, `Email`) VALUES
(48, 3, 'hiep', 'hiep', '805392449a0d730aa249a4f0a5b00d2b', 'hiep'),
(46, 1, 'nhat', 'nhat', '35eb7cca72023c8eae70ad11595bae67', 'nhat'),
(45, 1, 'tinh', 'tinh', '802df3c585cfbaf52752a907665bc12f', '4501104138@student.edu.vn');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`GroupID`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`ManufacturerID`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`OrderID`,`ProductID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `ManufacturerID` (`ManufacturerID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `UserName` (`UserName`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `GroupID` (`GroupID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `GroupID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `ManufacturerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

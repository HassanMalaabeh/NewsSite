-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2018 at 04:12 PM
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
-- Database: `news`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) NOT NULL,
  `datetime` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `added_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `datetime`, `username`, `password`, `added_by`) VALUES
(1, 'Sep-12-2018 22:34:36', 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(10) NOT NULL,
  `datetime` varchar(50) NOT NULL,
  `category` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `datetime`, `category`, `author`) VALUES
(1, '2018-09-08 12:18:05', 'Politics', 'admin'),
(2, '2018-09-08 12:18:05', 'Business', 'admin'),
(3, '2018-09-08 12:18:05', 'Science', 'admin'),
(4, '2018-09-08 12:18:05', 'Sport', 'admin'),
(5, '2018-09-08 12:18:05', 'World', 'admin'),
(6, '2018-09-08 12:18:05', 'Technology', 'admin'),
(7, '2018-09-08 12:18:05', 'Health', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) NOT NULL,
  `datetime` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `approvedBy` varchar(100) NOT NULL,
  `status` varchar(5) NOT NULL,
  `postID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `datetime`, `name`, `email`, `comment`, `approvedBy`, `status`, `postID`) VALUES
(1, 'Sep-15-2018 17:53:32', 'ali', 'a@a.com', 'Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex.', 'Hassan', 'off', 10),
(2, 'Sep-15-2018 17:57:16', 'ahmad', 'ahmad@a.com', 'Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex.', 'Hassan', 'off', 10),
(3, 'Sep-15-2018 17:57:35', 'zzzzz', 'z@z.com', 'Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex.\r\n                        ', 'Hassan', 'on', 10);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `datetime` varchar(50) NOT NULL,
  `category` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `image` varchar(200) NOT NULL,
  `post` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `datetime`, `category`, `author`, `image`, `post`) VALUES
(1, 'Lorem ipsum dolor sit amet', 'Sep-15-2018 17:22:00', 'Technology', 'Hassan', 'datacenter_thumb_800x450_002.jpg', 'Lorem ipsum dolor sit amet, invenire rationibus mnesarchum no usu, ea quod vero mediocrem usu. Liber mucius dictas sed ei, ne has audire lobortis, pro ad sale nullam. Quod argumentum est ut, nulla nostro imperdiet vis ea. Te enim inani mediocritatem mea, ut sea assentior consectetuer signiferumque.Ex vel ubique fastidii reformidans, nam tale corrumpit quaerendum ad. Ei mea rebum commodo equidem, debitis albucius dignissim eu per. Justo harum sensibus id vel. Sea quando perpetua ea. Iusto homero insolens qui ad.Iuvaret invidunt suscipiantur ex his, eum id iusto fabulas persequeris, has no ignota mandamus. Vel evertitur gloriatur ad, quaeque alienum persequeris nec ad. Iriure singulis has ut. No aliquam consulatu mei, an vix dicat equidem facilisi. Primis dolorem cum no, ei mutat munere eos, aeterno appetere sit ea.Consul causae aeterno sit ex, ut mea tollit animal. Summo virtute deseruisse an sit, pro reque periculis temporibus ne. In recusabo mnesarchum instructior eam, duo nemore efficiantur in, magna offendit an vis. Nibh melius ceteros vim in. Tempor tacimates necessitatibus sit ne.Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex. Vivendum verterem ei sit, agam possim accumsan est ea. Nec latine eripuit suavitate te, quidam accusam an vim, per aeque salutandi eu.'),
(2, 'Lorem ipsum dolor sit amet', 'Sep-15-2018 17:21:32', 'Technology', 'Hassan', 'datacenter_thumb_800x450_002.jpg', 'Lorem ipsum dolor sit amet, invenire rationibus mnesarchum no usu, ea quod vero mediocrem usu. Liber mucius dictas sed ei, ne has audire lobortis, pro ad sale nullam. Quod argumentum est ut, nulla nostro imperdiet vis ea. Te enim inani mediocritatem mea, ut sea assentior consectetuer signiferumque.Ex vel ubique fastidii reformidans, nam tale corrumpit quaerendum ad. Ei mea rebum commodo equidem, debitis albucius dignissim eu per. Justo harum sensibus id vel. Sea quando perpetua ea. Iusto homero insolens qui ad.Iuvaret invidunt suscipiantur ex his, eum id iusto fabulas persequeris, has no ignota mandamus. Vel evertitur gloriatur ad, quaeque alienum persequeris nec ad. Iriure singulis has ut. No aliquam consulatu mei, an vix dicat equidem facilisi. Primis dolorem cum no, ei mutat munere eos, aeterno appetere sit ea.Consul causae aeterno sit ex, ut mea tollit animal. Summo virtute deseruisse an sit, pro reque periculis temporibus ne. In recusabo mnesarchum instructior eam, duo nemore efficiantur in, magna offendit an vis. Nibh melius ceteros vim in. Tempor tacimates necessitatibus sit ne.Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex. Vivendum verterem ei sit, agam possim accumsan est ea. Nec latine eripuit suavitate te, quidam accusam an vim, per aeque salutandi eu.'),
(3, 'Lorem ipsum dolor sit amet', 'Sep-15-2018 17:22:24', 'Technology', 'Hassan', 'datacenter_thumb_800x450_002.jpg', 'Lorem ipsum dolor sit amet, invenire rationibus mnesarchum no usu, ea quod vero mediocrem usu. Liber mucius dictas sed ei, ne has audire lobortis, pro ad sale nullam. Quod argumentum est ut, nulla nostro imperdiet vis ea. Te enim inani mediocritatem mea, ut sea assentior consectetuer signiferumque.Ex vel ubique fastidii reformidans, nam tale corrumpit quaerendum ad. Ei mea rebum commodo equidem, debitis albucius dignissim eu per. Justo harum sensibus id vel. Sea quando perpetua ea. Iusto homero insolens qui ad.Iuvaret invidunt suscipiantur ex his, eum id iusto fabulas persequeris, has no ignota mandamus. Vel evertitur gloriatur ad, quaeque alienum persequeris nec ad. Iriure singulis has ut. No aliquam consulatu mei, an vix dicat equidem facilisi. Primis dolorem cum no, ei mutat munere eos, aeterno appetere sit ea.Consul causae aeterno sit ex, ut mea tollit animal. Summo virtute deseruisse an sit, pro reque periculis temporibus ne. In recusabo mnesarchum instructior eam, duo nemore efficiantur in, magna offendit an vis. Nibh melius ceteros vim in. Tempor tacimates necessitatibus sit ne.Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex. Vivendum verterem ei sit, agam possim accumsan est ea. Nec latine eripuit suavitate te, quidam accusam an vim, per aeque salutandi eu.'),
(4, 'Lorem ipsum dolor sit amet', 'Sep-15-2018 17:23:38', 'Politics', 'Hassan', 'politics.jpg', 'Lorem ipsum dolor sit amet, invenire rationibus mnesarchum no usu, ea quod vero mediocrem usu. Liber mucius dictas sed ei, ne has audire lobortis, pro ad sale nullam. Quod argumentum est ut, nulla nostro imperdiet vis ea. Te enim inani mediocritatem mea, ut sea assentior consectetuer signiferumque.Ex vel ubique fastidii reformidans, nam tale corrumpit quaerendum ad. Ei mea rebum commodo equidem, debitis albucius dignissim eu per. Justo harum sensibus id vel. Sea quando perpetua ea. Iusto homero insolens qui ad.Iuvaret invidunt suscipiantur ex his, eum id iusto fabulas persequeris, has no ignota mandamus. Vel evertitur gloriatur ad, quaeque alienum persequeris nec ad. Iriure singulis has ut. No aliquam consulatu mei, an vix dicat equidem facilisi. Primis dolorem cum no, ei mutat munere eos, aeterno appetere sit ea.Consul causae aeterno sit ex, ut mea tollit animal. Summo virtute deseruisse an sit, pro reque periculis temporibus ne. In recusabo mnesarchum instructior eam, duo nemore efficiantur in, magna offendit an vis. Nibh melius ceteros vim in. Tempor tacimates necessitatibus sit ne.Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex. Vivendum verterem ei sit, agam possim accumsan est ea. Nec latine eripuit suavitate te, quidam accusam an vim, per aeque salutandi eu.'),
(5, 'Lorem ipsum dolor sit amet', 'Sep-15-2018 17:24:14', 'Business', 'Hassan', 'goals-for-your-business_512861902.jpg', 'Lorem ipsum dolor sit amet, invenire rationibus mnesarchum no usu, ea quod vero mediocrem usu. Liber mucius dictas sed ei, ne has audire lobortis, pro ad sale nullam. Quod argumentum est ut, nulla nostro imperdiet vis ea. Te enim inani mediocritatem mea, ut sea assentior consectetuer signiferumque.Ex vel ubique fastidii reformidans, nam tale corrumpit quaerendum ad. Ei mea rebum commodo equidem, debitis albucius dignissim eu per. Justo harum sensibus id vel. Sea quando perpetua ea. Iusto homero insolens qui ad.Iuvaret invidunt suscipiantur ex his, eum id iusto fabulas persequeris, has no ignota mandamus. Vel evertitur gloriatur ad, quaeque alienum persequeris nec ad. Iriure singulis has ut. No aliquam consulatu mei, an vix dicat equidem facilisi. Primis dolorem cum no, ei mutat munere eos, aeterno appetere sit ea.Consul causae aeterno sit ex, ut mea tollit animal. Summo virtute deseruisse an sit, pro reque periculis temporibus ne. In recusabo mnesarchum instructior eam, duo nemore efficiantur in, magna offendit an vis. Nibh melius ceteros vim in. Tempor tacimates necessitatibus sit ne.Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex. Vivendum verterem ei sit, agam possim accumsan est ea. Nec latine eripuit suavitate te, quidam accusam an vim, per aeque salutandi eu.'),
(6, 'Lorem ipsum dolor sit amet', 'Sep-15-2018 17:25:02', 'Health', 'Hassan', '1528307634-health-science-mandatory-subject-5.jpg', 'Lorem ipsum dolor sit amet, invenire rationibus mnesarchum no usu, ea quod vero mediocrem usu. Liber mucius dictas sed ei, ne has audire lobortis, pro ad sale nullam. Quod argumentum est ut, nulla nostro imperdiet vis ea. Te enim inani mediocritatem mea, ut sea assentior consectetuer signiferumque.Ex vel ubique fastidii reformidans, nam tale corrumpit quaerendum ad. Ei mea rebum commodo equidem, debitis albucius dignissim eu per. Justo harum sensibus id vel. Sea quando perpetua ea. Iusto homero insolens qui ad.Iuvaret invidunt suscipiantur ex his, eum id iusto fabulas persequeris, has no ignota mandamus. Vel evertitur gloriatur ad, quaeque alienum persequeris nec ad. Iriure singulis has ut. No aliquam consulatu mei, an vix dicat equidem facilisi. Primis dolorem cum no, ei mutat munere eos, aeterno appetere sit ea.Consul causae aeterno sit ex, ut mea tollit animal. Summo virtute deseruisse an sit, pro reque periculis temporibus ne. In recusabo mnesarchum instructior eam, duo nemore efficiantur in, magna offendit an vis. Nibh melius ceteros vim in. Tempor tacimates necessitatibus sit ne.Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex. Vivendum verterem ei sit, agam possim accumsan est ea. Nec latine eripuit suavitate te, quidam accusam an vim, per aeque salutandi eu.'),
(7, 'Lorem ipsum dolor sit amet', 'Sep-15-2018 17:25:16', 'Sport', 'Hassan', 'bigstock-Four-Sports-a-lot-of-balls-an-50626115.jpg', 'Lorem ipsum dolor sit amet, invenire rationibus mnesarchum no usu, ea quod vero mediocrem usu. Liber mucius dictas sed ei, ne has audire lobortis, pro ad sale nullam. Quod argumentum est ut, nulla nostro imperdiet vis ea. Te enim inani mediocritatem mea, ut sea assentior consectetuer signiferumque.Ex vel ubique fastidii reformidans, nam tale corrumpit quaerendum ad. Ei mea rebum commodo equidem, debitis albucius dignissim eu per. Justo harum sensibus id vel. Sea quando perpetua ea. Iusto homero insolens qui ad.Iuvaret invidunt suscipiantur ex his, eum id iusto fabulas persequeris, has no ignota mandamus. Vel evertitur gloriatur ad, quaeque alienum persequeris nec ad. Iriure singulis has ut. No aliquam consulatu mei, an vix dicat equidem facilisi. Primis dolorem cum no, ei mutat munere eos, aeterno appetere sit ea.Consul causae aeterno sit ex, ut mea tollit animal. Summo virtute deseruisse an sit, pro reque periculis temporibus ne. In recusabo mnesarchum instructior eam, duo nemore efficiantur in, magna offendit an vis. Nibh melius ceteros vim in. Tempor tacimates necessitatibus sit ne.Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex. Vivendum verterem ei sit, agam possim accumsan est ea. Nec latine eripuit suavitate te, quidam accusam an vim, per aeque salutandi eu.'),
(8, 'Lorem ipsum dolor sit amet', 'Sep-15-2018 17:27:18', 'Science', 'Hassan', 'science-onward-journey_v3-1.png', 'Lorem ipsum dolor sit amet, invenire rationibus mnesarchum no usu, ea quod vero mediocrem usu. Liber mucius dictas sed ei, ne has audire lobortis, pro ad sale nullam. Quod argumentum est ut, nulla nostro imperdiet vis ea. Te enim inani mediocritatem mea, ut sea assentior consectetuer signiferumque.Ex vel ubique fastidii reformidans, nam tale corrumpit quaerendum ad. Ei mea rebum commodo equidem, debitis albucius dignissim eu per. Justo harum sensibus id vel. Sea quando perpetua ea. Iusto homero insolens qui ad.Iuvaret invidunt suscipiantur ex his, eum id iusto fabulas persequeris, has no ignota mandamus. Vel evertitur gloriatur ad, quaeque alienum persequeris nec ad. Iriure singulis has ut. No aliquam consulatu mei, an vix dicat equidem facilisi. Primis dolorem cum no, ei mutat munere eos, aeterno appetere sit ea.Consul causae aeterno sit ex, ut mea tollit animal. Summo virtute deseruisse an sit, pro reque periculis temporibus ne. In recusabo mnesarchum instructior eam, duo nemore efficiantur in, magna offendit an vis. Nibh melius ceteros vim in. Tempor tacimates necessitatibus sit ne.Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex. Vivendum verterem ei sit, agam possim accumsan est ea. Nec latine eripuit suavitate te, quidam accusam an vim, per aeque salutandi eu.'),
(9, 'Lorem ipsum dolor sit amet', 'Sep-15-2018 17:52:59', 'Politics', 'Hassan', 'politics.jpg', '                                                                                                                Lorem ipsum dolor sit amet, invenire rationibus mnesarchum no usu, ea quod vero mediocrem usu. Liber mucius dictas sed ei, ne has audire lobortis, pro ad sale nullam. Quod argumentum est ut, nulla nostro imperdiet vis ea. Te enim inani mediocritatem mea, ut sea assentior consectetuer signiferumque.Ex vel ubique fastidii reformidans, nam tale corrumpit quaerendum ad. Ei mea rebum commodo equidem, debitis albucius dignissim eu per. Justo harum sensibus id vel. Sea quando perpetua ea. Iusto homero insolens qui ad.Iuvaret invidunt suscipiantur ex his, eum id iusto fabulas persequeris, has no ignota mandamus. Vel evertitur gloriatur ad, quaeque alienum persequeris nec ad. Iriure singulis has ut. No aliquam consulatu mei, an vix dicat equidem facilisi. Primis dolorem cum no, ei mutat munere eos, aeterno appetere sit ea.Consul causae aeterno sit ex, ut mea tollit animal. Summo virtute deseruisse an sit, pro reque periculis temporibus ne. In recusabo mnesarchum instructior eam, duo nemore efficiantur in, magna offendit an vis. Nibh melius ceteros vim in. Tempor tacimates necessitatibus sit ne.Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex. Vivendum verterem ei sit, agam possim accumsan est ea. Nec latine eripuit suavitate te, quidam accusam an vim, per aeque salutandi eu.                                                                                                '),
(10, 'Lorem ipsum dolor sit amet', 'Sep-15-2018 17:31:30', 'World', 'Hassan', '1014_15-expat-family-travel-hacks-large.jpg', 'Lorem ipsum dolor sit amet, invenire rationibus mnesarchum no usu, ea quod vero mediocrem usu. Liber mucius dictas sed ei, ne has audire lobortis, pro ad sale nullam. Quod argumentum est ut, nulla nostro imperdiet vis ea. Te enim inani mediocritatem mea, ut sea assentior consectetuer signiferumque.Ex vel ubique fastidii reformidans, nam tale corrumpit quaerendum ad. Ei mea rebum commodo equidem, debitis albucius dignissim eu per. Justo harum sensibus id vel. Sea quando perpetua ea. Iusto homero insolens qui ad.Iuvaret invidunt suscipiantur ex his, eum id iusto fabulas persequeris, has no ignota mandamus. Vel evertitur gloriatur ad, quaeque alienum persequeris nec ad. Iriure singulis has ut. No aliquam consulatu mei, an vix dicat equidem facilisi. Primis dolorem cum no, ei mutat munere eos, aeterno appetere sit ea.Consul causae aeterno sit ex, ut mea tollit animal. Summo virtute deseruisse an sit, pro reque periculis temporibus ne. In recusabo mnesarchum instructior eam, duo nemore efficiantur in, magna offendit an vis. Nibh melius ceteros vim in. Tempor tacimates necessitatibus sit ne.Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex. Vivendum verterem ei sit, agam possim accumsan est ea. Nec latine eripuit suavitate te, quidam accusam an vim, per aeque salutandi eu.'),
(11, 'Lorem ipsum dolor sit amet', 'Sep-15-2018 17:22:00', 'Technology', 'Hassan', 'datacenter_thumb_800x450_002.jpg', 'Lorem ipsum dolor sit amet, invenire rationibus mnesarchum no usu, ea quod vero mediocrem usu. Liber mucius dictas sed ei, ne has audire lobortis, pro ad sale nullam. Quod argumentum est ut, nulla nostro imperdiet vis ea. Te enim inani mediocritatem mea, ut sea assentior consectetuer signiferumque.Ex vel ubique fastidii reformidans, nam tale corrumpit quaerendum ad. Ei mea rebum commodo equidem, debitis albucius dignissim eu per. Justo harum sensibus id vel. Sea quando perpetua ea. Iusto homero insolens qui ad.Iuvaret invidunt suscipiantur ex his, eum id iusto fabulas persequeris, has no ignota mandamus. Vel evertitur gloriatur ad, quaeque alienum persequeris nec ad. Iriure singulis has ut. No aliquam consulatu mei, an vix dicat equidem facilisi. Primis dolorem cum no, ei mutat munere eos, aeterno appetere sit ea.Consul causae aeterno sit ex, ut mea tollit animal. Summo virtute deseruisse an sit, pro reque periculis temporibus ne. In recusabo mnesarchum instructior eam, duo nemore efficiantur in, magna offendit an vis. Nibh melius ceteros vim in. Tempor tacimates necessitatibus sit ne.Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex. Vivendum verterem ei sit, agam possim accumsan est ea. Nec latine eripuit suavitate te, quidam accusam an vim, per aeque salutandi eu.'),
(12, 'Lorem ipsum dolor sit amet', 'Sep-15-2018 17:23:38', 'Politics', 'Hassan', 'politics.jpg', 'Lorem ipsum dolor sit amet, invenire rationibus mnesarchum no usu, ea quod vero mediocrem usu. Liber mucius dictas sed ei, ne has audire lobortis, pro ad sale nullam. Quod argumentum est ut, nulla nostro imperdiet vis ea. Te enim inani mediocritatem mea, ut sea assentior consectetuer signiferumque.Ex vel ubique fastidii reformidans, nam tale corrumpit quaerendum ad. Ei mea rebum commodo equidem, debitis albucius dignissim eu per. Justo harum sensibus id vel. Sea quando perpetua ea. Iusto homero insolens qui ad.Iuvaret invidunt suscipiantur ex his, eum id iusto fabulas persequeris, has no ignota mandamus. Vel evertitur gloriatur ad, quaeque alienum persequeris nec ad. Iriure singulis has ut. No aliquam consulatu mei, an vix dicat equidem facilisi. Primis dolorem cum no, ei mutat munere eos, aeterno appetere sit ea.Consul causae aeterno sit ex, ut mea tollit animal. Summo virtute deseruisse an sit, pro reque periculis temporibus ne. In recusabo mnesarchum instructior eam, duo nemore efficiantur in, magna offendit an vis. Nibh melius ceteros vim in. Tempor tacimates necessitatibus sit ne.Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex. Vivendum verterem ei sit, agam possim accumsan est ea. Nec latine eripuit suavitate te, quidam accusam an vim, per aeque salutandi eu.'),
(13, 'Lorem ipsum dolor sit amet', 'Sep-15-2018 17:25:02', 'Health', 'Hassan', '1528307634-health-science-mandatory-subject-5.jpg', 'Lorem ipsum dolor sit amet, invenire rationibus mnesarchum no usu, ea quod vero mediocrem usu. Liber mucius dictas sed ei, ne has audire lobortis, pro ad sale nullam. Quod argumentum est ut, nulla nostro imperdiet vis ea. Te enim inani mediocritatem mea, ut sea assentior consectetuer signiferumque.Ex vel ubique fastidii reformidans, nam tale corrumpit quaerendum ad. Ei mea rebum commodo equidem, debitis albucius dignissim eu per. Justo harum sensibus id vel. Sea quando perpetua ea. Iusto homero insolens qui ad.Iuvaret invidunt suscipiantur ex his, eum id iusto fabulas persequeris, has no ignota mandamus. Vel evertitur gloriatur ad, quaeque alienum persequeris nec ad. Iriure singulis has ut. No aliquam consulatu mei, an vix dicat equidem facilisi. Primis dolorem cum no, ei mutat munere eos, aeterno appetere sit ea.Consul causae aeterno sit ex, ut mea tollit animal. Summo virtute deseruisse an sit, pro reque periculis temporibus ne. In recusabo mnesarchum instructior eam, duo nemore efficiantur in, magna offendit an vis. Nibh melius ceteros vim in. Tempor tacimates necessitatibus sit ne.Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex. Vivendum verterem ei sit, agam possim accumsan est ea. Nec latine eripuit suavitate te, quidam accusam an vim, per aeque salutandi eu.'),
(14, 'Lorem ipsum dolor sit amet', 'Sep-15-2018 17:27:18', 'Science', 'Hassan', 'science-onward-journey_v3-1.png', 'Lorem ipsum dolor sit amet, invenire rationibus mnesarchum no usu, ea quod vero mediocrem usu. Liber mucius dictas sed ei, ne has audire lobortis, pro ad sale nullam. Quod argumentum est ut, nulla nostro imperdiet vis ea. Te enim inani mediocritatem mea, ut sea assentior consectetuer signiferumque.Ex vel ubique fastidii reformidans, nam tale corrumpit quaerendum ad. Ei mea rebum commodo equidem, debitis albucius dignissim eu per. Justo harum sensibus id vel. Sea quando perpetua ea. Iusto homero insolens qui ad.Iuvaret invidunt suscipiantur ex his, eum id iusto fabulas persequeris, has no ignota mandamus. Vel evertitur gloriatur ad, quaeque alienum persequeris nec ad. Iriure singulis has ut. No aliquam consulatu mei, an vix dicat equidem facilisi. Primis dolorem cum no, ei mutat munere eos, aeterno appetere sit ea.Consul causae aeterno sit ex, ut mea tollit animal. Summo virtute deseruisse an sit, pro reque periculis temporibus ne. In recusabo mnesarchum instructior eam, duo nemore efficiantur in, magna offendit an vis. Nibh melius ceteros vim in. Tempor tacimates necessitatibus sit ne.Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex. Vivendum verterem ei sit, agam possim accumsan est ea. Nec latine eripuit suavitate te, quidam accusam an vim, per aeque salutandi eu.'),
(15, 'Lorem ipsum dolor sit amet', 'Sep-15-2018 17:31:30', 'World', 'Hassan', '1014_15-expat-family-travel-hacks-large.jpg', 'Lorem ipsum dolor sit amet, invenire rationibus mnesarchum no usu, ea quod vero mediocrem usu. Liber mucius dictas sed ei, ne has audire lobortis, pro ad sale nullam. Quod argumentum est ut, nulla nostro imperdiet vis ea. Te enim inani mediocritatem mea, ut sea assentior consectetuer signiferumque.Ex vel ubique fastidii reformidans, nam tale corrumpit quaerendum ad. Ei mea rebum commodo equidem, debitis albucius dignissim eu per. Justo harum sensibus id vel. Sea quando perpetua ea. Iusto homero insolens qui ad.Iuvaret invidunt suscipiantur ex his, eum id iusto fabulas persequeris, has no ignota mandamus. Vel evertitur gloriatur ad, quaeque alienum persequeris nec ad. Iriure singulis has ut. No aliquam consulatu mei, an vix dicat equidem facilisi. Primis dolorem cum no, ei mutat munere eos, aeterno appetere sit ea.Consul causae aeterno sit ex, ut mea tollit animal. Summo virtute deseruisse an sit, pro reque periculis temporibus ne. In recusabo mnesarchum instructior eam, duo nemore efficiantur in, magna offendit an vis. Nibh melius ceteros vim in. Tempor tacimates necessitatibus sit ne.Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex. Vivendum verterem ei sit, agam possim accumsan est ea. Nec latine eripuit suavitate te, quidam accusam an vim, per aeque salutandi eu.'),
(16, 'Lorem ipsum dolor sit amet', 'Sep-15-2018 17:25:02', 'Health', 'Hassan', '1528307634-health-science-mandatory-subject-5.jpg', 'Lorem ipsum dolor sit amet, invenire rationibus mnesarchum no usu, ea quod vero mediocrem usu. Liber mucius dictas sed ei, ne has audire lobortis, pro ad sale nullam. Quod argumentum est ut, nulla nostro imperdiet vis ea. Te enim inani mediocritatem mea, ut sea assentior consectetuer signiferumque.Ex vel ubique fastidii reformidans, nam tale corrumpit quaerendum ad. Ei mea rebum commodo equidem, debitis albucius dignissim eu per. Justo harum sensibus id vel. Sea quando perpetua ea. Iusto homero insolens qui ad.Iuvaret invidunt suscipiantur ex his, eum id iusto fabulas persequeris, has no ignota mandamus. Vel evertitur gloriatur ad, quaeque alienum persequeris nec ad. Iriure singulis has ut. No aliquam consulatu mei, an vix dicat equidem facilisi. Primis dolorem cum no, ei mutat munere eos, aeterno appetere sit ea.Consul causae aeterno sit ex, ut mea tollit animal. Summo virtute deseruisse an sit, pro reque periculis temporibus ne. In recusabo mnesarchum instructior eam, duo nemore efficiantur in, magna offendit an vis. Nibh melius ceteros vim in. Tempor tacimates necessitatibus sit ne.Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex. Vivendum verterem ei sit, agam possim accumsan est ea. Nec latine eripuit suavitate te, quidam accusam an vim, per aeque salutandi eu.'),
(17, 'Lorem ipsum dolor sit amet', 'Sep-15-2018 17:27:18', 'Science', 'Hassan', 'science-onward-journey_v3-1.png', 'Lorem ipsum dolor sit amet, invenire rationibus mnesarchum no usu, ea quod vero mediocrem usu. Liber mucius dictas sed ei, ne has audire lobortis, pro ad sale nullam. Quod argumentum est ut, nulla nostro imperdiet vis ea. Te enim inani mediocritatem mea, ut sea assentior consectetuer signiferumque.Ex vel ubique fastidii reformidans, nam tale corrumpit quaerendum ad. Ei mea rebum commodo equidem, debitis albucius dignissim eu per. Justo harum sensibus id vel. Sea quando perpetua ea. Iusto homero insolens qui ad.Iuvaret invidunt suscipiantur ex his, eum id iusto fabulas persequeris, has no ignota mandamus. Vel evertitur gloriatur ad, quaeque alienum persequeris nec ad. Iriure singulis has ut. No aliquam consulatu mei, an vix dicat equidem facilisi. Primis dolorem cum no, ei mutat munere eos, aeterno appetere sit ea.Consul causae aeterno sit ex, ut mea tollit animal. Summo virtute deseruisse an sit, pro reque periculis temporibus ne. In recusabo mnesarchum instructior eam, duo nemore efficiantur in, magna offendit an vis. Nibh melius ceteros vim in. Tempor tacimates necessitatibus sit ne.Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex. Vivendum verterem ei sit, agam possim accumsan est ea. Nec latine eripuit suavitate te, quidam accusam an vim, per aeque salutandi eu.'),
(18, 'Lorem ipsum dolor sit amet', 'Sep-15-2018 17:31:30', 'World', 'Hassan', '1014_15-expat-family-travel-hacks-large.jpg', 'Lorem ipsum dolor sit amet, invenire rationibus mnesarchum no usu, ea quod vero mediocrem usu. Liber mucius dictas sed ei, ne has audire lobortis, pro ad sale nullam. Quod argumentum est ut, nulla nostro imperdiet vis ea. Te enim inani mediocritatem mea, ut sea assentior consectetuer signiferumque.Ex vel ubique fastidii reformidans, nam tale corrumpit quaerendum ad. Ei mea rebum commodo equidem, debitis albucius dignissim eu per. Justo harum sensibus id vel. Sea quando perpetua ea. Iusto homero insolens qui ad.Iuvaret invidunt suscipiantur ex his, eum id iusto fabulas persequeris, has no ignota mandamus. Vel evertitur gloriatur ad, quaeque alienum persequeris nec ad. Iriure singulis has ut. No aliquam consulatu mei, an vix dicat equidem facilisi. Primis dolorem cum no, ei mutat munere eos, aeterno appetere sit ea.Consul causae aeterno sit ex, ut mea tollit animal. Summo virtute deseruisse an sit, pro reque periculis temporibus ne. In recusabo mnesarchum instructior eam, duo nemore efficiantur in, magna offendit an vis. Nibh melius ceteros vim in. Tempor tacimates necessitatibus sit ne.Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex. Vivendum verterem ei sit, agam possim accumsan est ea. Nec latine eripuit suavitate te, quidam accusam an vim, per aeque salutandi eu.'),
(19, 'Lorem ipsum dolor sit amet', 'Sep-15-2018 17:23:38', 'Politics', 'Hassan', 'politics.jpg', 'Lorem ipsum dolor sit amet, invenire rationibus mnesarchum no usu, ea quod vero mediocrem usu. Liber mucius dictas sed ei, ne has audire lobortis, pro ad sale nullam. Quod argumentum est ut, nulla nostro imperdiet vis ea. Te enim inani mediocritatem mea, ut sea assentior consectetuer signiferumque.Ex vel ubique fastidii reformidans, nam tale corrumpit quaerendum ad. Ei mea rebum commodo equidem, debitis albucius dignissim eu per. Justo harum sensibus id vel. Sea quando perpetua ea. Iusto homero insolens qui ad.Iuvaret invidunt suscipiantur ex his, eum id iusto fabulas persequeris, has no ignota mandamus. Vel evertitur gloriatur ad, quaeque alienum persequeris nec ad. Iriure singulis has ut. No aliquam consulatu mei, an vix dicat equidem facilisi. Primis dolorem cum no, ei mutat munere eos, aeterno appetere sit ea.Consul causae aeterno sit ex, ut mea tollit animal. Summo virtute deseruisse an sit, pro reque periculis temporibus ne. In recusabo mnesarchum instructior eam, duo nemore efficiantur in, magna offendit an vis. Nibh melius ceteros vim in. Tempor tacimates necessitatibus sit ne.Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex. Vivendum verterem ei sit, agam possim accumsan est ea. Nec latine eripuit suavitate te, quidam accusam an vim, per aeque salutandi eu.'),
(20, 'Lorem ipsum dolor sit amet', 'Sep-15-2018 17:27:18', 'Science', 'Hassan', 'science-onward-journey_v3-1.png', 'Lorem ipsum dolor sit amet, invenire rationibus mnesarchum no usu, ea quod vero mediocrem usu. Liber mucius dictas sed ei, ne has audire lobortis, pro ad sale nullam. Quod argumentum est ut, nulla nostro imperdiet vis ea. Te enim inani mediocritatem mea, ut sea assentior consectetuer signiferumque.Ex vel ubique fastidii reformidans, nam tale corrumpit quaerendum ad. Ei mea rebum commodo equidem, debitis albucius dignissim eu per. Justo harum sensibus id vel. Sea quando perpetua ea. Iusto homero insolens qui ad.Iuvaret invidunt suscipiantur ex his, eum id iusto fabulas persequeris, has no ignota mandamus. Vel evertitur gloriatur ad, quaeque alienum persequeris nec ad. Iriure singulis has ut. No aliquam consulatu mei, an vix dicat equidem facilisi. Primis dolorem cum no, ei mutat munere eos, aeterno appetere sit ea.Consul causae aeterno sit ex, ut mea tollit animal. Summo virtute deseruisse an sit, pro reque periculis temporibus ne. In recusabo mnesarchum instructior eam, duo nemore efficiantur in, magna offendit an vis. Nibh melius ceteros vim in. Tempor tacimates necessitatibus sit ne.Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex. Vivendum verterem ei sit, agam possim accumsan est ea. Nec latine eripuit suavitate te, quidam accusam an vim, per aeque salutandi eu.'),
(21, 'Lorem ipsum dolor sit amet', 'Sep-15-2018 17:22:00', 'Technology', 'Hassan', 'datacenter_thumb_800x450_002.jpg', 'Lorem ipsum dolor sit amet, invenire rationibus mnesarchum no usu, ea quod vero mediocrem usu. Liber mucius dictas sed ei, ne has audire lobortis, pro ad sale nullam. Quod argumentum est ut, nulla nostro imperdiet vis ea. Te enim inani mediocritatem mea, ut sea assentior consectetuer signiferumque.Ex vel ubique fastidii reformidans, nam tale corrumpit quaerendum ad. Ei mea rebum commodo equidem, debitis albucius dignissim eu per. Justo harum sensibus id vel. Sea quando perpetua ea. Iusto homero insolens qui ad.Iuvaret invidunt suscipiantur ex his, eum id iusto fabulas persequeris, has no ignota mandamus. Vel evertitur gloriatur ad, quaeque alienum persequeris nec ad. Iriure singulis has ut. No aliquam consulatu mei, an vix dicat equidem facilisi. Primis dolorem cum no, ei mutat munere eos, aeterno appetere sit ea.Consul causae aeterno sit ex, ut mea tollit animal. Summo virtute deseruisse an sit, pro reque periculis temporibus ne. In recusabo mnesarchum instructior eam, duo nemore efficiantur in, magna offendit an vis. Nibh melius ceteros vim in. Tempor tacimates necessitatibus sit ne.Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex. Vivendum verterem ei sit, agam possim accumsan est ea. Nec latine eripuit suavitate te, quidam accusam an vim, per aeque salutandi eu.'),
(22, 'Lorem ipsum dolor sit amet', 'Sep-15-2018 17:22:24', 'Technology', 'Hassan', 'datacenter_thumb_800x450_002.jpg', 'Lorem ipsum dolor sit amet, invenire rationibus mnesarchum no usu, ea quod vero mediocrem usu. Liber mucius dictas sed ei, ne has audire lobortis, pro ad sale nullam. Quod argumentum est ut, nulla nostro imperdiet vis ea. Te enim inani mediocritatem mea, ut sea assentior consectetuer signiferumque.Ex vel ubique fastidii reformidans, nam tale corrumpit quaerendum ad. Ei mea rebum commodo equidem, debitis albucius dignissim eu per. Justo harum sensibus id vel. Sea quando perpetua ea. Iusto homero insolens qui ad.Iuvaret invidunt suscipiantur ex his, eum id iusto fabulas persequeris, has no ignota mandamus. Vel evertitur gloriatur ad, quaeque alienum persequeris nec ad. Iriure singulis has ut. No aliquam consulatu mei, an vix dicat equidem facilisi. Primis dolorem cum no, ei mutat munere eos, aeterno appetere sit ea.Consul causae aeterno sit ex, ut mea tollit animal. Summo virtute deseruisse an sit, pro reque periculis temporibus ne. In recusabo mnesarchum instructior eam, duo nemore efficiantur in, magna offendit an vis. Nibh melius ceteros vim in. Tempor tacimates necessitatibus sit ne.Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex. Vivendum verterem ei sit, agam possim accumsan est ea. Nec latine eripuit suavitate te, quidam accusam an vim, per aeque salutandi eu.'),
(23, 'Lorem ipsum dolor sit amet', 'Sep-15-2018 17:24:14', 'Business', 'Hassan', 'goals-for-your-business_512861902.jpg', 'Lorem ipsum dolor sit amet, invenire rationibus mnesarchum no usu, ea quod vero mediocrem usu. Liber mucius dictas sed ei, ne has audire lobortis, pro ad sale nullam. Quod argumentum est ut, nulla nostro imperdiet vis ea. Te enim inani mediocritatem mea, ut sea assentior consectetuer signiferumque.Ex vel ubique fastidii reformidans, nam tale corrumpit quaerendum ad. Ei mea rebum commodo equidem, debitis albucius dignissim eu per. Justo harum sensibus id vel. Sea quando perpetua ea. Iusto homero insolens qui ad.Iuvaret invidunt suscipiantur ex his, eum id iusto fabulas persequeris, has no ignota mandamus. Vel evertitur gloriatur ad, quaeque alienum persequeris nec ad. Iriure singulis has ut. No aliquam consulatu mei, an vix dicat equidem facilisi. Primis dolorem cum no, ei mutat munere eos, aeterno appetere sit ea.Consul causae aeterno sit ex, ut mea tollit animal. Summo virtute deseruisse an sit, pro reque periculis temporibus ne. In recusabo mnesarchum instructior eam, duo nemore efficiantur in, magna offendit an vis. Nibh melius ceteros vim in. Tempor tacimates necessitatibus sit ne.Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex. Vivendum verterem ei sit, agam possim accumsan est ea. Nec latine eripuit suavitate te, quidam accusam an vim, per aeque salutandi eu.'),
(24, 'Lorem ipsum dolor sit amet', 'Sep-15-2018 17:25:16', 'Sport', 'Hassan', 'bigstock-Four-Sports-a-lot-of-balls-an-50626115.jpg', 'Lorem ipsum dolor sit amet, invenire rationibus mnesarchum no usu, ea quod vero mediocrem usu. Liber mucius dictas sed ei, ne has audire lobortis, pro ad sale nullam. Quod argumentum est ut, nulla nostro imperdiet vis ea. Te enim inani mediocritatem mea, ut sea assentior consectetuer signiferumque.Ex vel ubique fastidii reformidans, nam tale corrumpit quaerendum ad. Ei mea rebum commodo equidem, debitis albucius dignissim eu per. Justo harum sensibus id vel. Sea quando perpetua ea. Iusto homero insolens qui ad.Iuvaret invidunt suscipiantur ex his, eum id iusto fabulas persequeris, has no ignota mandamus. Vel evertitur gloriatur ad, quaeque alienum persequeris nec ad. Iriure singulis has ut. No aliquam consulatu mei, an vix dicat equidem facilisi. Primis dolorem cum no, ei mutat munere eos, aeterno appetere sit ea.Consul causae aeterno sit ex, ut mea tollit animal. Summo virtute deseruisse an sit, pro reque periculis temporibus ne. In recusabo mnesarchum instructior eam, duo nemore efficiantur in, magna offendit an vis. Nibh melius ceteros vim in. Tempor tacimates necessitatibus sit ne.Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex. Vivendum verterem ei sit, agam possim accumsan est ea. Nec latine eripuit suavitate te, quidam accusam an vim, per aeque salutandi eu.'),
(25, 'Lorem ipsum dolor sit amet', 'Sep-15-2018 17:52:59', 'Politics', 'Hassan', 'politics.jpg', '                                                                                                                Lorem ipsum dolor sit amet, invenire rationibus mnesarchum no usu, ea quod vero mediocrem usu. Liber mucius dictas sed ei, ne has audire lobortis, pro ad sale nullam. Quod argumentum est ut, nulla nostro imperdiet vis ea. Te enim inani mediocritatem mea, ut sea assentior consectetuer signiferumque.Ex vel ubique fastidii reformidans, nam tale corrumpit quaerendum ad. Ei mea rebum commodo equidem, debitis albucius dignissim eu per. Justo harum sensibus id vel. Sea quando perpetua ea. Iusto homero insolens qui ad.Iuvaret invidunt suscipiantur ex his, eum id iusto fabulas persequeris, has no ignota mandamus. Vel evertitur gloriatur ad, quaeque alienum persequeris nec ad. Iriure singulis has ut. No aliquam consulatu mei, an vix dicat equidem facilisi. Primis dolorem cum no, ei mutat munere eos, aeterno appetere sit ea.Consul causae aeterno sit ex, ut mea tollit animal. Summo virtute deseruisse an sit, pro reque periculis temporibus ne. In recusabo mnesarchum instructior eam, duo nemore efficiantur in, magna offendit an vis. Nibh melius ceteros vim in. Tempor tacimates necessitatibus sit ne.Ne errem officiis duo. Usu virtute atomorum ad, viris veniam tamquam eos ex. Vivendum verterem ei sit, agam possim accumsan est ea. Nec latine eripuit suavitate te, quidam accusam an vim, per aeque salutandi eu.                                                                                                ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postID` (`postID`),
  ADD KEY `postID_2` (`postID`),
  ADD KEY `status` (`status`),
  ADD KEY `postID_3` (`postID`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`postID`) REFERENCES `posts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

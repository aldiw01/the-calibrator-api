-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2020 at 08:31 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 5.6.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `telkom_calibrator`
--

-- --------------------------------------------------------

--
-- Table structure for table `cal_certificates`
--

CREATE TABLE `cal_certificates` (
  `id` varchar(24) NOT NULL,
  `device_id` varchar(11) NOT NULL,
  `calibration_date` varchar(24) NOT NULL,
  `due_date` varchar(24) NOT NULL,
  `test_engineer_id` varchar(11) NOT NULL,
  `certificate_file` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cal_certificates`
--

INSERT INTO `cal_certificates` (`id`, `device_id`, `calibration_date`, `due_date`, `test_engineer_id`, `certificate_file`) VALUES
('001-KAL-19', '137/CAL', '2019-09-24', '2021-09-24', '970037', 'test.pdf'),
('001-KAL-20', '006/CAL', '2020-02-03', '2021-02-03', '970037', 'certificate_file_1580665068554_DKI Jakarta.pdf'),
('002-KAL-19', '194/CAL', '2019-09-25', '2021-09-25', '970037', 'test.pdf'),
('003-KAL-19', '103/CAL', '2019-09-26', '2021-09-26', '970037', 'test.pdf'),
('004-KAL-19', '101/CAL', '2019-09-27', '2021-09-27', '970037', 'test.pdf'),
('005-KAL-19', '100/CAL', '2019-09-28', '2021-09-28', '970037', 'test.pdf'),
('006-KAL-19', '097/CAL', '2019-09-29', '2021-09-29', '970037', 'test.pdf'),
('007-KAL-19', '096/CAL', '2019-09-30', '2021-09-30', '970037', 'test.pdf'),
('008-KAL-19', '091/CAL', '2019-10-03', '2021-10-03', '970037', 'test.pdf'),
('009-KAL-19', '136/TRA', '2019-10-01', '2021-10-01', '970037', 'test.pdf'),
('011-KAL-19', '095/CAL', '2019-10-04', '2021-10-04', '970037', 'test.pdf'),
('048-KAL-19', '086/CAL', '2019-11-10', '2021-11-10', '970037', 'test.pdf'),
('049-KAL-19', '129/CAL', '2019-11-11', '2021-11-11', '970037', 'test.pdf'),
('050-KAL-19', '130/CAL', '2019-11-12', '2021-11-12', '970037', 'test.pdf'),
('051-KAL-19', '109/CAL', '2019-11-13', '2021-11-13', '970037', 'test.pdf'),
('052-KAL-19', '121/CAL', '2019-11-14', '2021-11-14', '970037', 'test.pdf'),
('053-KAL-19', '119/CAL', '2019-11-15', '2021-11-15', '970037', 'test.pdf'),
('054-KAL-19', '037/CAL', '2019-11-16', '2021-11-16', '970037', 'test.pdf'),
('055-KAL-19', '099/ENE', '2019-11-17', '2021-11-17', '970037', 'test.pdf'),
('056-KAL-19', '018/ENE', '2019-11-18', '2021-11-18', '970037', 'test.pdf'),
('057-KAL-19', '180/CAL', '2019-11-19', '2021-11-19', '970037', 'test.pdf'),
('058-KAL-19', '006/CAL', '2019-11-20', '2021-11-20', '970037', 'test.pdf'),
('059-KAL-19', '133/CAL', '2019-11-21', '2021-11-21', '970037', 'test.pdf'),
('060-KAL-19', '062/CAB', '2019-11-22', '2021-11-22', '970037', 'test.pdf'),
('061-KAL-19', '092/CAB', '2019-11-23', '2021-11-23', '970037', 'test.pdf'),
('062-KAL-19', '093/CAB', '2019-11-24', '2021-11-24', '970037', 'test.pdf'),
('063-KAL-19', '069/CAB', '2019-11-25', '2021-11-25', '970037', 'test.pdf'),
('064-KAL-19', '023/CAB', '2019-11-26', '2021-11-26', '970037', 'test.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `cal_requests`
--

CREATE TABLE `cal_requests` (
  `id` varchar(11) NOT NULL,
  `test_engineer_id` varchar(11) NOT NULL,
  `requestor_id` varchar(11) NOT NULL,
  `device_id` varchar(11) NOT NULL,
  `cal_step_id` varchar(11) NOT NULL,
  `cal_certificate_id` varchar(24) NOT NULL,
  `created` varchar(24) NOT NULL,
  `updated` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cal_results`
--

CREATE TABLE `cal_results` (
  `id` varchar(11) NOT NULL,
  `device_id` varchar(11) NOT NULL,
  `test_item_id` varchar(11) NOT NULL,
  `cal_certificate_id` varchar(24) NOT NULL,
  `raw_data_id` varchar(11) NOT NULL,
  `range` double DEFAULT NULL,
  `input_frequency` double DEFAULT NULL,
  `input_value` double NOT NULL,
  `specification` double NOT NULL,
  `indicated_value` double NOT NULL,
  `correction` double NOT NULL,
  `uncertainty` double NOT NULL,
  `measure_unit` text NOT NULL,
  `is_out_spec` int(11) NOT NULL,
  `is_accredited` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cal_specifications`
--

CREATE TABLE `cal_specifications` (
  `id` varchar(11) NOT NULL,
  `device_id` varchar(11) NOT NULL,
  `test_item_id` varchar(11) NOT NULL,
  `ppm_output` double NOT NULL,
  `floor` double NOT NULL,
  `resolution` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cal_steps`
--

CREATE TABLE `cal_steps` (
  `id` varchar(11) NOT NULL,
  `step_name` text NOT NULL,
  `step_number` int(5) NOT NULL,
  `created` varchar(24) NOT NULL,
  `updated` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` varchar(11) NOT NULL,
  `name` text NOT NULL,
  `manufacturer` text NOT NULL,
  `model` text NOT NULL,
  `serial_number` text NOT NULL,
  `defect_status` int(11) NOT NULL,
  `calibration_date` varchar(24) NOT NULL,
  `due_date` varchar(24) NOT NULL,
  `calibration_period` int(5) NOT NULL,
  `supervisor` varchar(64) NOT NULL,
  `issue_date` varchar(24) NOT NULL,
  `test_interval` int(5) NOT NULL,
  `calibration_method` varchar(10) NOT NULL,
  `manual_file` text,
  `spec_file` text,
  `documentation` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `name`, `manufacturer`, `model`, `serial_number`, `defect_status`, `calibration_date`, `due_date`, `calibration_period`, `supervisor`, `issue_date`, `test_interval`, `calibration_method`, `manual_file`, `spec_file`, `documentation`) VALUES
('001/CAB', 'TENSILE MACHINE', 'AUTOGRAPH', 'AG5000 E', '30096828', 0, '2018-07-31', '2019-07-31', 1, 'KUATIN, IRFAN, WILDA', '2000-01-01', 6, 'EXTERNAL', '', '', 'test.jpg'),
('001/CAL', 'TES UNIT', 'F & G', 'PM-2', '200759', 0, '2019-09-10', '2020-09-10', 1, 'SENTOT HERY', '2000-01-01', 6, 'INTERNAL', '', '', 'test.jpg'),
('002/CAL', 'POWER METER', 'HP', '436 A', '2347A16880', 1, '2013-04-05', '2014-04-05', 1, 'SENTOT HERY', '2000-01-02', 6, 'INTERNAL', '', '', 'test.jpg'),
('003/CAB', 'HIGH RESISTANCE METER', 'HP', '4329A', '1836 J 04161', 0, '2020-01-23', '2022-01-23', 2, 'KUATIN, IRFAN, WILDA', '2000-01-02', 6, 'INTERNAL', '', '', 'test.jpg'),
('003/CAL', 'POWER METER', 'HP', '436 A', '2236A12973', 0, '2019-01-29', '2020-01-29', 1, 'SENTOT HERY', '2000-01-03', 6, 'INTERNAL', '', '', 'test.jpg'),
('004/CAB', 'ECHO METER', 'KARL DEUTSH', '1070', '22307', 0, '2018-08-21', '2021-08-21', 3, 'KUATIN, IRFAN, WILDA', '2000-01-03', 6, 'EXTERNAL', '', '', 'test.jpg'),
('006/CAL', 'RANGE CALIBRATOR', 'HP', '11683 A', '2236A02035', 0, '2019-07-12', '2021-07-12', 2, 'SENTOT HERY', '2000-01-04', 6, 'INTERNAL', 'manual_file_006-CAL_1582255924176', 'spec_file_1582255775780_01 US7804764.pdf', 'test.jpg'),
('008/CAB', 'OSCILLATOR', 'ANDO', 'WBG-9', '50069', 0, '2019-10-25', '2021-10-25', 2, 'KUATIN, IRFAN, WILDA', '2000-01-04', 6, 'INTERNAL', '', '', 'test.jpg'),
('009/CAL', 'COUNTER / POWER METER (500 MHz - 20 GHz)', 'HP', '5347 A', '3009A00995', 0, '2018-01-25', '2020-01-25', 2, 'SENTOT HERY', '2000-01-05', 6, 'INTERNAL', '', '', 'test.jpg'),
('010/CAL', 'SYNTHESIZER / LEVEL GEN.', 'HP', '3335 A', '1640A01067', 1, '2013-04-05', '2014-04-05', 1, 'SENTOT HERY', '2000-01-06', 6, 'INTERNAL', '', '', 'test.jpg'),
('011/CAL', 'SYNTHESIZER / LEVEL GEN.', 'HP', '3335 A', '1640A02114', 0, '2018-08-06', '2020-08-06', 2, 'SENTOT HERY', '2000-01-07', 6, 'INTERNAL', '', '', 'test.jpg'),
('012/CAB', 'AC AMPERE METER', 'HB BRASIL', 'HB', '6', 0, '2015-10-09', '2017-10-09', 2, 'KUATIN, IRFAN, WILDA', '2000-01-05', 6, 'INTERNAL', '', '', 'test.jpg'),
('013/CAL', 'DECADE RESISTANCE BOX', 'YOKOGAWA', '279301', '54FT0301', 0, '2018-09-18', '2020-09-18', 2, 'SENTOT HERY', '2000-01-08', 6, 'INTERNAL', '', '', 'test.jpg'),
('014/CAB', 'SURGE VOLTAGE TESTER', 'HAEFELY', 'P6T', 'P6T-080723-20-8', 0, '2018-01-16', '2020-01-16', 2, 'KUATIN, IRFAN, WILDA', '2000-01-06', 6, 'INTERNAL', '', '', 'test.jpg'),
('015/CAB', 'ALAT TEMBUS (CONE PENETRATION TEST)', 'STANHOPE SET', 'KI10', '1710', 0, '2018-08-20', '2019-08-20', 1, 'KUATIN, IRFAN, WILDA', '2000-01-07', 6, 'EXTERNAL', '', '', 'test.jpg'),
('016/CAB', 'DC DIELECTRIC TEST SET ', 'BIDDLE', '220070', '16107', 0, '2019-08-22', '2020-08-22', 1, 'KUATIN, IRFAN, WILDA', '2000-01-08', 6, 'INTERNAL', '', '', 'test.jpg'),
('018/CAB', 'VISCOSITY METER', 'BROOKFIELD', 'RVF', '80119', 0, '2008-09-19', '2011-09-19', 3, 'KUATIN, IRFAN, WILDA', '2000-01-09', 6, 'EXTERNAL', '', '', 'test.jpg'),
('020/CAB', 'CARBON CONTENT BLACK TESTER', 'IZUSU SEISAKUSHO', '-', '3025/280', 0, '2019-04-25', '2021-04-25', 2, 'KUATIN, IRFAN, WILDA', '2000-01-10', 6, 'EXTERNAL', '', '', 'test.jpg'),
('021/CAB', 'PROFILE  PROJECTOR', 'MITUTOYO', 'PJ – 300', '440177', 0, '2018-07-31', '2019-07-31', 1, 'KUATIN, IRFAN, WILDA', '2000-01-11', 6, 'EXTERNAL', '', '', 'test.jpg'),
('022/CAB', 'RCKE MEASURING SYSTEM', 'AESA', '9440', '3706', 1, '2010-10-11', '2012-10-11', 2, 'KUATIN, IRFAN, WILDA', '2000-01-12', 6, 'INTERNAL', '', '', 'test.jpg'),
('023/CAB', 'SET OF 5 STANDARD AESA', 'AESA', '9001', '4007', 0, '2019-08-23', '2022-08-23', 3, 'KUATIN, IRFAN, WILDA', '2000-01-13', 6, 'INTERNAL', '', '', 'test.jpg'),
('023/CAL', 'ATTENUATOR 600 OHM', 'HP', '4437 A', '1250J01182', 0, '2018-09-18', '2020-09-18', 2, 'SENTOT HERY', '2000-01-09', 6, 'INTERNAL', '', '', 'test.jpg'),
('025/CAB', 'METERAN  20  METER', 'SILVER CUSTOM', '20 M', '025/CAB', 0, '2002-05-14', 'Initial', 0, 'KUATIN, IRFAN, WILDA', '2000-01-14', 6, 'EXTERNAL', '', '', 'test.jpg'),
('026/CAB', 'MISTAR 1 METER  (STELL RULE)', 'KDS-10 ME', '1 M', '026/CAB', 0, '2001-05-28', 'Initial', 0, 'KUATIN, IRFAN, WILDA', '2000-01-15', 6, 'EXTERNAL', '', '', 'test.jpg'),
('026/CAL', 'STANDARD AIR CAPACITOR', 'HP', '16380 C', '2519J00513', 0, '2019-07-05', '2021-07-05', 2, 'SENTOT HERY', '2000-01-10', 6, 'INTERNAL', '', '', 'test.jpg'),
('027/CAB', 'TIMBANGAN ELEKTRONIK  PAN TUNGGAL', 'SATORIUS', 'BP210 S', '50808685', 1, '2013-11-27', '2015-11-27', 2, 'KUATIN, IRFAN, WILDA', '2000-01-16', 6, 'EXTERNAL', '', '', 'test.jpg'),
('027/CAL', 'STANDARD AIR CAPACITOR', 'HP', '16380 A', '-', 0, '2019-11-20', '2021-11-20', 2, 'SENTOT HERY', '2000-01-11', 6, 'INTERNAL', '', '', 'test.jpg'),
('031/CAB', 'INSULATING & ARRESTER TESTER', 'OBO BETTERMAN', 'ISOLAB', 'VB6 (031/CAB)', 0, '2014-09-18', '2019-09-18', 5, 'KUATIN, IRFAN, WILDA', '2000-01-17', 6, 'INTERNAL', '', '', 'test.jpg'),
('033/CAB', 'OVEN', 'WTB BINDER', '1.51E+13', '940062', 1, '2012-06-18', '2013-06-18', 1, 'KUATIN, IRFAN, WILDA', '2000-01-18', 6, 'EXTERNAL', '', '', 'test.jpg'),
('034/CAL', 'DIRECTIONAL COUPLER', 'HP', '11691 D', '1212A02334', 0, '2019-04-23', '2021-04-23', 2, 'SENTOT HERY', '2000-01-12', 6, 'INTERNAL', '', '', 'test.jpg'),
('035/CAB', 'VERNIER CALIPER (0-300 mm)', 'MITUTOYO', '0-300 mm', '035/CAB', 0, '2009-07-17', '2012-07-17', 3, 'KUATIN, IRFAN, WILDA', '2000-01-19', 6, 'EXTERNAL', '', '', 'test.jpg'),
('036/CAB', 'DIGIMATIC CALIPER', 'MITUTOYO', '573-142-10', '333', 0, '2018-04-10', '2020-04-10', 2, 'KUATIN, IRFAN, WILDA', '2000-01-20', 6, 'EXTERNAL', '', '', 'test.jpg'),
('037/CAB', 'CLIMATIC CHAMBER ( OVEN )', 'HERAEUS VOTSCH', 'HC-4030', '43468', 0, '2016-10-07', '2019-10-07', 3, 'KUATIN, IRFAN, WILDA', '2000-01-21', 6, 'EXTERNAL', '', '', 'test.jpg'),
('037/CAL', 'AC/DC CURRENT PROBE', 'FLUKE', 'Y 8100', '2672160', 0, '2019-07-12', '2022-07-12', 3, 'SENTOT HERY', '2000-01-13', 6, 'INTERNAL', '', '', 'test.jpg'),
('038/CAB', 'DIGIMATIC CALIPER', 'MITUTOYO', '500-151', '59319', 1, '2015-02-23', '2016-02-23', 1, 'KUATIN, IRFAN, WILDA', '2000-01-22', 6, 'EXTERNAL', '', '', 'test.jpg'),
('038/CAL', 'AUDIO ANALYZER', 'HP', '8903 B', '2818A04574', 0, '2017-10-13', '2019-10-13', 2, 'SENTOT HERY', '2000-01-14', 6, 'INTERNAL', '', '', 'test.jpg'),
('039/CAB', 'DIGIMATIC MICROMETER', 'MITUTOYO', '331-511-30', '6035629', 0, '2016-02-17', '2019-02-17', 3, 'KUATIN, IRFAN, WILDA', '2000-01-23', 6, 'EXTERNAL', '', '', 'test.jpg'),
('040/CAB', 'DIGIMATIC MICROMETER', 'MITUTOYO', '395-541-30', '5176337', 1, '2011-12-19', '2012-12-19', 1, 'KUATIN, IRFAN, WILDA', '2000-01-24', 6, 'EXTERNAL', '', '', 'test.jpg'),
('041/CAB', 'DIAL THICKNESS', 'MITUTOYO', '7313', '445F51', 0, '2015-03-09', '2020-03-09', 5, 'KUATIN, IRFAN, WILDA', '2000-01-25', 6, 'EXTERNAL', '', '', 'test.jpg'),
('042/CAB', 'TERMO HIGROMETER', 'PALMA', 'SATO', '107662', 0, '2018-03-15', '2020-03-15', 2, 'KUATIN, IRFAN, WILDA', '2000-01-26', 6, 'EXTERNAL', '', '', 'test.jpg'),
('043/CAB', 'ELECTRONIC BALANCE', 'SATORIUS', 'AC 211S / 210g', '50710490', 0, '2018-07-31', '2020-07-31', 2, 'KUATIN, IRFAN, WILDA', '2000-01-27', 6, 'EXTERNAL', '', '', 'test.jpg'),
('043/CAL', 'DECADE CAPACITOR', 'HP', '4440 B', '1224J04572', 0, '2019-04-23', '2021-04-23', 2, 'SENTOT HERY', '2000-01-15', 6, 'INTERNAL', '', '', 'test.jpg'),
('044/CAB', 'DIAL THICKNESS GAUGE', 'MITUTOYO', '7305', '54F928', 0, '2018-04-09', '2020-04-09', 2, 'KUATIN, IRFAN, WILDA', '2000-01-28', 6, 'EXTERNAL', '', '', 'test.jpg'),
('044/CAL', 'LEVEL METER', 'ANRITSU', 'ML424B', 'M57339', 0, '2017-10-13', '2019-10-13', 2, 'SENTOT HERY', '2000-01-16', 6, 'INTERNAL', '', '', 'test.jpg'),
('045/CAB', 'DIAL CALIPER GAUGE', 'MITUTOYO', '209-105', '045/CAB', 0, '2018-04-09', '2020-04-09', 2, 'KUATIN, IRFAN, WILDA', '2000-01-29', 6, 'EXTERNAL', '', '', 'test.jpg'),
('045/CAL', 'DECADE RESISTANCE BOX', 'YOKOGAWA', '2793 - 03', '26FT1066', 0, '2017-10-25', '2019-10-25', 2, 'SENTOT HERY', '2000-01-17', 6, 'INTERNAL', '', '', 'test.jpg'),
('046/CAB', 'DIAL CALIPER GAUGE', 'MITUTOYO', '209-103', '046/CAB', 0, '2018-04-09', '2020-04-09', 2, 'KUATIN, IRFAN, WILDA', '2000-01-30', 6, 'EXTERNAL', '', '', 'test.jpg'),
('047/CAB', 'TERMO HIGROMETER', 'HISAMATSU', 'TN-2500', '4097', 1, '2015-12-04', '2017-12-04', 2, 'KUATIN, IRFAN, WILDA', '2000-01-31', 6, 'EXTERNAL', '', '', 'test.jpg'),
('048/CAL', 'DC REFFERENCE STANDARD', 'FLUKE', '731 B', '2575007', 0, '2019-04-23', '2021-04-23', 2, 'SENTOT HERY', '2000-01-18', 6, 'INTERNAL', '', '', 'test.jpg'),
('051/CAB', 'INSULATION TESTER', 'MEGGER', 'BM-11', '50610140893', 1, '2016-03-21', '2018-03-21', 2, 'KUATIN, IRFAN, WILDA', '2000-02-01', 6, 'INTERNAL', '', '', 'test.jpg'),
('053/CAB', 'INSULATION TESTER', 'MEGGER', 'BM-11', '6.7501E+11', 1, '2009-06-05', '2010-06-05', 1, 'KUATIN, IRFAN, WILDA', '2000-02-02', 6, 'INTERNAL', '', '', 'test.jpg'),
('054/CAB', 'TIMBANGAN GANTUNG 200 KG', 'CASTON', 'NC-200', '96100012', 0, '2019-04-25', '2022-04-25', 3, 'KUATIN, IRFAN, WILDA', '2000-02-03', 6, 'EXTERNAL', '', '', 'test.jpg'),
('056/CAB', 'PRESSURE GAUGE 2,5 KG/CM2', 'EMPERO-', '0 to 2.5 KG/CM2', '056/CAB', 0, '2018-03-23', '2021-03-23', 3, 'KUATIN, IRFAN, WILDA', '2000-02-04', 6, 'EXTERNAL', '', '', 'test.jpg'),
('057/CAB', 'PRESSURE GAUGE 350 ', 'REG KOIKE COLT', '0 to 350 PSI', '057/CAB', 0, '2018-03-20', '2021-03-20', 3, 'KUATIN, IRFAN, WILDA', '2000-02-05', 6, 'EXTERNAL', '', '', 'test.jpg'),
('058/CAB', 'PRESSURE GAUGE 3500 PSI', 'COLT-', '0 to 3500 PSI', '058/CAB', 0, '2018-03-19', '2021-03-19', 3, 'KUATIN, IRFAN, WILDA', '2000-02-06', 6, 'EXTERNAL', '', '', 'test.jpg'),
('059/CAB', 'STANDARD WEIGHT (8 BUAH)', 'VCI VERUST', '1129 – 2296.6', '059/CAB', 0, '2012-07-20', 'Initial', 0, 'KUATIN, IRFAN, WILDA', '2000-02-07', 6, 'EXTERNAL', '', '', 'test.jpg'),
('061/CAB', 'DIAL THERMOMETER', 'LOOSCO', '0 to 250 °C', '061/CAB', 1, '2015-03-04', '2020-03-04', 5, 'KUATIN, IRFAN, WILDA', '2000-02-08', 6, 'EXTERNAL', '', '', 'test.jpg'),
('062/CAB', 'DIELECTRIC/ INSULATION TESTER', 'BASE', 'BHP-5200', '19718', 0, '2019-08-22', '2021-08-22', 2, 'KUATIN, IRFAN, WILDA', '2000-02-09', 6, 'INTERNAL', '', '', 'test.jpg'),
('063/CAB', 'OVEN (INCUBATOR)', 'HERAEUS', 'B6060', 'S1000339', 0, '2018-07-31', '2019-07-31', 1, 'KUATIN, IRFAN, WILDA', '2000-02-10', 6, 'EXTERNAL', '', '', 'test.jpg'),
('064/CAB', 'SALT  SPRAY CHAMBER', 'HERAEUS', 'H5K 1000', '43467', 0, '2018-07-31', '2019-07-31', 1, 'KUATIN, IRFAN, WILDA', '2000-02-11', 6, 'EXTERNAL', '', '', 'test.jpg'),
('066/CAB', 'VIDEO FIBRE', 'YORK', 'S 200', '200-01-032', 0, '2013-12-18', '2018-12-18', 5, 'KUATIN, IRFAN, WILDA', '2000-02-12', 6, 'EXTERNAL', '', '', 'test.jpg'),
('067/CAB', 'CHROMATIC DISPERTION', 'YORK', 'S 18', '18972944', 1, '2013-12-16', '2018-12-16', 5, 'KUATIN, IRFAN, WILDA', '2000-02-13', 6, 'EXTERNAL', '', '', 'test.jpg'),
('068/CAB', 'SPECTRAL  ATTENUATOR     ', 'YORK', 'S 25', '25-02-174', 1, '2013-12-18', '2018-12-18', 5, 'KUATIN, IRFAN, WILDA', '2000-02-14', 6, 'EXTERNAL', '', '', 'test.jpg'),
('069/CAB', 'PORTABLE  WHEATSTONE BRIDGE', 'YOKOGAWA', '2755', '66VNO140', 0, '2019-08-22', '2022-08-22', 3, 'KUATIN, IRFAN, WILDA', '2000-02-15', 6, 'INTERNAL', '', '', 'test.jpg'),
('069/CAL', 'TERMO-HIGROMETER', 'HISAMATSU', 'TN-2500', '4098', 0, '2018-03-14', '2020-03-14', 2, 'SENTOT HERY', '2000-01-19', 6, 'EXTERNAL', '', '', 'test.jpg'),
('070/CAB', 'THERMAL SHOCK CHAMBER', 'HERAEUS', 'VMS 2/08/22/3', '7059168', 1, '2008-02-25', '2009-02-25', 1, 'KUATIN, IRFAN, WILDA', '2000-02-16', 6, 'EXTERNAL', '', '', 'test.jpg'),
('070/CAL', 'TERMO-HIGROMETER', 'PALMA', 'SATO', '107669', 0, '2018-03-15', '2020-03-15', 2, 'SENTOT HERY', '2000-01-20', 6, 'EXTERNAL', '', '', 'test.jpg'),
('071/CAL', 'TERMO-HIGROMETER', 'HISAMATSU', 'TN-2500', '4099', 0, '2018-03-13', '2020-03-13', 2, 'SENTOT HERY', '2000-01-21', 6, 'EXTERNAL', '', '', 'test.jpg'),
('074/CAB', 'OTDR (Optic Time Domain Reflector)', 'PHOTON KINETICS', '6500', '6571702', 1, '2010-05-20', '2012-05-20', 2, 'KUATIN, IRFAN, WILDA', '2000-02-17', 6, 'EXTERNAL', '', '', 'test.jpg'),
('075/CAB', 'TDR (Time Division Reflector)', 'TEKTRONIK', 'TS.100 ', 'B.056208', 0, '2006-04-25', 'Initial', 0, 'KUATIN, IRFAN, WILDA', '2000-02-18', 6, 'EXTERNAL', '', '', 'test.jpg'),
('076/CAB', 'COMPUTER TENSILE SQUEEZEE  TESTER', 'HUNGTA', 'HT-8760', '1003', 0, '2019-09-24', '2021-09-24', 2, 'KUATIN, IRFAN, WILDA', '2000-02-19', 6, 'EXTERNAL', '', '', 'test.jpg'),
('077/CAB', 'FIBRE CONTINOUS  FLEXING TESTER', 'HUNGTA', 'HT-8761', '1104', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-02-20', 6, '-', '', '', 'test.jpg'),
('078/CAB', 'FIBRE CONTINOUS IMPACT TESTER', 'HUNGTA', 'HT-8762', '1203', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-02-21', 6, '-', '', '', 'test.jpg'),
('079/CAB', 'AUTO FIBRE TORSION TESTER', 'HUNGTA', 'HT-8763', '1233', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-02-22', 6, '-', '', '', 'test.jpg'),
('080/CAB', 'DIGITAL MONOMETER (pressure gauge)', 'VDO', '3904.000.004', '53707', 1, '2013-02-25', '2015-02-25', 2, 'KUATIN, IRFAN, WILDA', '2000-02-23', 6, 'EXTERNAL', '', '', 'test.jpg'),
('081/CAB', 'VIBRATION TESTING SYSTEM', 'B & K', '3391-086', '1767753', 0, '2017-03-15', '2022-03-15', 5, 'KUATIN, IRFAN, WILDA', '2000-02-24', 6, 'EXTERNAL', '', '', 'test.jpg'),
('084/CAB', ' TRUE RMS MULTIMETER', 'FLUKE', '79 III', '76870983', 0, '2018-09-18', '2020-09-18', 2, 'KUATIN, IRFAN, WILDA', '2000-02-25', 6, 'INTERNAL', '', '', 'test.jpg'),
('085/CAB', 'TIMBANGAN 11 KG', 'UWE  GENIWEIQHER', 'GM – 11 K', 'E06108', 0, '2016-08-30', '2019-08-30', 3, 'KUATIN, IRFAN, WILDA', '2000-02-26', 6, 'EXTERNAL', '', '', 'test.jpg'),
('086/CAL', 'STANDARD RESISTOR', 'SIEMEN', '0.001 ?', '1600726', 0, '2019-07-12', '2021-07-12', 2, 'SENTOT HERY', '2000-01-22', 6, 'INTERNAL', '', '', 'test.jpg'),
('087/CAL', 'STANDARD RESISTOR', 'SIEMEN', '1 000  ?', '19007', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-01-23', 6, 'INTERNAL', '', '', 'test.jpg'),
('089/CAB', 'TERMOMETER GELAS', 'GOLD BRAND', '0 – 150 ºC', '-4-', 1, '2018-03-14', '2020-03-14', 2, 'KUATIN, IRFAN, WILDA', '2000-02-27', 6, 'EXTERNAL', '', '', 'test.jpg'),
('089/CAL', 'STANDARD RESISTOR', 'SIEMEN', '10 000  ?', '19005', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-01-24', 6, 'INTERNAL', '', '', 'test.jpg'),
('090/CAL', 'STANDARD RESISTOR', 'SIEMEN', '0.1  ?', '1600674', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-01-25', 6, 'INTERNAL', '', '', 'test.jpg'),
('091/CAL', 'STANDARD RESISTOR', 'SIEMEN', '0.01  ?', '1600688', 0, '2019-01-17', '2021-01-17', 2, 'SENTOT HERY', '2000-01-26', 6, 'INTERNAL', '', '', 'test.jpg'),
('092/CAB', 'STOP WATCH', 'NIKE', 'H2O Resistance', '-', 0, '2019-08-23', '2020-08-23', 1, 'KUATIN, IRFAN, WILDA', '2000-02-28', 6, 'INTERNAL', '', '', 'test.jpg'),
('092/CAL', 'STANDARD RESISTOR', 'AEG', '10  ?', '7528', 0, '2019-04-22', '2021-04-22', 2, 'SENTOT HERY', '2000-01-27', 6, 'INTERNAL', '', '', 'test.jpg'),
('093/CAB', 'STOP WATCH', 'NIKE', 'H2O Resistance', '-', 0, '2019-08-23', '2020-08-23', 1, 'KUATIN, IRFAN, WILDA', '2000-02-29', 6, 'INTERNAL', '', '', 'test.jpg'),
('093/CAL', 'STANDARD RESISTOR', 'AEG', '0.0001  ?', '7348', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-01-28', 6, 'INTERNAL', '', '', 'test.jpg'),
('094/CAB', 'MILI OHM METER', 'QUADTECH', '1880', '489818', 0, '2020-01-27', '2022-01-27', 2, 'KUATIN, IRFAN, WILDA', '2000-03-01', 6, 'INTERNAL', '', '', 'test.jpg'),
('094/CAL', 'STANDARD RESISTOR', 'AEG', '1 000  ?', '7664', 0, '2018-12-20', '2020-12-20', 2, 'SENTOT HERY', '2000-01-29', 6, '#VALUE!', '', '', 'test.jpg'),
('095/CAB', 'DIELECTRIC LOSS MEASURING SET', 'ANDO', 'TR-10C', '3910401', 0, '2015-05-04', '2018-05-04', 3, 'KUATIN, IRFAN, WILDA', '2000-03-02', 6, 'INTERNAL', '', '', 'test.jpg'),
('095/CAL', 'STANDARD RESISTOR', 'AEG', '100  ?', '7518', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-01-30', 6, 'INTERNAL', '', '', 'test.jpg'),
('096/CAB', 'NULL DITECTOR', 'ANDO', 'BDA-9', '3910401', 0, '2015-07-06', '2018-07-06', 3, 'KUATIN, IRFAN, WILDA', '2000-03-03', 6, 'INTERNAL', '', '', 'test.jpg'),
('096/CAL', 'STANDARD RESISTOR', 'AEG', '100 000  ?', '-', 0, '2019-01-17', '2021-01-17', 2, 'SENTOT HERY', '2000-01-31', 6, 'INTERNAL', '', '', 'documentation_1582182995869_Standard Resistor.png'),
('097/CAB', 'OSCILLATOR', 'ANDO', 'WBG-9', '3910401', 1, '2009-11-04', '2010-11-04', 1, 'KUATIN, IRFAN, WILDA', '2000-03-04', 6, 'INTERNAL', '', '', 'test.jpg'),
('097/CAL', 'STANDARD RESISTOR', 'AEG', '10 000  ?', '7097', 0, '2019-01-17', '2021-01-17', 2, 'SENTOT HERY', '2000-02-01', 6, 'INTERNAL', '', '', 'documentation_1582182148262_Standard Resistor.png'),
('098/CAB', 'THERMOSTATIC OVEN', 'ANDO', 'TO-19', '3910401', 0, '2016-02-26', '2021-02-26', 5, 'KUATIN, IRFAN, WILDA', '2000-03-05', 6, 'EXTERNAL', '', '', 'test.jpg'),
('098/CAL', 'STANDARD RESISTOR', 'AEG', '0.01  ?', '7172', 0, '2018-01-25', '2020-01-25', 2, 'SENTOT HERY', '2000-02-02', 6, 'INTERNAL', '', '', 'documentation_1582132721778_Standard Resistor.png'),
('099/CAB', 'POLARISATION MODE DIPERSION SYSTEM', 'PERKIN ELMER', 'NEXUS', '26801', 0, '2006-05-25', '2011-05-25', 5, 'KUATIN, IRFAN, WILDA', '2000-03-06', 6, 'INTERNAL', '', '', 'test.jpg'),
('099/CAL', 'STANDARD RESISTOR', 'AEG', '10  ?', '7529', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-02-03', 6, 'INTERNAL', '', '', 'documentation_1582132855813_Standard Resistor.png'),
('100/CAB', 'MEGATEST 5000', 'AMPROBE', 'AMB-5KVD', '4061594', 0, '2019-12-02', '2021-12-02', 2, 'KUATIN, IRFAN, WILDA', '2000-03-07', 6, 'INTERNAL', '', '', 'test.jpg'),
('100/CAL', 'STANDARD RESISTOR', 'AEG', '0.1  ?', '7810', 0, '2019-01-17', '2021-01-17', 2, 'SENTOT HERY', '2000-02-04', 6, 'INTERNAL', '', '', 'test.jpg'),
('101/CAB', 'DIGIMATIC CALIPER', 'MITUTOYO', 'CD-12\"C / 0 ~ 300mm', '66203', 0, '2019-06-11', '2021-06-11', 2, 'KUATIN, IRFAN, WILDA', '2000-03-08', 6, 'EXTERNAL', '', '', 'test.jpg'),
('101/CAL', 'STANDARD RESISTOR', 'AEG', '100  ?', '7520', 0, '2019-01-18', '2021-01-18', 2, 'SENTOT HERY', '2000-02-05', 6, 'INTERNAL', '', '', 'test.jpg'),
('102/CAB', 'OTDR & OPTICAL DWDM ANALIZER', 'ACTERNA', 'MTS 8000', '940', 0, '2017-10-26', '2022-10-26', 5, 'KUATIN, IRFAN, WILDA', '2000-03-09', 6, 'EXTERNAL', '', '', 'test.jpg'),
('102/CAL', 'STANDARD RESISTOR', 'AEG', '1  ?', '7691', 0, '2018-12-20', '2020-12-20', 2, 'SENTOT HERY', '2000-02-06', 6, 'INTERNAL', '', '', 'test.jpg'),
('103/CAB', 'SOUND LEVEL METER', 'RION', 'NA-27', '10362601', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-03-10', 6, '-', '', '', 'test.jpg'),
('103/CAL', 'STANDARD RESISTOR', 'AEG', '1000  ?', '7662', 0, '2019-01-17', '2021-01-17', 2, 'SENTOT HERY', '2000-02-07', 6, 'INTERNAL', '', '', 'test.jpg'),
('104/CAB', 'FUSION SPLICER', 'FITEL', 'S177A', '4406', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-03-11', 6, '-', '', '', 'test.jpg'),
('104/CAL', 'STANDARD RESISTOR', 'AEG', '0.1  ?', '7419', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-02-08', 6, 'INTERNAL', '', '', 'test.jpg'),
('105/CAB', 'OPTICAL FIBER GEOMETRIC SYSTEM', 'PHOTO KINETICS', 'PK 240', '53172503', 0, '2013-12-19', '2018-12-19', 5, 'KUATIN, IRFAN, WILDA', '2000-03-12', 6, 'EXTERNAL', '', '', 'test.jpg'),
('105/CAL', 'STANDARD RESISTOR', 'AEG', '10 000  ?', '7099', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-02-09', 6, 'INTERNAL', '', '', 'test.jpg'),
('106/CAB', 'OPTICAL COATING GEOMETRY', 'PHOTO KINETICS', '2400', '53782388', 0, '2013-12-19', '2018-12-19', 5, 'KUATIN, IRFAN, WILDA', '2000-03-13', 6, 'EXTERNAL', '', '', 'test.jpg'),
('106/CAL', 'STANDARD RESISTOR', 'AEG', '1  ?', '7687', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-02-10', 6, 'INTERNAL', '', '', 'test.jpg'),
('107/CAB', 'MODULAR IMPULSE GENERATOR', 'CE', 'MIG-0612', '826', 0, '2018-01-29', '2021-01-29', 3, 'KUATIN, IRFAN, WILDA', '2000-03-14', 6, 'INTERNAL', '', '', 'test.jpg'),
('107/CAL', 'STANDARD RESISTOR', 'AEG', '0.001  ?', '6895', 0, '2019-04-22', '2021-04-22', 2, 'SENTOT HERY', '2000-02-11', 6, 'INTERNAL', '', '', 'test.jpg'),
('108/CAB', 'OTDR ', 'PHOTON KINETICS', '8000 / 86501-YO', '80000417', 0, '2018-07-18', '2020-07-18', 2, 'KUATIN, IRFAN, WILDA', '2000-03-15', 6, 'EXTERNAL', '', '', 'test.jpg'),
('108/CAL', 'LCR METER', 'HP', '4263B', 'JP1KD00894', 0, '2019-07-05', '2021-07-05', 2, 'SENTOT HERY', '2000-02-12', 6, 'INTERNAL', '', '', 'test.jpg'),
('109/CAB', 'OPTICAL LASER SOURCE', 'JDSU', 'OLS-55', 'M-0165', 0, '2020-01-28', '2025-01-28', 5, 'KUATIN, IRFAN, WILDA', '2000-03-16', 6, 'EXTERNAL', '', '', 'test.jpg'),
('109/CAL', '50 W TERMINATION', 'TETRONIX', '50 W 2 W', '011-0049-01', 0, '2019-07-15', '2021-07-15', 2, 'SENTOT HERY', '2000-02-13', 6, 'INTERNAL', '', '', 'test.jpg'),
('110/CAB', 'SELECTIVE OPTICAL POWER METER', 'JDSU', 'OLP-57', 'P-0019', 0, '2020-01-28', '2025-01-28', 5, 'KUATIN, IRFAN, WILDA', '2000-03-17', 6, 'EXTERNAL', '', '', 'test.jpg'),
('110/CAL', 'STEP ATTENUATOR', 'HP', '8496 B', '1350A02875', 0, '2019-04-23', '2021-04-23', 2, 'SENTOT HERY', '2000-02-14', 6, 'INTERNAL', '', '', 'test.jpg'),
('111/CAB', 'OTDR', 'JDSU', 'MTS-4000', '5416, 0-0042', 0, '2017-11-20', '2022-11-20', 5, 'KUATIN, IRFAN, WILDA', '2000-03-18', 6, 'EXTERNAL', '', '', 'test.jpg'),
('112/CAB', 'INSERTION LOSS / RETUR LOSS TEST STATION', 'JOINWIT', 'JW3307A', '11052019', 0, '2019-11-05', '2021-11-05', 2, 'KUATIN, IRFAN, WILDA', '2000-03-19', 6, 'EXTERNAL', '', '', 'test.jpg'),
('112/CAL', 'POWER SENSOR', 'HP', '8482 H', '1545A00991', 0, '2018-05-08', '2020-05-08', 2, 'SENTOT HERY', '2000-02-15', 6, 'EXTERNAL', '', '', 'test.jpg'),
('113/CAB', 'OPTICAL TIME DOMAIN REFLECTOMETER (OTDR)', 'EXFO', 'FTB-200', '713161', 0, '2018-05-25', '2019-05-25', 1, 'KUATIN, IRFAN, WILDA', '2000-03-20', 6, 'EXTERNAL', '', '', 'test.jpg'),
('114/CAB', 'CD & PMD', 'EXFO', '-', '-', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-03-21', 6, 'EXTERNAL', '', '', 'test.jpg'),
('115/CAB', 'ARC FUSION SPLICER', 'SWIFT', 'K-7', 'AA361509010924', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-03-22', 6, '-', '', '', 'test.jpg'),
('116/CAB', 'PE FIBER OPTICS', '-', 'WS-500', '-', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-03-23', 6, '-', '', '', 'test.jpg'),
('117/CAB', 'CLADDING DIAMETER STANDARD', 'NPL', '-', '-', 0, '2016-04-19', 'INITIAL', 0, 'KUATIN, IRFAN, WILDA', '2000-03-24', 6, 'EXTERNAL', '', '', 'test.jpg'),
('118/CAB', 'CORNING (R) SINGLE MODE OPTICAL FIBER ITU-TG-652D', 'CORNING', '12867 METER', '1.00544E+11', 0, '2016-04-13', 'INITIAL', 0, 'KUATIN, IRFAN, WILDA', '2000-03-25', 6, 'EXTERNAL', '', '', 'test.jpg'),
('118/CAL', 'DUAL DIRECT. COUPLER', 'HP', '796 D', '7090', 0, '2019-04-23', '2021-04-23', 2, 'SENTOT HERY', '2000-02-16', 6, 'INTERNAL', '', '', 'test.jpg'),
('119/CAB', 'CORNING (R) SINGLE MODE OPTICAL FIBER ITU-TG-652D', 'CORNING', '12864 METER', '1.00544E+11', 0, '2016-04-12', 'INITIAL', 0, 'KUATIN, IRFAN, WILDA', '2000-03-26', 6, 'EXTERNAL', '', '', 'test.jpg'),
('119/CAL', 'PREC. TERMIN DC 100 KHZ ', 'TETRONIX', '50 W', '011-0129-00', 0, '2017-04-26', '2019-04-26', 2, 'SENTOT HERY', '2000-02-17', 6, 'INTERNAL', '', '', 'test.jpg'),
('120/CAB', 'CORNING (R) SINGLE MODE OPTICAL FIBER ITU-TG-652D', 'CORNING', '12,6 KM', '1.00547E+11', 0, '2016-05-11', 'INITIAL', 0, 'KUATIN, IRFAN, WILDA', '2000-03-27', 6, 'EXTERNAL', '', '', 'test.jpg'),
('121/CAB', 'OPTICAL FIBRE REFERENCE ', 'CORNING', '2,2 KM', '100537530456D', 0, '2016-05-12', 'INITIAL', 0, 'KUATIN, IRFAN, WILDA', '2000-03-28', 6, 'EXTERNAL', '', '', 'test.jpg'),
('121/CAL', 'MATCHED 75-50 W', 'TETRONIX', '75 W 50 W', '011-057', 0, '2017-04-26', '2019-04-26', 2, 'SENTOT HERY', '2000-02-18', 6, 'INTERNAL', '', '', 'test.jpg'),
('122/CAB', 'DIDITAL CALIPER ', 'TORA', '150mm', '13110131', 0, '2018-08-02', '2020-08-02', 2, 'KUATIN, IRFAN, WILDA', '2000-03-29', 6, 'EXTERNAL', '', '', 'test.jpg'),
('122/CAL', 'PREC. TERMIN DC 18 Ghz', 'SUHNER', '50 W', '6500.17.A', 0, '2018-09-18', '2020-09-18', 2, 'SENTOT HERY', '2000-02-19', 6, 'INTERNAL', '', '', 'test.jpg'),
('123/CAB', 'FUSION SPLICER', 'FITEL', 'S123M12', '10014', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-03-30', 6, '-', '', '', 'test.jpg'),
('124/CAB', 'FUSION SPLICER', 'FITEL', 'S178A VER.2', '33967', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-03-31', 6, '-', '', '', 'test.jpg'),
('125/CAB', 'INSERTION LOSS / RETUR LOSS TEST STATION', 'STC', 'IRL-3201', '171221628', 0, '2018-11-23', '2020-11-23', 2, 'KUATIN, IRFAN, WILDA', '2000-04-01', 6, 'EXTERNAL', '', '', 'test.jpg'),
('125/CAL', 'FEED THR. TERM DC1.2 Ghz', 'SUHNER', '75 W', '-', 0, '2017-10-13', '2019-10-13', 2, 'SENTOT HERY', '2000-02-20', 6, 'INTERNAL', '', '', 'test.jpg'),
('126/CAB', 'CLIMATIC CHAMBER ', 'WELLTECH', 'JHT-880R CA 8800L', '17-214', 0, '2017-10-29', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-04-02', 6, '-', '', '', 'test.jpg'),
('126/CAL', 'PULSE GENERATOR', 'HP', '8112A', '3205G11966', 0, '2017-04-17', '2019-04-17', 2, 'SENTOT HERY', '2000-02-21', 6, 'INTERNAL', '', '', 'test.jpg'),
('127/CAB', 'SINGLE WIRE & CABLE VERTICAL FLAME TEST ', 'EQUIPMENT', 'BND-DXR', '17092301', 0, '2017-09-01', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-04-03', 6, '-', '', '', 'test.jpg'),
('127/CAL', 'CALIBRATION SYSTEM', 'WAVETEK', '9100', '32781', 0, '2018-04-25', '2020-04-25', 2, 'SENTOT HERY', '2000-02-22', 6, 'EXTERNAL', '', '', 'test.jpg'),
('128/CAB', 'CABLE AND ANTENNA ANALYZER ', 'ROHDE & SCHWARZ', 'ZVH4', '1309.6800K24-102722-fB', 0, '2014-07-18', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-04-04', 6, 'EXTERNAL', '', '', 'test.jpg'),
('128/CAL', 'STANDARD INDUCTOR', 'QUADTECH', '1482-B', '6422734', 0, '2019-11-20', '2021-11-20', 2, 'SENTOT HERY', '2000-02-23', 6, 'EXTERNAL', '', '', 'test.jpg'),
('129/CAB', 'STRAIN POWER & LENGTH MEASUREMENT SYSTEM', 'PERKIN ELMER OPTOELECTRICS', 'SPL400', '-', 0, '2014-07-18', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-04-05', 6, '-', '', '', 'test.jpg'),
('129/CAL', 'STANDARD INDUCTOR', 'QUADTECH', '1482-E', '6422735', 0, '2019-07-12', '2021-07-12', 2, 'SENTOT HERY', '2000-02-24', 6, 'INTERNAL', '', '', 'test.jpg'),
('130/CAB', 'OPTICAL INSERTION LOSS / RETURN LOSS TESTER', 'TRIBRER', 'GRL200', '5.0101E+12', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-04-06', 6, '-', '', '', 'test.jpg'),
('130/CAL', 'STANDARD INDUCTOR', 'QUADTECH', '1482-H', '6422736', 0, '2019-07-12', '2021-07-12', 2, 'SENTOT HERY', '2000-02-25', 6, 'INTERNAL', '', '', 'test.jpg'),
('131/CAB', 'TIMBANGAN GANTUNG 500 KG', 'NANKAI', 'Crane Scale', '2019051731', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-04-07', 6, 'EXTERNAL', '', '', 'test.jpg'),
('131/CAL', 'STANDARD INDUCTOR', 'QUADTECH', '1482-L', '6422737', 0, '2019-11-20', '2021-11-20', 2, 'SENTOT HERY', '2000-02-26', 6, 'EXTERNAL', '', '', 'test.jpg'),
('132/CAB', 'TENSILE MACHINE', 'SINOWON', 'SM-200', 'GD7521511522', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-04-08', 6, 'EXTERNAL', '', '', 'test.jpg'),
('132/CAL', 'STANDARD INDUCTOR', 'QUADTECH', '1482-P', '6422738', 0, '2019-11-20', '2021-11-20', 2, 'SENTOT HERY', '2000-02-27', 6, 'EXTERNAL', '', '', 'test.jpg'),
('133/CAB', 'CLIMATIC CHAMBER', 'GRANDE', 'GTH-408', '20190925001', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-04-09', 6, 'EXTERNAL', '', '', 'test.jpg'),
('133/CAL', 'STANDARD INDUCTOR', 'QUADTECH', '1482-T', '6422739', 0, '2019-07-12', '2021-07-12', 2, 'SENTOT HERY', '2000-02-28', 6, 'INTERNAL', '', '', 'test.jpg'),
('134/CAB', 'LASER CUTTING', 'YUEHONG CUTING', '', '', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-04-10', 6, 'EXTERNAL', '', '', 'test.jpg'),
('134/CAL', 'SCALAR NETWORK ANALYZER', 'HP', '8757 C', '3210A02391', 1, '2016-12-23', '2017-12-23', 1, 'SENTOT HERY', '2000-02-29', 6, 'INTERNAL', '', '', 'test.jpg'),
('135/CAL', 'OSCILLOSCOPE 1 Ghz', 'HP', '54710 D', 'US35370102', 0, '2017-10-25', '2019-10-25', 2, 'SENTOT HERY', '2000-03-01', 6, 'INTERNAL', '', '', 'test.jpg'),
('136/CAL', 'MULTIMETER', 'HP', '3458 A', '2823A13780', 0, '2019-11-14', '2021-11-14', 2, 'SENTOT HERY', '2000-03-02', 6, 'EXTERNAL', '', '', 'test.jpg'),
('137/CAL', 'FREQ. ERROR MEAS. SYSTEM', 'ODETICS', '345-200-01', '3450046-9718', 1, '2017-10-16', '2018-10-16', 1, 'SENTOT HERY', '2000-03-03', 6, 'INTERNAL', '', '', 'test.jpg'),
('138/CAL', 'PRECISION LCR METER', 'QUAD-TECH', '7600', '7124266', 0, '2019-11-18', '2021-11-18', 2, 'SENTOT HERY', '2000-03-04', 6, 'EXTERNAL', '', '', 'test.jpg'),
('139/CAL', 'CALIBRATION STANDARD', 'QUAD-TECH', '800064-69', '7204770', 0, '2019-07-08', '2021-07-08', 2, 'SENTOT HERY', '2000-03-05', 6, 'INTERNAL', '', '', 'test.jpg'),
('140/CAL', 'REFFERENCE DIVIDER', 'FLUKE', '752A', '6780202', 0, '2019-04-23', '2021-04-23', 2, 'SENTOT HERY', '2000-03-06', 6, 'INTERNAL', '', '', 'test.jpg'),
('141/CAL', 'AC/DC TRANSFER STANDARD', 'FLUKE', '792A', '6765001', 1, '2015-04-03', '2017-04-03', 2, 'SENTOT HERY', '2000-03-07', 6, 'INTERNAL', '', '', 'test.jpg'),
('142/CAL', 'DC VOLTAGE REFF STD.', 'WAVETEK', '4910', '33957', 0, '2019-04-23', '2021-04-23', 2, 'SENTOT HERY', '2000-03-08', 6, 'INTERNAL', '', '', 'test.jpg'),
('143/CAL', 'SYNT/ FUNCTION GENERATOR', 'HP', '3325B', '2847A13258', 0, '2017-10-25', '2019-10-25', 2, 'SENTOT HERY', '2000-03-09', 6, 'INTERNAL', '', '', 'test.jpg'),
('144/CAL', 'UNIVERSAL TIME INTERVAL COUNTER', 'HP', '5370B', '2904A02827', 0, '2018-08-03', '2020-08-03', 2, 'SENTOT HERY', '2000-03-10', 6, 'INTERNAL', '', '', 'test.jpg'),
('145/CAL', 'THERMO HIGROMETER', 'HISAMATSU', 'TN-2500', '4556', 0, '2018-03-22', '2020-03-22', 2, 'SENTOT HERY', '2000-03-11', 6, 'EXTERNAL', '', '', 'test.jpg'),
('146/CAL', 'SWEEP OSCILLATOR', 'HP', '8350 B', '3241A16772', 1, '2016-12-23', '2017-12-23', 1, 'SENTOT HERY', '2000-03-12', 6, 'INTERNAL', '', '', 'test.jpg'),
('148/CAL', 'CALIBRATION SYSTEM', 'WAVETEK', '9100', '40766', 0, '2019-11-19', '2021-11-19', 2, 'SENTOT HERY', '2000-03-13', 6, 'EXTERNAL', '', '', 'test.jpg'),
('149/CAL', 'SIGNAL GENERATOR', 'HP', '8656 B', '333414996', 0, '2018-05-31', '2019-05-31', 1, 'SENTOT HERY', '2000-03-14', 6, 'EXTERNAL', '', '', 'test.jpg'),
('150/CAL', 'POWER SENSOR', 'HP', '8481H', '2237A06238', 0, '2018-04-05', '2020-04-05', 2, 'SENTOT HERY', '2000-03-15', 6, 'EXTERNAL', '', '', 'test.jpg'),
('151/CAL', 'POWER SENSOR', 'HP', '8481A', '2237A35799', 0, '2019-11-14', '2021-11-14', 2, 'SENTOT HERY', '2000-03-16', 6, 'EXTERNAL', '', '', 'test.jpg'),
('152/CAL', 'POWER SENSOR', 'HP', '8483A', '2329A02232', 0, '2018-04-05', '2020-04-05', 2, 'SENTOT HERY', '2000-03-17', 6, 'EXTERNAL', '', '', 'test.jpg'),
('153/CAL', 'POWER SENSOR', 'HP', '8481D', '2928A03960', 0, '2019-11-14', '2021-11-14', 2, 'SENTOT HERY', '2000-03-18', 6, 'EXTERNAL', '', '', 'test.jpg'),
('154/CAL', 'POWER SENSOR', 'HP', '8485A', '3318A16530', 1, '2018-05-08', '2020-05-08', 2, 'SENTOT HERY', '2000-03-19', 6, 'EXTERNAL', '', '', 'test.jpg'),
('156/CAL', 'DUAL DIRECTIONAL COUPLER', 'HP', '778D', '17275', 0, '2018-10-16', '2021-10-16', 3, 'SENTOT HERY', '2000-03-20', 6, 'INTERNAL', '', '', 'test.jpg'),
('157/CAL', 'DUAL DIRECTIONAL COUPLER', 'HP', '772D', '2839A00843', 0, '2017-03-30', '2020-03-30', 3, 'SENTOT HERY', '2000-03-21', 6, 'INTERNAL', '', '', 'test.jpg'),
('158/CAL', 'POWER SENSOR', 'HP', '8482A', 'US37290006', 0, '2018-03-23', '2020-03-23', 2, 'SENTOT HERY', '2000-03-22', 6, 'EXTERNAL', '', '', 'test.jpg'),
('159/CAL', '50 OHM TERMINATION', 'SUHNER', '15W DC-10G', '6515.01B', 0, '2019-07-08', '2021-07-08', 2, 'SENTOT HERY', '2000-03-23', 6, 'INTERNAL', '', '', 'test.jpg'),
('160/CAL', 'MICROWAVE SYNTH. GENERATOR', 'GIGA-TRONICS', '12720A', '22005', 0, '2019-08-19', '2020-08-19', 1, 'SENTOT HERY', '2000-03-24', 6, 'EXTERNAL', '', '', 'test.jpg'),
('161/CAL', 'DIGITAL MULTIMETER', 'IWATSU', 'VOAC 92', '21701', 0, '2019-09-09', '2020-09-09', 1, 'SENTOT HERY', '2000-03-25', 6, 'INTERNAL', '', '', 'test.jpg'),
('162/CAL', 'DIGITAL MULTIMETER', 'IWATSU', 'VOAC 92', '21706', 0, '2019-09-09', '2020-09-09', 1, 'SENTOT HERY', '2000-03-26', 6, 'INTERNAL', '', '', 'test.jpg'),
('164/CAL', 'AC VOLTMETER', 'YOKOGAWA', '235300-80-13', '60LH0860', 0, '2019-09-11', '2020-09-11', 1, 'SENTOT HERY', '2000-03-27', 6, 'INTERNAL', '', '', 'test.jpg'),
('165/CAL', 'AC VOLTMETER', 'YOKOGAWA', '235300-80-13', '60LH0861', 0, '2019-09-11', '2020-09-11', 1, 'SENTOT HERY', '2000-03-28', 6, 'INTERNAL', '', '', 'test.jpg'),
('166/CAL', 'AC VOLTMETER ', 'YOKOGAWA ', '235300-80-13', '60LH0862', 0, '2019-09-11', '2020-09-11', 1, 'SENTOT HERY', '2000-03-29', 6, 'INTERNAL', '', '', 'test.jpg'),
('167/CAL', 'DECADE RESISTANCE BOX', 'YOKOGAWA', '2793-01', '60VX0222', 0, '2017-10-25', '2019-10-25', 2, 'SENTOT HERY', '2000-03-30', 6, 'INTERNAL', '', '', 'test.jpg'),
('168/CAL', 'DECADE RESISTANCE BOX', 'YOKOGAWA', '2786-20', '60VU1118', 0, '2019-04-23', '2021-04-23', 2, 'SENTOT HERY', '2000-03-31', 6, 'INTERNAL', '', '', 'test.jpg'),
('169/CAL', 'DIGITAL THERMOMETER', 'YOKOGAWA', 'TX10-03', '900417', 0, '2018-03-12', '2020-03-12', 2, 'SENTOT HERY', '2000-04-01', 6, 'EXTERNAL', '', '', 'test.jpg'),
('171/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-600/75', 'CN-0001', 0, '2019-04-22', '2021-04-22', 2, 'SENTOT HERY', '2000-04-02', 6, 'INTERNAL', '', '', 'test.jpg'),
('172/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-75/75', 'CI-0010', 0, '2019-04-16', '2021-04-16', 2, 'SENTOT HERY', '2000-04-03', 6, 'INTERNAL', '', '', 'test.jpg'),
('173/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-135/75', 'DF-0007', 0, '2019-04-22', '2021-04-22', 2, 'SENTOT HERY', '2000-04-04', 6, 'INTERNAL', '', '', 'test.jpg'),
('174/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-120/75', 'CT-0011', 0, '2019-04-16', '2021-04-16', 2, 'SENTOT HERY', '2000-04-05', 6, 'INTERNAL', '', '', 'test.jpg'),
('175/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-124/75', 'CM-0005', 0, '2019-04-16', '2021-04-16', 2, 'SENTOT HERY', '2000-04-06', 6, 'INTERNAL', '', '', 'test.jpg'),
('176/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-150/75', 'CO-0014', 0, '2019-04-16', '2021-04-16', 2, 'SENTOT HERY', '2000-04-07', 6, 'INTERNAL', '', '', 'test.jpg'),
('177/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-50/75', 'DG-001', 0, '2019-04-16', '2021-04-16', 2, 'SENTOT HERY', '2000-04-08', 6, 'INTERNAL', '', '', 'test.jpg'),
('178/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-100/75', 'DB-0007', 0, '2019-04-16', '2021-04-16', 2, 'SENTOT HERY', '2000-04-09', 6, 'INTERNAL', '', '', 'test.jpg'),
('179/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-600/50', 'CD-0002', 0, '2019-04-16', '2021-04-16', 2, 'SENTOT HERY', '2000-04-10', 6, 'INTERNAL', '', '', 'test.jpg'),
('180/CAL', 'CESIUM BEAM', 'OSCILLOQUARTZ', '3210', '945.321.000.63', 0, '2019-01-15', '2021-01-15', 2, 'SENTOT HERY', '2000-04-11', 6, 'EXTERNAL', '', '', 'test.jpg'),
('181/CAL', 'SYNCRONISATION TEST SET', 'OSCILLOQUARTZ', '5565', '945,556,502', 0, '2018-08-07', '2020-08-07', 2, 'SENTOT HERY', '2000-04-12', 6, 'EXTERNAL', '', '', 'test.jpg'),
('182/CAL', 'SIGNAL GENERATOR', 'HP', '8648 B', '3537AO1287', 0, '2019-09-12', '2020-09-12', 1, 'SENTOT HERY', '2000-04-13', 6, 'INTERNAL', '', '', 'test.jpg'),
('184/CAL', 'THERMOHYGROMETER', 'CENTER-314', '314', '20306895', 0, '2018-03-15', '2020-03-15', 2, 'SENTOT HERY', '2000-04-14', 6, 'EXTERNAL', '', '', 'test.jpg'),
('186/CAL', 'CLAMP METER KEW SNAP', 'KYORITSU', '2904', '905563', 0, '2019-09-10', '2020-09-10', 1, 'SENTOT HERY', '2000-04-15', 6, 'INTERNAL', '', '', 'test.jpg'),
('187/CAL', 'HIGH VOLTAGE DIGITAL METER', 'KIKUSUI', '149-10A', 'JC003087', 0, '2019-02-26', '2020-02-26', 1, 'SENTOT HERY', '2000-04-16', 6, 'EXTERNAL', '', '', 'test.jpg'),
('188/CAL', 'HIGH RESISTANCE DECADE SUBSTITUTER', 'IET', 'HRRS-Q-7-100-5KV', 'B1-0416034', 0, '2019-03-26', '2021-03-26', 2, 'SENTOT HERY', '2000-04-17', 6, 'EXTERNAL', '', '', 'test.jpg'),
('189/CAL', 'WITHSTANDING VOLTAGE TESTER', 'KIKUSUI', 'TOS5051', 'JD000740', 0, '2019-09-12', '2020-09-12', 1, 'SENTOT HERY', '2000-04-18', 6, 'INTERNAL', '', '', 'test.jpg'),
('190/CAL', 'FREQUENCY STANDARD', 'SCHOMANDL', 'FN-GPS/R', '10001', 1, '2012-08-31', '2017-08-31', 5, 'SENTOT HERY', '2000-04-19', 6, 'INTERNAL', '', '', 'test.jpg'),
('191/CAL', 'SELECTIVE LEVEL MEASURINGH SET', 'WG', 'PSM-139', 'CF-0041', 0, '2019-09-13', '2020-09-13', 1, 'SENTOT HERY', '2000-04-20', 6, 'INTERNAL', '', '', 'test.jpg'),
('192/CAL', 'OSCILLOSCOPE', 'TEKTRONIK', 'TDS 3052B', 'C010090', 0, '2019-09-09', '2020-09-09', 1, 'SENTOT HERY', '2000-04-21', 6, 'INTERNAL', '', '', 'test.jpg'),
('193/CAL', 'HIGH VOLTAGE DIGITAL PROBE ', 'ROSS', 'VMP120GH-C-ALF', '070215-6', 0, '2018-10-26', '2022-10-26', 4, 'SENTOT HERY', '2000-04-22', 6, 'INTERNAL', '', '', 'test.jpg'),
('194/CAL', 'RF STEP ATTENUATOR (110 Db)', 'AGILENT', '8496 B', 'MY42145654', 0, '2019-01-29', '2020-01-29', 1, 'SENTOT HERY', '2000-04-23', 6, 'INTERNAL', '', '', 'test.jpg'),
('195/CAL', 'RF STEP ATTENUATOR (11 Db)', 'AGILENT', '8494 B', 'MY42149296', 0, '2017-10-13', '2018-10-13', 1, 'SENTOT HERY', '2000-04-24', 6, 'INTERNAL', '', '', 'test.jpg'),
('196/CAL', 'TERMO-HIGROMETER', 'VICTOR', 'HTC-1', '-', 0, '2018-07-31', '2019-07-31', 1, 'SENTOT HERY', '2000-04-25', 6, 'EXTERNAL', '', '', 'test.jpg'),
('197/CAL', 'TERMO-HIGROMETER', 'VICTOR', 'HTC-1', '-', 0, '2018-07-31', '2019-07-31', 1, 'SENTOT HERY', '2000-04-26', 6, 'EXTERNAL', '', '', 'test.jpg'),
('198/CAL', 'TERMO-HIGROMETER', 'ELITECH', 'RC-4HC', '-', 0, '2018-08-02', '2019-08-02', 1, 'SENTOT HERY', '2000-04-27', 6, 'EXTERNAL', '', '', 'test.jpg'),
('199/CAL', 'RUBIDIUM FREQUENCY STANDARD', 'PENDULUM', '12R', '452029', 0, '2019-08-13', '2021-08-13', 2, 'SENTOT HERY', '2000-04-28', 6, 'EXTERNAL', '', '', 'test.jpg'),
('200/CAL', 'ADVANCED MULTI PRODUCT CALIBRATOR', 'TRANSMILLE', '4015', 'Y1269E18', 0, '2019-09-03', '2021-09-03', 2, 'SENTOT HERY', '2000-04-29', 6, 'EXTERNAL', '', '', 'test.jpg'),
('201/CAL', 'POWER METER ', 'ANRITSU', 'ML2437A', '1922004', 0, '-', '-', 1, 'SENTOT HERY', '2000-04-30', 6, 'EXTERNAL', '', '', 'test.jpg'),
('202/CAL', 'POWER SENSOR (10MHz to 32 GHz, 50?, -70 to +20dBm)', 'ANRITSU', 'MA2473D', '1922004', 0, '-', '-', 1, 'SENTOT HERY', '2000-05-01', 6, 'EXTERNAL', '', '', 'test.jpg'),
('203/CAL', 'MICROWAVE FREQUENCY COUNTER ', 'HP', '5350 B', '2098A02285', 0, '2019-04-18', '2021-04-18', 2, 'SENTOT HERY', '2000-05-02', 6, 'EXTERNAL', '', '', 'test.jpg'),
('204/CAL', 'MICROWAVE COUNTER / ANALYZER', 'PENDULUM', 'CNT-90XL', '969631', 0, '-', '-', 2, 'SENTOT HERY', '2000-05-03', 6, 'EXTERNAL', '', '', 'test.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` varchar(11) NOT NULL,
  `form_name` text NOT NULL,
  `file` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` varchar(11) NOT NULL,
  `table_id` varchar(11) NOT NULL,
  `test_engineer_id` varchar(11) NOT NULL,
  `cal_step_id` varchar(11) NOT NULL,
  `created` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `raw_data`
--

CREATE TABLE `raw_data` (
  `id` varchar(11) NOT NULL,
  `cal_request_id` varchar(11) NOT NULL,
  `test_item_id` varchar(11) NOT NULL,
  `range` double NOT NULL,
  `input_frequency` double DEFAULT NULL,
  `input_value` double NOT NULL,
  `result_1` double NOT NULL,
  `result_2` double DEFAULT NULL,
  `result_3` double DEFAULT NULL,
  `result_4` double DEFAULT NULL,
  `result_5` double DEFAULT NULL,
  `measure_unit` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test_engineers`
--

CREATE TABLE `test_engineers` (
  `id` varchar(11) NOT NULL,
  `name` text NOT NULL,
  `lab` char(3) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` char(1) NOT NULL,
  `photo` text,
  `registered` varchar(24) NOT NULL,
  `updated` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_engineers`
--

INSERT INTO `test_engineers` (`id`, `name`, `lab`, `password`, `email`, `role`, `photo`, `registered`, `updated`) VALUES
('201902060', 'Sony', 'CAL', 'IpAcjld+IgEyLdzcKekO420BpkmALUetLwxI2B3Hco8=', 'sonY@gmail.com', '2', 'test.jpg', '2020-02-18T02:02:52.563Z', '2020-02-18T02:02:52.563Z'),
('970000', 'Test User', 'TRA', '4+3IyHx6ihRclq7Sgf4c9gI7javgY/98S53lk0Vueuo=', 'aldiw@gmail.com', '1', 'test.jpg', '2020-02-17T17:31:11.300Z', '2020-02-17T17:31:11.300Z'),
('970037', 'Aldi Wiranata', 'CAB', 'o5TGTBA3uRfGOpb+wpIidUWLCczMQyqmn518w2RQXiE=', 'aldiw01@gmail.com', '2', 'profile_photo_970037', '2020-01-15T04:51:54.211Z', '2020-02-19T01:49:47.616Z');

-- --------------------------------------------------------

--
-- Table structure for table `test_items`
--

CREATE TABLE `test_items` (
  `id` varchar(11) NOT NULL,
  `test_type_id` int(5) NOT NULL,
  `item_name` text NOT NULL,
  `is_AC` int(11) NOT NULL,
  `bottom_frequency` double DEFAULT NULL,
  `upper_frequency` double DEFAULT NULL,
  `bottom_range` double NOT NULL,
  `upper_range` double NOT NULL,
  `CMC` double NOT NULL,
  `measure_unit` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test_types`
--

CREATE TABLE `test_types` (
  `id` int(5) NOT NULL,
  `type_name` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uncertainty_budget`
--

CREATE TABLE `uncertainty_budget` (
  `id` varchar(11) NOT NULL,
  `test_item_id` varchar(11) NOT NULL,
  `device_id` varchar(11) NOT NULL,
  `calibrator_certificate` double NOT NULL,
  `drift` double NOT NULL,
  `resolution` double NOT NULL,
  `repeatibility` double NOT NULL,
  `other` double DEFAULT NULL,
  `uncertainty` double NOT NULL,
  `calibration_date` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cal_certificates`
--
ALTER TABLE `cal_certificates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK` (`device_id`,`test_engineer_id`),
  ADD KEY `test_engineer_id` (`test_engineer_id`);

--
-- Indexes for table `cal_requests`
--
ALTER TABLE `cal_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK` (`test_engineer_id`,`requestor_id`,`device_id`,`cal_step_id`,`cal_certificate_id`),
  ADD KEY `requestor_id` (`requestor_id`),
  ADD KEY `device_id` (`device_id`),
  ADD KEY `cal_step_id` (`cal_step_id`),
  ADD KEY `cal_certificate_id` (`cal_certificate_id`);

--
-- Indexes for table `cal_results`
--
ALTER TABLE `cal_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK` (`device_id`,`test_item_id`,`cal_certificate_id`,`raw_data_id`),
  ADD KEY `test_item_id` (`test_item_id`),
  ADD KEY `cal_certificate_id` (`cal_certificate_id`),
  ADD KEY `raw_data_id` (`raw_data_id`);

--
-- Indexes for table `cal_specifications`
--
ALTER TABLE `cal_specifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK` (`device_id`,`test_item_id`),
  ADD KEY `test_item_id` (`test_item_id`);

--
-- Indexes for table `cal_steps`
--
ALTER TABLE `cal_steps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK` (`table_id`,`test_engineer_id`,`cal_step_id`),
  ADD KEY `test_engineer_id` (`test_engineer_id`),
  ADD KEY `cal_step_id` (`cal_step_id`);

--
-- Indexes for table `raw_data`
--
ALTER TABLE `raw_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK` (`cal_request_id`,`test_item_id`),
  ADD KEY `test_item_id` (`test_item_id`);

--
-- Indexes for table `test_engineers`
--
ALTER TABLE `test_engineers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_items`
--
ALTER TABLE `test_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK` (`test_type_id`);

--
-- Indexes for table `test_types`
--
ALTER TABLE `test_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uncertainty_budget`
--
ALTER TABLE `uncertainty_budget`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK` (`test_item_id`,`device_id`),
  ADD KEY `device_id` (`device_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cal_certificates`
--
ALTER TABLE `cal_certificates`
  ADD CONSTRAINT `cal_certificates_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`),
  ADD CONSTRAINT `cal_certificates_ibfk_2` FOREIGN KEY (`test_engineer_id`) REFERENCES `test_engineers` (`id`);

--
-- Constraints for table `cal_requests`
--
ALTER TABLE `cal_requests`
  ADD CONSTRAINT `cal_requests_ibfk_1` FOREIGN KEY (`test_engineer_id`) REFERENCES `test_engineers` (`id`),
  ADD CONSTRAINT `cal_requests_ibfk_2` FOREIGN KEY (`requestor_id`) REFERENCES `test_engineers` (`id`),
  ADD CONSTRAINT `cal_requests_ibfk_3` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`),
  ADD CONSTRAINT `cal_requests_ibfk_4` FOREIGN KEY (`cal_step_id`) REFERENCES `cal_steps` (`id`),
  ADD CONSTRAINT `cal_requests_ibfk_5` FOREIGN KEY (`cal_certificate_id`) REFERENCES `cal_certificates` (`id`);

--
-- Constraints for table `cal_results`
--
ALTER TABLE `cal_results`
  ADD CONSTRAINT `cal_results_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`),
  ADD CONSTRAINT `cal_results_ibfk_2` FOREIGN KEY (`test_item_id`) REFERENCES `test_items` (`id`),
  ADD CONSTRAINT `cal_results_ibfk_3` FOREIGN KEY (`cal_certificate_id`) REFERENCES `cal_certificates` (`id`),
  ADD CONSTRAINT `cal_results_ibfk_4` FOREIGN KEY (`raw_data_id`) REFERENCES `raw_data` (`id`);

--
-- Constraints for table `cal_specifications`
--
ALTER TABLE `cal_specifications`
  ADD CONSTRAINT `cal_specifications_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`),
  ADD CONSTRAINT `cal_specifications_ibfk_2` FOREIGN KEY (`test_item_id`) REFERENCES `test_items` (`id`);

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`table_id`) REFERENCES `cal_requests` (`id`),
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`test_engineer_id`) REFERENCES `test_engineers` (`id`),
  ADD CONSTRAINT `history_ibfk_3` FOREIGN KEY (`cal_step_id`) REFERENCES `cal_steps` (`id`);

--
-- Constraints for table `raw_data`
--
ALTER TABLE `raw_data`
  ADD CONSTRAINT `raw_data_ibfk_1` FOREIGN KEY (`cal_request_id`) REFERENCES `cal_requests` (`id`),
  ADD CONSTRAINT `raw_data_ibfk_2` FOREIGN KEY (`test_item_id`) REFERENCES `test_items` (`id`);

--
-- Constraints for table `test_items`
--
ALTER TABLE `test_items`
  ADD CONSTRAINT `test_items_ibfk_1` FOREIGN KEY (`test_type_id`) REFERENCES `test_types` (`id`);

--
-- Constraints for table `uncertainty_budget`
--
ALTER TABLE `uncertainty_budget`
  ADD CONSTRAINT `uncertainty_budget_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`),
  ADD CONSTRAINT `uncertainty_budget_ibfk_2` FOREIGN KEY (`test_item_id`) REFERENCES `test_items` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2020 at 07:17 AM
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
  `supervisor` varchar(20) NOT NULL,
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
('001/CAB', 'TENSILE MACHINE', 'AUTOGRAPH', 'AG5000 E', '30096828', 0, '2018-07-31', '2019-07-31', 1, 'AKHIRUL AKBAR', '2000-05-04', 6, '', '', '', 'test.jpg'),
('001/CAL', 'TES UNIT', 'F & G', 'PM-2', '200759', 0, '2019-09-10', '2020-09-10', 1, 'SENTOT HERY', '2000-01-01', 6, 'INTERNAL', '', '', 'test.jpg'),
('002/CAL', 'POWER METER', 'HP', '436 A', '2347A16880', 1, '2013-04-05', '2014-04-05', 1, 'SENTOT HERY', '2000-01-02', 6, 'INTERNAL', '', '', 'test.jpg'),
('003/CAB', 'HIGH RESISTANCE METER', 'HP', '4329A', '1836 J 04161', 0, '2018-01-08', '2020-01-08', 2, 'AKHIRUL AKBAR', '2000-05-05', 6, '', '', '', 'test.jpg'),
('003/CAL', 'POWER METER', 'HP', '436 A', '2236A12973', 0, '2019-01-29', '2020-01-29', 1, 'SENTOT HERY', '2000-01-03', 6, 'INTERNAL', '', '', 'test.jpg'),
('003/CPE', 'TELEPHONE SET TESTER', 'HE ', '212', '264', 0, '2016-07-11', '2019-07-11', 3, 'NUR\'AIN, ELIANDRI', '2000-12-15', 6, 'INTERNAL', '', '', 'test.jpg'),
('003/TRA', 'SPECTRUM ANALYZER', 'HP', '8592B', '3107A00959', 0, '2016-12-26', '2018-12-26', 2, 'RIZKI, ARWIN & NOMAR', '2000-08-09', 6, '', '', '', 'test.jpg'),
('004/CAB', 'ECHO METER', 'KARL DEUTSH', '1070', '22307', 0, '2018-08-21', '2019-08-21', 1, 'AKHIRUL AKBAR', '2000-05-06', 6, '', '', '', 'test.jpg'),
('004/CPE', 'DTMF GENERATOR', 'HE ', '305', ' 305001-01', 0, '2016-07-12', '2019-07-12', 3, 'NUR\'AIN, ELIANDRI', '2000-12-16', 6, 'INTERNAL', '', '', 'test.jpg'),
('004/ENE', 'CYCLE  LIFE BATT TESTER', 'BITRODE', 'LCN-300-12', '95078', 0, '2019-10-18', '2020-10-18', 1, 'SLAMET, EDI, ASEP H.', '2001-01-15', 6, '', '', '', 'test.jpg'),
('004/TRA', 'POWER METER', 'HP', '436A', '1917A04944', 0, '2018-08-24', '2020-08-24', 2, 'RIZKI, ARWIN & NOMAR', '2000-08-10', 6, '', '', '', 'test.jpg'),
('005/ENE', 'CYCLE  LIFE BATT TESTER', 'BITRODE', 'LCN-250-12', '91059', 0, '2019-10-18', '2020-10-18', 1, 'SLAMET, EDI, ASEP H.', '2001-01-16', 6, '', '', '', 'test.jpg'),
('005/TRA', 'OSCILLOSCOPE 500 Mhz', 'HP', '54503A', 'US34510263', 0, '2016-06-29', '2019-06-29', 3, 'RIZKI, ARWIN & NOMAR', '2000-08-11', 6, '', '', '', 'test.jpg'),
('006/CAL', 'RANGE CALIBRATOR', 'HP', '11683 A', '2236A02035', 0, '2019-07-12', '2021-07-12', 2, 'SENTOT HERY', '2000-01-04', 6, 'INTERNAL', '', '', 'test.jpg'),
('006/CPE', 'DATA LINE  ANALYZER', 'SIEMENS ', 'K1190', 'BF9407-592', 0, '2016-07-13', '2019-07-13', 3, 'NUR\'AIN, ELIANDRI', '2000-12-17', 6, 'INTERNAL', '', '', 'test.jpg'),
('006/ENE', 'PSOPHOMETER', 'NATIONAL', 'VP-9680A', '450581D125', 1, '2018-09-14', '2019-09-14', 1, 'SLAMET, EDI, ASEP H.', '2001-01-17', 6, '', '', '', 'test.jpg'),
('007/CPE', 'DC POWER SUPPLY', 'KENWOOD ', 'PR630', '2060038', 0, '2016-07-14', '2019-07-14', 3, 'NUR\'AIN, ELIANDRI', '2000-12-18', 6, 'INTERNAL', '', '', 'test.jpg'),
('007/ENE', 'DIGITALMULTIMETER', 'HP', '34401-A', '3146A57481', 0, '2018-07-11', '2019-07-11', 1, 'SLAMET, EDI, ASEP H.', '2001-01-18', 6, '', '', '', 'test.jpg'),
('007/TRA', 'SELECTIVE LEVEL MEASURING SET', 'WG', 'PSM-37', 'U - 0022', 0, '2018-10-23', '2019-10-23', 1, 'RIZKI, ARWIN & NOMAR', '2000-08-12', 6, '', '', '', 'test.jpg'),
('008/CAB', 'OSCILLATOR', 'ANDO', 'WBG-9', '50069', 0, '2017-10-25', '2019-10-25', 2, 'AKHIRUL AKBAR', '2000-05-07', 6, '', '', '', 'test.jpg'),
('008/ENE', 'DIGITALMULTIMETER', 'HP', '34401-A', '3146A60669', 0, '2018-07-11', '2019-07-11', 1, 'SLAMET, EDI, ASEP H.', '2001-01-19', 6, '', '', '', 'test.jpg'),
('009/CAL', 'COUNTER / POWER METER (500 MHz - 20 GHz)', 'HP', '5347 A', '3009A00995', 0, '2018-01-25', '2020-01-25', 2, 'SENTOT HERY', '2000-01-05', 6, 'INTERNAL', '', '', 'test.jpg'),
('009/CPE', 'TEST FEED COIL (10H)', 'HE ', '215', '167', 1, '2008-05-13', '2011-05-13', 3, 'NUR\'AIN, ELIANDRI', '2000-12-01', 6, 'INTERNAL', '', '', 'test.jpg'),
('009/ENE', 'DIGITALMULTIMETER', 'HP', '34401 A', '3146A76313', 0, '2018-07-11', '2019-07-11', 1, 'SLAMET, EDI, ASEP H.', '2001-01-20', 6, '', '', '', 'test.jpg'),
('009/TRA', 'POWER METER', 'ANRITSU', 'ML4803A', 'M-13163', 1, '2013-02-28', '2014-02-28', 1, 'RIZKI, ARWIN & NOMAR', '2000-08-13', 6, '', '', '', 'test.jpg'),
('010/CAL', 'SYNTHESIZER / LEVEL GEN.', 'HP', '3335 A', '1640A01067', 1, '2013-04-05', '2014-04-05', 1, 'SENTOT HERY', '2000-01-06', 6, 'INTERNAL', '', '', 'test.jpg'),
('010/CPE', 'POWER DECADE RESISTOR', 'TIME ELECTRONICS ', 'TIPE 1065', '1250K 0', 0, '2018-10-16', '2021-10-16', 3, 'NUR\'AIN, ELIANDRI', '2001-01-06', 6, 'INTERNAL', '', '', 'test.jpg'),
('010/ENE', 'MULTIMETER', 'FLUKE', '77', '3335996', 1, '2015-11-09', '2016-11-09', 1, 'SLAMET, EDI, ASEP H.', '2001-01-21', 6, '', '', '', 'test.jpg'),
('011/CAL', 'SYNTHESIZER / LEVEL GEN.', 'HP', '3335 A', '1640A02114', 0, '2018-08-06', '2020-08-06', 2, 'SENTOT HERY', '2000-01-07', 6, 'INTERNAL', '', '', 'test.jpg'),
('011/CPE', 'SYNTHESIZER LEVEL GENERATOR', 'HP', '3335A', '1640A02114', 0, '2017-10-26', '2020-10-26', 3, 'NUR\'AIN, ELIANDRI', '2001-01-04', 6, 'INTERNAL', '', '', 'test.jpg'),
('012/CAB', 'AC AMPERE METER', 'HB BRASIL', 'HB', '6', 0, '2015-10-09', '2017-10-09', 2, 'AKHIRUL AKBAR', '2000-05-08', 6, '', '', '', 'test.jpg'),
('012/CPE', 'BALANCING TRANSFORMER', 'SIEMENS', 'B22', 'EC101448  ', 0, '2017-10-25', '2020-10-25', 3, 'NUR\'AIN, ELIANDRI', '2000-12-31', 6, 'INTERNAL', '', '', 'test.jpg'),
('013/CAL', 'DECADE RESISTANCE BOX', 'YOKOGAWA', '279301', '54FT0301', 0, '2018-09-18', '2020-09-18', 2, 'SENTOT HERY', '2000-01-08', 6, 'INTERNAL', '', '', 'test.jpg'),
('013/CPE', 'BALANCING TRANSFORMER', 'SIEMENS', 'B22', 'EC101443', 0, '2017-10-25', '2020-10-25', 3, 'NUR\'AIN, ELIANDRI', '2001-01-01', 6, 'INTERNAL', '', '', 'test.jpg'),
('013/ENE', 'RESERVE CAPACITY TESTER', ' BITRODE', 'RCT/M-500-12', '92159', 1, '2015-04-27', '2018-04-27', 3, 'SLAMET, EDI, ASEP H.', '2001-01-22', 6, '', '', '', 'test.jpg'),
('014/CAB', 'SURGE VOLTAGE TESTER', 'HAEFELY', 'P6T', 'P6T-080723-20-8', 0, '2018-01-16', '2020-01-16', 2, 'AKHIRUL AKBAR', '2000-05-09', 6, '', '', '', 'test.jpg'),
('014/ENE', 'CURRENT SHUNT', '-', '300A/60mV', '-', 0, '2019-10-18', '2020-10-18', 1, 'SLAMET, EDI, ASEP H.', '2001-01-23', 6, '', '', '', 'test.jpg'),
('014/TRA', 'DC POWER SUPPLY', 'HP', '6024A', '3031A07371', 0, '2009-09-07', 'Initial', 0, 'RIZKI, ARWIN & NOMAR', '2000-08-14', 6, '', '', '', 'test.jpg'),
('015/CAB', 'ALAT TEMBUS (CONE PENETRATION TEST)', 'STANHOPE SET', 'KI10', '1710', 0, '2018-08-20', '2019-08-20', 1, 'AKHIRUL AKBAR', '2000-05-10', 6, '', '', '', 'test.jpg'),
('015/CPE', 'AUTOMATIC FAX/ MODEM TEST SYSTEM', 'CONSULTRONICS ', 'TCS-500', '94TCS50008 ', 0, '2015-12-03', '2019-12-03', 4, 'NUR\'AIN, ELIANDRI', '2000-12-24', 6, 'INTERNAL', '', '', 'test.jpg'),
('015/ENE', 'CURRENT SHUNT', '-', '300A/60mV', '-', 0, '2019-10-18', '2020-10-18', 1, 'SLAMET, EDI, ASEP H.', '2001-01-24', 6, '', '', '', 'test.jpg'),
('015/TRA', 'MW. FREQ. COUNTER', 'ANRITSU', 'MF 76A', 'M-10878', 0, '2018-10-23', '2021-10-23', 3, 'RIZKI, ARWIN & NOMAR', '2000-08-15', 6, '', '', '', 'test.jpg'),
('016/CAB', 'DC DIELECTRIC TEST SET ', 'BIDDLE', '220070', '16107', 0, '2019-08-22', '2020-08-22', 1, 'AKHIRUL AKBAR', '2000-05-11', 6, '', '', '', 'test.jpg'),
('016/ENE', 'CURRENT SHUNT', '-', '600A/60mV', '-', 0, '2019-10-18', '2020-10-18', 1, 'SLAMET, EDI, ASEP H.', '2001-01-25', 6, '', '', '', 'test.jpg'),
('017/ENE', 'STOP WATCH', 'CASIO', 'HS ? 300W', '-', 0, '2019-05-23', '2021-05-23', 2, 'SLAMET, EDI, ASEP H.', '2001-01-26', 6, '', '', '', 'test.jpg'),
('018/CAB', 'VISCOSITY METER', 'BROOKFIELD', 'RVF', '80119', 0, '2008-09-19', '2011-09-19', 3, 'AKHIRUL AKBAR', '2000-05-12', 6, '', '', '', 'test.jpg'),
('018/ENE', 'STOP WATCH', 'CASIO', 'HS ? 300  W', '-', 0, '2019-07-12', '2021-07-12', 2, 'SLAMET, EDI, ASEP H.', '2001-01-27', 6, '', '', '', 'test.jpg'),
('019/ENE', 'THERMOHYGRO METER', 'PALMA', 'ANALOG', '107512', 0, '2017-02-23', '2019-02-23', 2, 'SLAMET, EDI, ASEP H.', '2001-01-28', 6, '', '', '', 'test.jpg'),
('020/CAB', 'CARBON CONTENT BLACK TESTER', 'IZUSU SEISAKUSHO', '-', '3025/280', 0, '2018-03-21', '2019-03-21', 1, 'AKHIRUL AKBAR', '2000-05-13', 6, '', '', '', 'test.jpg'),
('020/ENE', 'THERMOHYGRO METER', 'PALMA', 'ANALOG', '107519', 0, '2017-02-23', '2019-02-23', 2, 'SLAMET, EDI, ASEP H.', '2001-01-29', 6, '', '', '', 'test.jpg'),
('021/CAB', 'PROFILE  PROJECTOR', 'MITUTOYO', 'PJ ? 300', '440177', 0, '2018-07-31', '2019-07-31', 1, 'AKHIRUL AKBAR', '2000-05-14', 6, '', '', '', 'test.jpg'),
('022/CAB', 'RCKE MEASURING SYSTEM', 'AESA', '9440', '3706', 1, '2010-10-11', '2012-10-11', 2, 'AKHIRUL AKBAR', '2000-05-15', 6, '', '', '', 'test.jpg'),
('022/ENE', 'ROD THERMOMETER ALKOHOL', 'MC', ' 0-50C', 'ENE/57', 0, '2018-03-14', '2020-03-14', 2, 'SLAMET, EDI, ASEP H.', '2001-01-30', 6, '', '', '', 'test.jpg'),
('023/CAB', 'SET OF 5 STANDARD AESA', 'AESA', '9001', '4007', 0, '2019-08-23', '2020-08-23', 1, 'AKHIRUL AKBAR', '2000-05-16', 6, '', '', '', 'test.jpg'),
('023/CAL', 'ATTENUATOR 600 OHM', 'HP', '4437 A', '1250J01182', 0, '2018-09-18', '2020-09-18', 2, 'SENTOT HERY', '2000-01-09', 6, 'INTERNAL', '', '', 'test.jpg'),
('023/CPE', 'NOISE GENERATOR', 'NOISE/COM', 'NC6101B', ' B854', 0, '2014-11-25', '2017-11-25', 3, 'NUR\'AIN, ELIANDRI', '2000-12-08', 6, 'INTERNAL', '', '', 'test.jpg'),
('023/ENE', 'ROD THERMOMETER ALKOHOL', 'MC', ' 0-50C', 'ENE/56-', 0, '2018-03-14', '2020-03-14', 2, 'SLAMET, EDI, ASEP H.', '2001-01-31', 6, '', '', '', 'test.jpg'),
('024/ENE', 'STEEL RULE', 'TAJIMA', '2 M', '2000 mm', 0, '2002-05-10', 'Initial', 0, 'SLAMET, EDI, ASEP H.', '2001-02-01', 6, '', '', '', 'test.jpg'),
('025/CAB', 'METERAN  20  METER', 'SILVER CUSTOM', '20 M', '025/CAB', 0, '2002-05-14', 'Initial', 0, 'AKHIRUL AKBAR', '2000-05-17', 6, '', '', '', 'test.jpg'),
('025/CPE', 'SIGNAL SEQUENCE RELAY', 'HE', '401', '61', 1, '2012-12-04', '2015-12-04', 3, 'NUR\'AIN, ELIANDRI', '2000-12-05', 6, 'INTERNAL', '', '', 'test.jpg'),
('025/ENE', 'STANDARD WEIGHT (3 bh) ', '-', '200,500.10', '025/ENE-', 0, '2002-05-08', 'Initial', 0, 'SLAMET, EDI, ASEP H.', '2001-02-02', 6, '', '', '', 'test.jpg'),
('026/CAB', 'MISTAR 1 METER  (STELL RULE)', 'KDS-10 ME', '1 M', '026/CAB', 0, '2001-05-28', 'Initial', 0, 'AKHIRUL AKBAR', '2000-05-18', 6, '', '', '', 'test.jpg'),
('026/CAL', 'STANDARD AIR CAPACITOR', 'HP', '16380 C', '2519J00513', 0, '2019-07-05', '2021-07-05', 2, 'SENTOT HERY', '2000-01-10', 6, 'INTERNAL', '', '', 'test.jpg'),
('026/ENE', 'POWER HARMONIC  ANALYZER', 'FLUKE', '41B', '6547004', 0, '2019-10-18', '2020-10-18', 1, 'SLAMET, EDI, ASEP H.', '2001-02-03', 6, '', '', '', 'test.jpg'),
('026/TRA', 'PDH/SDH/ATM TEST SET.', 'HP', '377IC', 'GB00000279', 0, '2017-07-06', '2019-07-06', 2, 'RIZKI, ARWIN & NOMAR', '2000-08-16', 6, '', '', '', 'test.jpg'),
('027/CAB', 'TIMBANGAN ELEKTRONIK  PAN TUNGGAL', 'SATORIUS', 'BP210 S', '50808685', 1, '2013-11-27', '2015-11-27', 2, 'AKHIRUL AKBAR', '2000-05-19', 6, '', '', '', 'test.jpg'),
('027/CAL', 'STANDARD AIR CAPACITOR', 'HP', '16380 A', '-', 0, '2019-11-20', '2021-11-20', 2, 'SENTOT HERY', '2000-01-11', 6, 'INTERNAL', '', '', 'test.jpg'),
('027/CPE', 'SPECTRUM ANALYZER', 'ANRITSU', 'MS-611A', 'M56679', 0, '2015-12-03', '2018-12-03', 3, 'NUR\'AIN, ELIANDRI', '2000-12-13', 6, 'INTERNAL', '', '', 'test.jpg'),
('027/ENE', 'POWER HARMONIC ANALYZER', 'FLUKE', '41B', '6547007', 0, '2019-01-09', '2020-01-09', 1, 'SLAMET, EDI, ASEP H.', '2001-02-04', 6, '', '', '', 'test.jpg'),
('029/TRA', 'PCM CHANNEL ANALYZER', 'ANRITSU', ' MS371A', ' M 89358', 0, '2015-02-10', 'Initial', 0, 'RIZKI, ARWIN & NOMAR', '2000-08-17', 6, '', '', '', 'test.jpg'),
('030/CPE', 'DATA LINE ANALYZER', 'SIEMENS', ' K1190', 'BF9301-172', 1, '2010-03-26', '2013-03-26', 3, 'NUR\'AIN, ELIANDRI', '2000-12-02', 6, 'INTERNAL', '', '', 'test.jpg'),
('030/ENE', 'AC/DC HIGH POT TEST', 'BIDDLE', 'AVTM 23-4J', '20290', 0, '2018-09-17', '2021-09-17', 3, 'SLAMET, EDI, ASEP H.', '2001-02-05', 6, '', '', '', 'test.jpg'),
('031/CAB', 'INSULATING & ARRESTER TESTER', 'OBO BETTERMAN', 'ISOLAB', 'VB6 (031/CAB)', 0, '2014-09-18', '2019-09-18', 5, 'AKHIRUL AKBAR', '2000-05-20', 6, '', '', '', 'test.jpg'),
('031/CPE', 'DECADE ATTENUATOR ', '-', 'ANDO', 'AL-255', 0, '2017-10-25', '2020-10-25', 3, 'NUR\'AIN, ELIANDRI', '2001-01-02', 6, 'INTERNAL', '', '', 'test.jpg'),
('031/TRA', 'TRUE RMS MULTIMETER', 'FLUKE', '87', '65940593', 0, '2018-08-02', '2020-08-02', 2, 'RIZKI, ARWIN & NOMAR', '2000-08-18', 6, '', '', '', 'test.jpg'),
('032/TRA ', 'TRUE RMS MULTIMETER ', 'FLUKE', '87', '77150791', 0, '2018-10-23', '2020-10-23', 2, 'RIZKI, ARWIN & NOMAR', '2000-08-19', 6, '', '', '', 'test.jpg'),
('033/CAB', 'OVEN', 'WTB BINDER', '1.51E+13', '940062', 1, '2012-06-18', '2013-06-18', 1, 'AKHIRUL AKBAR', '2000-05-21', 6, '', '', '', 'test.jpg'),
('034/CAL', 'DIRECTIONAL COUPLER', 'HP', '11691 D', '1212A02334', 0, '2019-04-23', '2021-04-23', 2, 'SENTOT HERY', '2000-01-12', 6, 'INTERNAL', '', '', 'test.jpg'),
('034/CPE', 'OSCILLOSCOPE', 'HP', '54520A', 'US35480219', 0, '2017-10-25', '2018-10-25', 1, 'NUR\'AIN, ELIANDRI', '2000-12-11', 6, 'INTERNAL', '', '', 'test.jpg'),
('035/CAB', 'VERNIER CALIPER (0-300 mm)', 'MITUTOYO', '0-300 mm', '035/CAB', 1, '2009-07-17', '2012-07-17', 3, 'AKHIRUL AKBAR', '2000-05-22', 6, '', '', '', 'test.jpg'),
('035/CPE', 'DEDADE RESISTOR', 'SIEMENS', 'B2086', '-', 0, '2017-10-18', '2020-10-18', 3, 'NUR\'AIN, ELIANDRI', '2000-12-30', 6, 'INTERNAL', '', '', 'test.jpg'),
('036/CAB', 'DIGIMATIC CALIPER', 'MITUTOYO', '573-142-10', '333', 0, '2018-04-10', '2020-04-10', 2, 'AKHIRUL AKBAR', '2000-05-23', 6, '', '', '', 'test.jpg'),
('036/CPE', '12/16 Khz PAYPHONE TESTER', 'HE ', '306', ' 306002-01', 0, '2016-07-14', '2019-07-14', 3, 'NUR\'AIN, ELIANDRI', '2000-12-19', 6, 'INTERNAL', '', '', 'test.jpg'),
('037/CAB', 'CLIMATIC CHAMBER ( OVEN )', 'HERAEUS VOTSCH', 'HC-4030', '43468', 0, '2016-10-07', '2019-10-07', 3, 'AKHIRUL AKBAR', '2000-05-24', 6, '', '', '', 'test.jpg'),
('037/CAL', 'AC/DC CURRENT PROBE', 'FLUKE', 'Y 8100', '2672160', 0, '2019-07-12', '2022-07-12', 3, 'SENTOT HERY', '2000-01-13', 6, 'INTERNAL', '', '', 'test.jpg'),
('037/ENE', 'PHD ANALYZER', 'ESTERLINE', 'PhD-2', '8FMVQC1004', 0, '2018-08-15', '2020-08-15', 2, 'SLAMET, EDI, ASEP H.', '2001-02-06', 6, '', '', '', 'test.jpg'),
('037/TRA', 'INTERCEPTOR', 'TTC', '1402', '13312', 1, '2012-01-05', '2013-01-05', 1, 'RIZKI, ARWIN & NOMAR', '2000-08-20', 6, '', '', '', 'test.jpg'),
('038/CAB', 'DIGIMATIC CALIPER', 'MITUTOYO', '500-151', '59319', 1, '2015-02-23', '2016-02-23', 1, 'AKHIRUL AKBAR', '2000-05-25', 6, '', '', '', 'test.jpg'),
('038/CAL', 'AUDIO ANALYZER', 'HP', '8903 B', '2818A04574', 0, '2017-10-13', '2019-10-13', 2, 'SENTOT HERY', '2000-01-14', 6, 'INTERNAL', '', '', 'test.jpg'),
('038/ENE', 'PSOPHOMETER', 'NATIONAL', 'VP-9680A20', '5D0633D125', 0, '2018-09-18', '2019-09-18', 1, 'SLAMET, EDI, ASEP H.', '2001-02-07', 6, '', '', '', 'test.jpg'),
('038/TRA', 'TRANSMISION MEAS. SET', 'SIEMENS', 'K2014', 'A-46749-218338', 0, '2015-08-19', '2018-08-19', 3, 'RIZKI, ARWIN & NOMAR', '2000-08-21', 6, '', '', '', 'test.jpg'),
('039/CAB', 'DIGIMATIC MICROMETER', 'MITUTOYO', '331-511-30', '6035629', 0, '2016-02-17', '2019-02-17', 3, 'AKHIRUL AKBAR', '2000-05-26', 6, '', '', '', 'test.jpg'),
('039/CPE', 'EXCHANGE SIMULATOR', 'HE', 'TESTEL 510', '24', 0, '2015-12-01', '2018-12-01', 3, 'NUR\'AIN, ELIANDRI', '2000-12-12', 6, 'INTERNAL', '', '', 'test.jpg'),
('039/ENE', 'CURRENT SHUNT', '-', '600A/60 mV', '039/ENE', 0, '2018-10-16', '2019-10-16', 1, 'SLAMET, EDI, ASEP H.', '2001-02-08', 6, '', '', '', 'test.jpg'),
('040/CAB', 'DIGIMATIC MICROMETER', 'MITUTOYO', '395-541-30', '5176337', 1, '2011-12-19', '2012-12-19', 1, 'AKHIRUL AKBAR', '2000-05-27', 6, '', '', '', 'test.jpg'),
('040/ENE', 'SYRING HYDROMETER', '-', '1,100 S.D. 1,300', '-', 0, '2008-08-21', '2010-08-21', 2, 'SLAMET, EDI, ASEP H.', '2001-02-09', 6, '', '', '', 'test.jpg'),
('041/CAB', 'DIAL THICKNESS', 'MITUTOYO', '7313', '445F51', 0, '2015-03-09', '2020-03-09', 5, 'AKHIRUL AKBAR', '2000-05-28', 6, '', '', '', 'test.jpg'),
('041/ENE', 'POWER HARMONIC ANALYZER', 'FLUKE', '41B', 'DM7620015', 0, '2019-10-18', '2020-10-18', 1, 'SLAMET, EDI, ASEP H.', '2001-02-10', 6, '', '', '', 'test.jpg'),
('042/CAB', 'TERMO HIGROMETER', 'PALMA', 'SATO', '107662', 0, '2018-03-15', '2020-03-15', 2, 'AKHIRUL AKBAR', '2000-05-29', 6, '', '', '', 'test.jpg'),
('042/ENE', 'AC CURRENT CLAMP', 'FLUKE', 'I 3000 s', 'N?106610XBS', 0, '2019-04-15', '2021-04-15', 2, 'SLAMET, EDI, ASEP H.', '2001-02-11', 6, '', '', '', 'test.jpg'),
('042/TRA', 'SPECTRUM ANALYZER', 'HP', '8590B', '3108A01381', 0, '2015-02-12', 'Initial', 0, 'RIZKI, ARWIN & NOMAR', '2000-08-22', 6, '', '', '', 'test.jpg'),
('043/CAB', 'ELECTRONIC BALANCE', 'SATORIUS', 'AC 211S / 210g', '50710490', 0, '2018-07-31', '2019-07-31', 1, 'AKHIRUL AKBAR', '2000-05-30', 6, '', '', '', 'test.jpg'),
('043/CAL', 'DECADE CAPACITOR', 'HP', '4440 B', '1224J04572', 0, '2019-04-23', '2021-04-23', 2, 'SENTOT HERY', '2000-01-15', 6, 'INTERNAL', '', '', 'test.jpg'),
('043/ENE', 'AC CURRENT CLAMP ', 'FLUKE ', 'I 3000 s', 'N?106603XBS', 0, '2019-04-15', '2021-04-15', 2, 'SLAMET, EDI, ASEP H.', '2001-02-12', 6, '', '', '', 'test.jpg'),
('044/CAB', 'DIAL THICKNESS GAUGE', 'MITUTOYO', '7305', '54F928', 0, '2018-04-09', '2020-04-09', 2, 'AKHIRUL AKBAR', '2000-05-31', 6, '', '', '', 'test.jpg'),
('044/CAL', 'LEVEL METER', 'ANRITSU', 'ML424B', 'M57339', 0, '2017-10-13', '2019-10-13', 2, 'SENTOT HERY', '2000-01-16', 6, 'INTERNAL', '', '', 'test.jpg'),
('044/CPE', 'TERMINATOR 600 OHM', '-', '600OHM', '-', 0, '2017-10-13', '2020-10-13', 3, 'NUR\'AIN, ELIANDRI', '2000-12-28', 6, 'INTERNAL', '', '', 'test.jpg'),
('044/ENE', 'AC CURRENT CLAMP', 'FLUKE', 'I 3000 s', 'N?129142XFS', 0, '2019-04-15', '2021-04-15', 2, 'SLAMET, EDI, ASEP H.', '2001-02-13', 6, '', '', '', 'test.jpg'),
('045/CAB', 'DIAL CALIPER GAUGE', 'MITUTOYO', '209-105', '045/CAB', 0, '2018-04-09', '2020-04-09', 2, 'AKHIRUL AKBAR', '2000-06-01', 6, '', '', '', 'test.jpg'),
('045/CAL', 'DECADE RESISTANCE BOX', 'YOKOGAWA', '2793 - 03', '26FT1066', 0, '2017-10-25', '2019-10-25', 2, 'SENTOT HERY', '2000-01-17', 6, 'INTERNAL', '', '', 'test.jpg'),
('045/CPE', 'POWER SUPPLY', 'SIGNAALI OY', 'TL 230A', '923215', 0, '2008-05-14', 'Initial', 0, 'NUR\'AIN, ELIANDRI', '2001-01-14', 6, 'INTERNAL', '', '', 'test.jpg'),
('045/ENE', 'CURRENT SHUNT', 'YOKOGAWA', '100 A / 50 mV', '60YA2904', 0, '2019-10-18', '2020-10-18', 1, 'SLAMET, EDI, ASEP H.', '2001-02-14', 6, '', '', '', 'test.jpg'),
('046/CAB', 'DIAL CALIPER GAUGE', 'MITUTOYO', '209-103', '046/CAB', 0, '2018-04-09', '2020-04-09', 2, 'AKHIRUL AKBAR', '2000-06-02', 6, '', '', '', 'test.jpg'),
('046/ENE', 'CURRENT SHUNT', 'YOKOGAWA', '100 A / 50 mV', '60YA2907', 0, '2019-10-18', '2020-10-18', 1, 'SLAMET, EDI, ASEP H.', '2001-02-15', 6, '', '', '', 'test.jpg'),
('047/CAB', 'TERMO HIGROMETER', 'HISAMATSU', 'TN-2500', '4097', 1, '2015-12-04', '2017-12-04', 2, 'AKHIRUL AKBAR', '2000-06-03', 6, '', '', '', 'test.jpg'),
('047/ENE', 'CURRENT SHUNT', 'YOKOGAWA', '50 A / 50 mV', '60YA2685', 0, '2019-01-08', '2020-01-08', 1, 'SLAMET, EDI, ASEP H.', '2001-02-16', 6, '', '', '', 'test.jpg'),
('048/CAL', 'DC REFFERENCE STANDARD', 'FLUKE', '731 B', '2575007', 0, '2019-04-23', '2021-04-23', 2, 'SENTOT HERY', '2000-01-18', 6, 'INTERNAL', '', '', 'test.jpg'),
('048/CPE', 'MULTIMETER', 'FLUKE', '87', '65940597', 0, '2017-10-13', '2018-10-13', 1, 'NUR\'AIN, ELIANDRI', '2000-12-10', 6, 'INTERNAL', '', '', 'test.jpg'),
('048/ENE', 'CURRENT SHUNT', 'YOKOGAWA', '50 A / 50 mV', '60YA2682', 0, '2019-01-08', '2020-01-08', 1, 'SLAMET, EDI, ASEP H.', '2001-02-17', 6, '', '', '', 'test.jpg'),
('049/TRA', 'THERMOHYGROGRAPH', 'HISAMATSU', 'TN 2500', '4558', 0, '2018-03-19', '2020-03-19', 2, 'RIZKI, ARWIN & NOMAR', '2000-08-23', 6, '', '', '', 'test.jpg'),
('050/ENE', 'THERMOHYGROGRAPH', 'HISAMATSU', 'TN - 2500', '7102', 0, '2018-03-21', '2020-03-21', 2, 'SLAMET, EDI, ASEP H.', '2001-02-18', 6, '', '', '', 'test.jpg'),
('051/CAB', 'INSULATION TESTER', 'MEGGER', 'BM-11', '50610140893', 1, '2016-03-21', '2018-03-21', 2, 'AKHIRUL AKBAR', '2000-06-04', 6, '', '', '', 'test.jpg'),
('051/ENE', 'DIGITAL EARTH TESTER', 'KYORITSU', '4105', '1239551', 0, '2018-10-16', '2019-10-16', 1, 'SLAMET, EDI, ASEP H.', '2001-02-19', 6, '', '', '', 'test.jpg'),
('052/ENE', 'DIGITAL EARTH TESTER', 'KYORITSU', '4105', '1204305', 0, '2018-10-16', '2019-10-16', 1, 'SLAMET, EDI, ASEP H.', '2001-02-20', 6, '', '', '', 'test.jpg'),
('052/TRA', 'POWER SENSOR', 'ANRITSU', 'MA-4701A', 'M-74957', 0, '2017-09-12', '2019-09-12', 2, 'RIZKI, ARWIN & NOMAR', '2000-08-24', 6, '', '', '', 'test.jpg'),
('053/CAB', 'INSULATION TESTER', 'MEGGER', 'BM-11', '6.7501E+11', 1, '2009-06-05', '2010-06-05', 1, 'AKHIRUL AKBAR', '2000-06-05', 6, '', '', '', 'test.jpg'),
('053/ENE', 'CURRENT SHUNT CLASS 0.2', 'YOKOGAWA 200A/ 50mV', '2215', '62YA3735', 0, '2017-10-25', '2019-10-25', 2, 'SLAMET, EDI, ASEP H.', '2001-02-21', 6, '', '', '', 'test.jpg'),
('053/TRA', 'POWER SENSOR', 'ANRITSU', 'MA-4703A', 'M-45555', 0, '2017-09-12', '2019-09-12', 2, 'RIZKI, ARWIN & NOMAR', '2000-08-25', 6, '', '', '', 'test.jpg'),
('054/CAB', 'TIMBANGAN GANTUNG 200 KG', 'CASTON', 'NC-200', '96100012', 0, '2016-03-10', '2019-03-10', 3, 'AKHIRUL AKBAR', '2000-06-06', 6, '', '', '', 'test.jpg'),
('054/ENE', 'CURRENT SHUNT CLASS 0.2', 'YOKOGAWA 200 A/ 50mV', '2215', '62YA3314', 0, '2018-10-16', '2019-10-16', 1, 'SLAMET, EDI, ASEP H.', '2001-02-22', 6, '', '', '', 'test.jpg'),
('054/TRA', 'POWER SENSOR', 'ANRITSU', 'MA-4704A', 'M-30855', 0, '2017-02-17', '2019-02-17', 2, 'RIZKI, ARWIN & NOMAR', '2000-08-26', 6, '', '', '', 'test.jpg'),
('055/CPE', 'TRUE RMS MULTIMETER', 'FLUKE', '8062A', '6532020', 0, '2019-04-11', '2020-04-11', 1, 'NUR\'AIN, ELIANDRI', '2000-12-26', 6, 'INTERNAL', '', '', 'test.jpg'),
('055/ENE', 'THERMOHYGROMETER', 'CENTER', '314', '21207782', 0, '2018-03-15', '2020-03-15', 2, 'SLAMET, EDI, ASEP H.', '2001-02-23', 6, '', '', '', 'test.jpg'),
('055/TRA', 'DECADE RESISTOR', 'QUAD TECH', ' 1433-16', '6442847', 0, '2018-10-16', '2019-10-16', 1, 'RIZKI, ARWIN & NOMAR', '2000-08-27', 6, '', '', '', 'test.jpg'),
('056/CAB', 'PRESSURE GAUGE 2,5 KG/CM2', 'EMPERO-', '0 to 2.5 KG/CM2', '056/CAB', 0, '2018-03-23', '2021-03-23', 3, 'AKHIRUL AKBAR', '2000-06-07', 6, '', '', '', 'test.jpg'),
('056/CPE', 'TRUE RMS MULTIMETER', 'FLUKE', '8062A', '6596050', 0, '2019-04-11', '2020-04-11', 1, 'NUR\'AIN, ELIANDRI', '2000-12-27', 6, 'INTERNAL', '', '', 'test.jpg'),
('056/ENE', 'INFRARED THERMOMETER', 'FLUKE', '63', '26672624402-0368', 0, '2018-08-15', '2020-08-15', 2, 'SLAMET, EDI, ASEP H.', '2001-02-24', 6, '', '', '', 'test.jpg'),
('056/TRA', 'RESISTANCE BOX ', 'CROPICO', 'RM6', '50318', 0, '2018-10-23', '2019-10-23', 1, 'RIZKI, ARWIN & NOMAR', '2000-08-28', 6, '', '', '', 'test.jpg'),
('057/CAB', 'PRESSURE GAUGE 350 ', 'REG KOIKE COLT', '0 to 350 PSI', '057/CAB', 0, '2018-03-20', '2021-03-20', 3, 'AKHIRUL AKBAR', '2000-06-08', 6, '', '', '', 'test.jpg'),
('057/CPE', 'TEST FEED COIL', 'HASSERIL', '215', '194', 0, '2017-10-25', '2020-10-25', 3, 'NUR\'AIN, ELIANDRI', '2001-01-03', 6, 'INTERNAL', '', '', 'test.jpg'),
('057/ENE', 'AC / DC CLAMP METER', 'FLUKE', '337', '97290229', 0, '2018-10-26', '2020-10-26', 2, 'SLAMET, EDI, ASEP H.', '2001-02-25', 6, '', '', '', 'test.jpg'),
('057/TRA', 'BALANCE TRANSFORMER', 'WG', 'PFU-4', 'F 0012', 0, '2014-12-11', '2017-12-11', 3, 'RIZKI, ARWIN & NOMAR', '2000-08-29', 6, '', '', '', 'test.jpg'),
('058/CAB', 'PRESSURE GAUGE 3500 PSI', 'COLT-', '0 to 3500 PSI', '058/CAB', 0, '2018-03-19', '2021-03-19', 3, 'AKHIRUL AKBAR', '2000-06-09', 6, '', '', '', 'test.jpg'),
('058/CPE', 'DECADE RESISTOR', 'QUADTECH', '14633-16', '7385802', 0, '2017-10-13', '2020-10-13', 3, 'NUR\'AIN, ELIANDRI', '2000-12-29', 6, 'INTERNAL', '', '', 'test.jpg'),
('058/ENE', 'AC / DC CLAMP METER', 'FLUKE', '337', '97290227', 0, '2018-10-26', '2020-10-26', 2, 'SLAMET, EDI, ASEP H.', '2001-02-26', 6, '', '', '', 'test.jpg'),
('059/CAB', 'STANDARD WEIGHT (8 BUAH)', 'VCI VERUST', '1129 ? 2296.6', '059/CAB', 0, '2012-07-20', 'Initial', 0, 'AKHIRUL AKBAR', '2000-06-10', 6, '', '', '', 'test.jpg'),
('059/CPE', 'PAYPHONE TESTER', 'HE', '306', '176', 1, '2013-09-13', '2017-09-13', 3, 'NUR\'AIN, ELIANDRI', '2000-12-07', 6, 'INTERNAL', '', '', 'test.jpg'),
('059/ENE', 'DIGITAL ANEMOMETER', 'KESTREL', '4000', '587359', 0, '2009-07-01', '2012-07-01', 3, 'SLAMET, EDI, ASEP H.', '2001-02-27', 6, '', '', '', 'test.jpg'),
('059/TRA', 'BALANCE TRANSFORMER', 'WG', 'PFU-4', 'F 0011', 0, '2018-08-03', '2021-08-03', 3, 'RIZKI, ARWIN & NOMAR', '2000-08-30', 6, '', '', '', 'test.jpg'),
('060/CPE', 'DC LOOP HOLDING', 'WG', 'OH-1', 'AX-6011', 0, '2018-09-18', '2019-09-18', 1, 'NUR\'AIN, ELIANDRI', '2000-12-21', 6, 'INTERNAL', '', '', 'test.jpg'),
('060/ENE', 'DIGITAL ANEMOMETER', 'KESTREL', '4000', '581650', 0, '2009-07-01', '2012-07-01', 3, 'SLAMET, EDI, ASEP H.', '2001-03-20', 6, '', '', '', 'test.jpg'),
('061/CAB', 'DIAL THERMOMETER', 'LOOSCO', '0 to 250 ?C', '061/CAB', 0, '2015-03-04', '2020-03-04', 5, 'AKHIRUL AKBAR', '2000-06-11', 6, '', '', '', 'test.jpg'),
('062/CAB', 'DIELECTRIC/ INSULATION TESTER', 'BASE', 'BHP-5200', '19718', 0, '2019-08-22', '2020-08-22', 1, 'AKHIRUL AKBAR', '2000-06-12', 6, '', '', '', 'test.jpg'),
('062/ENE', 'DIGITAL LIGHTMETER', 'TES', '1339R', '90208106', 0, '2009-06-04', '2012-06-04', 3, 'SLAMET, EDI, ASEP H.', '2001-03-21', 6, '', '', '', 'test.jpg'),
('063/CAB', 'OVEN (INCUBATOR)', 'HERAEUS', 'B6060', 'S1000339', 0, '2018-07-31', '2019-07-31', 1, 'AKHIRUL AKBAR', '2000-06-13', 6, '', '', '', 'test.jpg'),
('063/CPE', 'THERMO HYGROGRAPH', 'HISAMATSU MFG', 'TN-2500', '4686', 1, '2011-12-22', '2013-12-22', 2, 'NUR\'AIN, ELIANDRI', '2000-12-03', 6, 'EXTERNAL', '', '', 'test.jpg'),
('063/ENE', 'DIGITAL LIGHTMETER', 'TES', '1339R', '90208109', 0, '2009-06-04', '2012-06-04', 3, 'SLAMET, EDI, ASEP H.', '2001-03-22', 6, '', '', '', 'test.jpg'),
('063/TRA', 'COAXIAL RESISTOR', 'TERMALINE', '8085', '6146', 0, '2017-04-26', '2019-04-26', 2, 'RIZKI, ARWIN & NOMAR', '2000-08-31', 6, '', '', '', 'test.jpg'),
('064/CAB', 'SALT  SPRAY CHAMBER', 'HERAEUS', 'H5K 1000', '43467', 0, '2018-07-31', '2019-07-31', 1, 'AKHIRUL AKBAR', '2000-06-14', 6, '', '', '', 'test.jpg'),
('064/ENE', 'SOUND LEVEL METER', 'TES', '1357', '80511352', 0, '2018-12-17', '2019-12-17', 1, 'SLAMET, EDI, ASEP H.', '2001-03-23', 6, '', '', '', 'test.jpg'),
('064/TRA', 'DUAL DIRECT COUPLER', 'HP', '772D', '2839A00713', 0, '2018-08-27', '2021-08-27', 3, 'RIZKI, ARWIN & NOMAR', '2000-09-01', 6, '', '', '', 'test.jpg'),
('065/CPE', 'TEST  FEED COIL', 'HE', '215', '181', 1, '2015-08-19', '2018-08-19', 3, 'NUR\'AIN, ELIANDRI', '2000-12-09', 6, 'INTERNAL', '', '', 'test.jpg'),
('065/ENE', 'SURGE TEST SET', 'HAEFELY', 'PSURGE 8000', '156555', 0, '2018-10-26', '2020-10-26', 2, 'SLAMET, EDI, ASEP H.', '2001-03-24', 6, '', '', '', 'test.jpg'),
('065/TRA', 'DUAL DIRECT COUPLER ', 'HP', '778D', '13905', 0, '2017-07-06', '2020-07-06', 3, 'RIZKI, ARWIN & NOMAR', '2000-09-02', 6, '', '', '', 'test.jpg'),
('066/CAB', 'VIDEO FIBRE', 'YORK', 'S 200', '200-01-032', 0, '2013-12-17', '2018-12-17', 5, 'AKHIRUL AKBAR', '2000-06-15', 6, '', '', '', 'test.jpg'),
('066/CPE', 'DIGITAL INSULATION TESTER', 'YOKOGAWA', '2426A', '60SJ0134', 0, '2017-10-25', '2019-10-25', 2, 'NUR\'AIN, ELIANDRI', '2000-12-22', 6, 'INTERNAL', '', '', 'test.jpg'),
('066/TRA', 'DIRECTIONAL COUPLER', 'HP', '773D', '2839A00263', 0, '2018-10-16', '2019-10-16', 1, 'RIZKI, ARWIN & NOMAR', '2000-09-03', 6, '', '', '', 'test.jpg'),
('067/CAB', 'CHROMATIC DISPERTION', 'YORK', 'S 18', '18972944', 1, '2013-12-16', '2018-12-16', 5, 'AKHIRUL AKBAR', '2000-06-16', 6, '', '', '', 'test.jpg'),
('067/ENE', 'DIGITAL TACHOMETER', 'PROVA', 'RM-1501', '9080011', 0, '2009-06-10', '2012-06-10', 3, 'SLAMET, EDI, ASEP H.', '2001-03-25', 6, '', '', '', 'test.jpg'),
('067/TRA', '30 Db ATTENUATOR', 'HP', '30dB', '2702A06832', 0, '2017-04-26', '2019-04-26', 2, 'RIZKI, ARWIN & NOMAR', '2000-09-04', 6, '', '', '', 'test.jpg'),
('068/CAB', 'SPECTRAL  ATTENUATOR     ', 'YORK', 'S 25', '25-02-174', 1, '2013-12-18', '2018-12-18', 5, 'AKHIRUL AKBAR', '2000-06-17', 6, '', '', '', 'test.jpg'),
('068/CPE', 'HYGRO THERMOGRAPH', 'HISAMATSU', 'TN 2500', '5081', 1, '2014-04-02', '2016-04-02', 2, 'NUR\'AIN, ELIANDRI', '2000-12-06', 6, 'EXTERNAL', '', '', 'test.jpg'),
('068/ENE', 'DIGITAL TACHOMETER', 'PROVA', 'RM-1501', '9080014', 0, '2009-06-10', '2012-06-10', 3, 'SLAMET, EDI, ASEP H.', '2001-03-26', 6, '', '', '', 'test.jpg'),
('068/TRA', 'STEP ATTENUATOR 11 dB', 'HP', '8494B', '2812A19946', 0, '2017-04-25', '2019-04-25', 2, 'RIZKI, ARWIN & NOMAR', '2000-09-05', 6, '', '', '', 'test.jpg'),
('069/CAB', 'PORTABLE  WHEATSTONE BRIDGE', 'YOKOGAWA', '2755', '66VNO140', 0, '2019-08-22', '2022-08-22', 3, 'AKHIRUL AKBAR', '2000-06-18', 6, '', '', '', 'test.jpg'),
('069/CAL', 'TERMO-HIGROMETER', 'HISAMATSU', 'TN-2500', '4098', 0, '2018-03-14', '2020-03-14', 2, 'SENTOT HERY', '2000-01-19', 6, 'EXTERNAL', '', '', 'test.jpg'),
('069/ENE', 'DIGITAL PSHOPOMETER', 'APLAB', '1072', 'H00377E0409010', 0, '2018-08-03', '2021-08-03', 3, 'SLAMET, EDI, ASEP H.', '2001-03-27', 6, '', '', '', 'test.jpg'),
('069/TRA', 'STEP ATTENUATOR 70 dB', 'HP', '8495B ', '3308A17465', 0, '2017-07-06', '2020-07-06', 3, 'RIZKI, ARWIN & NOMAR', '2000-09-06', 6, '', '', '', 'test.jpg'),
('070/CAB', 'THERMAL SHOCK CHAMBER', 'HERAEUS', 'VMS 2/08/22/3', '7059168', 1, '2008-02-25', '2009-02-25', 1, 'AKHIRUL AKBAR', '2000-06-19', 6, '', '', '', 'test.jpg'),
('070/CAL', 'TERMO-HIGROMETER', 'PALMA', 'SATO', '107669', 0, '2018-03-15', '2020-03-15', 2, 'SENTOT HERY', '2000-01-20', 6, 'EXTERNAL', '', '', 'test.jpg'),
('070/CPE', 'SYNTHESIZED SIGNAL GENERATOR', 'ANRITSU', 'MG-3641 A', '6200293386', 1, '2013-04-23', '2014-04-23', 1, 'NUR\'AIN, ELIANDRI', '2000-12-04', 6, 'EXTERNAL', '', '', 'test.jpg'),
('070/ENE', 'DIGITAL MULTIMETER', 'AGILENT', 'U1251A', 'TW46360138', 0, '2018-09-18', '2019-09-18', 1, 'SLAMET, EDI, ASEP H.', '2001-03-28', 6, '', '', '', 'test.jpg'),
('070/TRA', 'POWER SENSOR', 'HP', '8481A', '2237A35408', 1, '2008-08-17', '2010-08-17', 2, 'RIZKI, ARWIN & NOMAR', '2000-09-07', 6, '', '', '', 'test.jpg'),
('071/CAL', 'TERMO-HIGROMETER', 'HISAMATSU', 'TN-2500', '4099', 0, '2018-03-13', '2020-03-13', 2, 'SENTOT HERY', '2000-01-21', 6, 'EXTERNAL', '', '', 'test.jpg'),
('071/CPE', 'TRUE RMS MULTIMETER', 'FLUKE', '189', '80860110', 0, '2017-10-25', '2019-10-25', 2, 'NUR\'AIN, ELIANDRI', '2000-12-23', 6, 'INTERNAL', '', '', 'test.jpg'),
('071/ENE', 'CURRENT TRANSFORMER', 'GAE', 'CT-150-20000/5A', '21/11/01.0869', 0, '-', '-', 0, 'SLAMET, EDI, ASEP H.', '2001-03-29', 6, '', '', '', 'test.jpg'),
('071/TRA', 'POWER SENSOR', 'HP', '8481A', '2702A82170', 0, '2018-04-05', '2020-04-05', 2, 'RIZKI, ARWIN & NOMAR', '2000-09-08', 6, '', '', '', 'test.jpg'),
('072/CPE', 'AUTOMATIC TEST SYSTEM', 'PSTN-21', 'GENESYS', '43', 0, '2018-01-29', '2021-01-29', 3, 'NUR\'AIN, ELIANDRI', '2001-01-05', 6, 'INTERNAL', '', '', 'test.jpg'),
('072/ENE', 'CURRENT TRANSFORMER', 'GAE', 'CT-150-20000/5A', '21/11/01.0885', 0, '-', '-', 0, 'SLAMET, EDI, ASEP H.', '2001-03-30', 6, '', '', '', 'test.jpg'),
('072/TRA', 'POWER SENSOR', 'HP', '8481B', '1801A01725', 0, '2018-04-05', '2020-04-05', 2, 'RIZKI, ARWIN & NOMAR', '2000-09-09', 6, '', '', '', 'test.jpg'),
('073/ENE', 'CURRENT TRANSFORMER', 'GAE', 'CT-150-20000/5A', '21/11/01.0876', 0, '-', '-', 0, 'SLAMET, EDI, ASEP H.', '2001-03-31', 6, '', '', '', 'test.jpg'),
('073/TRA', 'POWER SENSOR', 'HP', '8482H', '1545A00379', 0, '2017-02-16', '2019-02-16', 2, 'RIZKI, ARWIN & NOMAR', '2000-09-10', 6, '', '', '', 'test.jpg'),
('074/CAB', 'OTDR (Optic Time Domain Reflector)', 'PHOTON KINETICS', '6500', '6571702', 1, '2010-05-20', '2012-05-20', 2, 'AKHIRUL AKBAR', '2000-06-20', 6, '', '', '', 'test.jpg'),
('074/ENE', 'CURRENT TRANSFORMER', 'J&L', 'MFO-100', '-', 0, '-', '-', 0, 'SLAMET, EDI, ASEP H.', '2001-04-01', 6, '', '', '', 'test.jpg'),
('074/TRA', 'POWER SENSOR', 'HP', '8481B', '2702A06832', 0, '2018-04-05', '2020-04-05', 2, 'RIZKI, ARWIN & NOMAR', '2000-09-11', 6, '', '', '', 'test.jpg'),
('075/CAB', 'TDR (Time Division Reflector)', 'TEKTRONIK', 'TS.100 ', 'B.056208', 0, '2006-04-25', 'Initial', 0, 'AKHIRUL AKBAR', '2000-06-21', 6, '', '', '', 'test.jpg'),
('075/ENE', 'CURRENT TRANSFORMER', 'J&L', 'MFO-100', '-', 0, '-', '-', 0, 'SLAMET, EDI, ASEP H.', '2001-04-02', 6, '', '', '', 'test.jpg'),
('075/TRA', 'POWER FEEDING', '-', '-', '-', 0, '2015-06-25', '2017-06-25', 2, 'RIZKI, ARWIN & NOMAR', '2000-09-12', 6, '', '', '', 'test.jpg'),
('076/CAB', 'COMPUTER TENSILE SQUEEZEE  TESTER', 'HUNGTA', 'HT-8760', '1003', 0, '2018-08-14', '2020-08-14', 2, 'AKHIRUL AKBAR', '2000-06-22', 6, '', '', '', 'test.jpg'),
('076/CPE', 'SPIRENT', 'AB3-3050', 'ABACUS ', 'M03370010 ', 0, '-', '-', 0, 'NUR\'AIN, ELIANDRI', '2001-01-07', 6, 'EXTERNAL', '', '', 'test.jpg'),
('076/ENE', 'CURRENT TRANSFORMER', 'J&L', 'MFO-100', '-', 0, '-', '-', 0, 'SLAMET, EDI, ASEP H.', '2001-04-03', 6, '', '', '', 'test.jpg'),
('077/CAB', 'FIBRE CONTINOUS  FLEXING TESTER', 'HUNGTA', 'HT-8761', '1104', 0, '-', '-', 0, 'AKHIRUL AKBAR', '2000-06-23', 6, '', '', '', 'test.jpg'),
('077/CPE', 'EMC TEST CHAMBER', 'B01', 'LAPLACELL 600', '619', 0, '2018-12-12', '2019-12-12', 1, 'NUR\'AIN, ELIANDRI', '2000-12-25', 6, 'INTERNAL', '', '', 'test.jpg'),
('077/ENE', 'CURRENT PROBE', 'PROVA', '6802', '11160178', 0, '2015-12-04', '2016-12-04', 1, 'SLAMET, EDI, ASEP H.', '2001-04-04', 6, '', '', '', 'test.jpg'),
('078/CAB', 'FIBRE CONTINOUS IMPACT TESTER', 'HUNGTA', 'HT-8762', '1203', 0, '-', '-', 0, 'AKHIRUL AKBAR', '2000-06-24', 6, '', '', '', 'test.jpg'),
('078/CPE', 'RF AMPLIFIER 16HZ-2GHZ', 'RF1200', 'A1130-A', '1130', 0, '2005-06-06', '-', 0, 'NUR\'AIN, ELIANDRI', '2001-01-08', 6, 'EXTERNAL', '', '', 'test.jpg'),
('078/ENE', 'CURRENT PROBE', 'PROVA', '6802', '11160180', 0, '2015-12-04', '2016-12-04', 1, 'SLAMET, EDI, ASEP H.', '2001-04-05', 6, '', '', '', 'test.jpg'),
('079/CAB', 'AUTO FIBRE TORSION TESTER', 'HUNGTA', 'HT-8763', '1233', 0, '-', '-', 0, 'AKHIRUL AKBAR', '2000-06-25', 6, '', '', '', 'test.jpg'),
('079/CPE', 'RF SPECTRUM ANALIZER', 'SA3000', 'A3027-4', '3027', 0, '2005-06-06', '-', 0, 'NUR\'AIN, ELIANDRI', '2001-01-09', 6, 'EXTERNAL', '', '', 'test.jpg'),
('079/ENE', 'CURRENT PROBE', 'PROVA', '6802', '11160179', 0, '2015-12-04', '2016-12-04', 1, 'SLAMET, EDI, ASEP H.', '2001-04-06', 6, '', '', '', 'test.jpg'),
('080/CAB', 'DIGITAL MONOMETER (pressure gauge)', 'VDO', '3904.000.004', '53707', 1, '2013-02-25', '2015-02-25', 2, 'AKHIRUL AKBAR', '2000-06-26', 6, '', '', '', 'test.jpg'),
('080/CPE', 'RF POWER AMPLIFIER 30MHZ-1GHZ', 'RF1100', 'A1132-4', '1132', 0, '2005-06-06', '-', 0, 'NUR\'AIN, ELIANDRI', '2001-01-10', 6, 'EXTERNAL', '', '', 'test.jpg'),
('080/ENE', 'POWER HARMONICS ANALYZER ', 'PROVA', '6830', '96150552', 1, '2014-05-02', '2016-05-02', 2, 'SLAMET, EDI, ASEP H.', '2001-04-07', 6, '', '', '', 'test.jpg'),
('081/CAB', 'VIBRATION TESTING SYSTEM', 'B & K', '3391-086', '1767753', 0, '2017-03-15', '2022-03-15', 5, 'AKHIRUL AKBAR', '2000-06-27', 6, '', '', '', 'test.jpg'),
('081/CPE', 'SYNTHESISER 80MHZ-2GHZ', 'RF2000', 'A3113-4', '3113', 0, '2005-06-06', '-', 0, 'NUR\'AIN, ELIANDRI', '2001-01-11', 6, 'EXTERNAL', '', '', 'test.jpg'),
('081/ENE', 'CURRENT SHUNT (20A / 50mV)', 'YOKOGAWA', '2215', '61YA2248', 0, '2018-08-02', '2020-08-02', 2, 'SLAMET, EDI, ASEP H.', '2001-04-08', 6, '', '', '', 'test.jpg'),
('081/TRA', 'DC LOOP HOLD CIRCUIT', 'WG', 'GH ? 1', 'AU  - 0009', 0, '2017-04-27', '2020-04-27', 3, 'RIZKI, ARWIN & NOMAR', '2000-09-13', 6, '', '', '', 'test.jpg'),
('082/CPE', 'WIDE BAND AMPLIFIER', 'SA1020A', 'A5011-4', '5011', 0, '2005-06-06', '-', 0, 'NUR\'AIN, ELIANDRI', '2001-01-12', 6, 'EXTERNAL', '', '', 'test.jpg'),
('082/ENE', 'CURRENT SHUNT (20A / 50mV)', 'YOKOGAWA', '2215', '61YA2249', 0, '2018-08-15', '2020-08-15', 2, 'SLAMET, EDI, ASEP H.', '2001-04-09', 6, '', '', '', 'test.jpg'),
('082/TRA', 'DC LOOP HOLD CIRCUIT', 'WG', 'GH ? 1', 'AU ? 0010', 0, '2017-04-27', '2020-04-27', 3, 'RIZKI, ARWIN & NOMAR', '2000-09-14', 6, '', '', '', 'test.jpg'),
('083/CPE', 'IP PERFORMANCE ANALYZER', 'IXIA', 'Opticalxm2', '-', 0, '-', '-', 0, 'NUR\'AIN, ELIANDRI', '2001-01-13', 6, 'Verifikasi', '', '', 'test.jpg'),
('083/ENE', 'CURRENT SHUNT (30A / 50mV)', 'YOKOGAWA', '2215', '61YA2278', 0, '2019-01-08', '2021-01-08', 2, 'SLAMET, EDI, ASEP H.', '2001-04-10', 6, '', '', '', 'test.jpg'),
('083/TRA', 'FIX ATTENUATOR', 'HP', '11708A (30 dB)', '23007 06165', 0, '2017-07-05', '2020-07-05', 3, 'RIZKI, ARWIN & NOMAR', '2000-09-15', 6, '', '', '', 'test.jpg'),
('084/CAB', ' TRUE RMS MULTIMETER', 'FLUKE', '79 III', '76870983', 0, '2018-09-18', '2020-09-18', 2, 'AKHIRUL AKBAR', '2000-06-28', 6, '', '', '', 'test.jpg'),
('084/ENE', 'CURRENT SHUNT (30A / 50mV)', 'YOKOGAWA', '2215', '61YA2279', 0, '2018-08-15', '2020-08-15', 2, 'SLAMET, EDI, ASEP H.', '2001-04-11', 6, '', '', '', 'test.jpg'),
('084/TRA', 'FIX ATTENUATOR', 'HP', '10 Db', '21660.32634', 0, '2017-07-05', '2020-07-05', 3, 'RIZKI, ARWIN & NOMAR', '2000-09-16', 6, '', '', '', 'test.jpg'),
('085/CAB', 'TIMBANGAN 11 KG', 'UWE  GENIWEIQHER', 'GM ? 11 K', 'E06108', 0, '2016-08-30', '2019-08-30', 3, 'AKHIRUL AKBAR', '2000-06-29', 6, '', '', '', 'test.jpg'),
('085/CPE', 'DIGITAL SOUND LEVEL METER', 'SMART SENSOR', '30dB ~ 130 dB', '1100983', 0, '2018-05-25', '2019-05-25', 1, 'NUR\'AIN, ELIANDRI', '2000-12-14', 6, 'EXTERNAL', '', '', 'test.jpg'),
('085/ENE', 'CURRENT SHUNT (50A / 50mV)', 'YOKOGAWA', '2215', '61YA2215', 0, '2019-01-08', '2021-01-08', 2, 'SLAMET, EDI, ASEP H.', '2001-04-12', 6, '', '', '', 'test.jpg'),
('085/TRA', 'FIX ATTENUATOR', 'HP', '8491 B (6 Db)', '2708 A 20132', 0, '2017-07-05', '2020-07-05', 3, 'RIZKI, ARWIN & NOMAR', '2000-09-17', 6, '', '', '', 'test.jpg'),
('086/CAL', 'STANDARD RESISTOR', 'SIEMEN', '0.001 ?', '1600726', 0, '2019-07-12', '2021-07-12', 2, 'SENTOT HERY', '2000-01-22', 6, 'INTERNAL', '', '', 'test.jpg'),
('086/CPE', 'THERMO HYGROMETER', 'ANYMETRE', 'TH101B', 'ZL201020507767.0', 0, '2018-08-02', '2019-08-02', 1, 'NUR\'AIN, ELIANDRI', '2000-12-20', 6, 'EXTERNAL', '', '', 'test.jpg'),
('086/ENE', 'CURRENT SHUNT (50A / 50mV)', 'YOKOGAWA', '2215', '61YA2216', 0, '2019-01-08', '2021-01-08', 2, 'SLAMET, EDI, ASEP H.', '2001-04-13', 6, '', '', '', 'test.jpg'),
('086/TRA', 'FIX ATTENUATOR', 'HP', '8491 B (3 DB)', '18507', 0, '2017-07-05', '2020-07-05', 3, 'RIZKI, ARWIN & NOMAR', '2000-09-18', 6, '', '', '', 'test.jpg'),
('087/CAL', 'STANDARD RESISTOR', 'SIEMEN', '1 000  ?', '19007', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-01-23', 6, 'INTERNAL', '', '', 'test.jpg'),
('087/ENE', 'CURRENT SHUNT (75A / 50mV)', 'YOKOGAWA', '2215', '61YA1669', 0, '2019-01-08', '2021-01-08', 2, 'SLAMET, EDI, ASEP H.', '2001-04-14', 6, '', '', '', 'test.jpg'),
('088/ENE', 'CURRENT SHUNT (75A / 50mV)', 'YOKOGAWA', '2215', '61YA1668', 0, '2019-01-08', '2021-01-08', 2, 'SLAMET, EDI, ASEP H.', '2001-04-15', 6, '', '', '', 'test.jpg'),
('089/CAB', 'TERMOMETER GELAS', 'GOLD BRAND', '0 ? 150 ?C', '-4-', 0, '2018-03-14', '2020-03-14', 2, 'AKHIRUL AKBAR', '2000-06-30', 6, '', '', '', 'test.jpg'),
('089/CAL', 'STANDARD RESISTOR', 'SIEMEN', '10 000  ?', '19005', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-01-24', 6, 'INTERNAL', '', '', 'test.jpg'),
('089/ENE', 'LASER DISTANCE METER', 'EXTECH', 'DT300', '131111174', 0, '-', '-', 0, 'SLAMET, EDI, ASEP H.', '2001-04-16', 6, '', '', '', 'test.jpg'),
('090/CAL', 'STANDARD RESISTOR', 'SIEMEN', '0.1  ?', '1600674', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-01-25', 6, 'INTERNAL', '', '', 'test.jpg'),
('090/ENE', 'DIGITAL CALIPER (300 mm x 12 \"/0.01 mm)', 'KRISBOW', 'KW06-423', '-', 0, '2018-08-02', '2020-08-02', 2, 'SLAMET, EDI, ASEP H.', '2001-04-17', 6, '', '', '', 'test.jpg'),
('090/TRA', '50 OHM TERMINATION', 'SUHNER', '6 WATT', '6506.17 A', 0, '2014-10-07', '2019-10-07', 5, 'RIZKI, ARWIN & NOMAR', '2000-09-19', 6, '', '', '', 'test.jpg'),
('091/CAL', 'STANDARD RESISTOR', 'SIEMEN', '0.01  ?', '1600688', 0, '2019-01-17', '2021-01-17', 2, 'SENTOT HERY', '2000-01-26', 6, 'INTERNAL', '', '', 'test.jpg'),
('091/ENE', 'CURRENT TRANSFORMER', 'GAE', 'CT-110-1000/5A', '21/12/11.3727', 0, '-', '-', 0, 'SLAMET, EDI, ASEP H.', '2001-04-18', 6, '', '', '', 'test.jpg'),
('091/TRA', 'DIG. RADIO COMM TESTER', 'R & S', 'CMD80', '847141/008', 0, '2015-02-11', '2020-02-11', 5, 'RIZKI, ARWIN & NOMAR', '2000-09-20', 6, '', '', '', 'test.jpg'),
('092/CAB', 'STOP WATCH', 'NIKE', 'H2O Resistance', '-', 0, '2019-08-23', '2020-08-23', 1, 'AKHIRUL AKBAR', '2000-07-01', 6, '', '', '', 'test.jpg'),
('092/CAL', 'STANDARD RESISTOR', 'AEG', '10  ?', '7528', 0, '2019-04-22', '2021-04-22', 2, 'SENTOT HERY', '2000-01-27', 6, 'INTERNAL', '', '', 'test.jpg'),
('092/ENE', 'CURRENT TRANSFORMER', 'GAE', 'CT-110-1000/5A', '21/12/11.3728', 0, '-', '-', 0, 'SLAMET, EDI, ASEP H.', '2001-04-19', 6, '', '', '', 'test.jpg'),
('092/TRA', 'GSM MS. SERVICE TEST', 'HP', '8922S', '3639V00538', 0, '2017-10-18', '2019-10-18', 2, 'RIZKI, ARWIN & NOMAR', '2000-09-21', 6, '', '', '', 'test.jpg'),
('093/CAB', 'STOP WATCH', 'NIKE', 'H2O Resistance', '-', 0, '2019-08-23', '2020-08-23', 1, 'AKHIRUL AKBAR', '2000-07-02', 6, '', '', '', 'test.jpg'),
('093/CAL', 'STANDARD RESISTOR', 'AEG', '0.0001  ?', '7348', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-01-28', 6, 'INTERNAL', '', '', 'test.jpg'),
('093/ENE', 'CURRENT TRANSFORMER', 'GAE', 'CT-110-1000/5A', '21/12/11.3731', 0, '-', '-', 0, 'SLAMET, EDI, ASEP H.', '2001-04-20', 6, '', '', '', 'test.jpg'),
('093/TRA', 'DCS 1800 MS TEST SET', 'HP', '83220E', '3524V01563', 0, '2017-10-25', '2019-10-25', 2, 'RIZKI, ARWIN & NOMAR', '2000-09-22', 6, '', '', '', 'test.jpg'),
('094/CAB', 'MILI OHM METER', 'QUADTECH', '1880', '489818', 0, '2018-01-08', '2020-01-08', 2, 'AKHIRUL AKBAR', '2000-07-03', 6, '', '', '', 'test.jpg'),
('094/CAL', 'STANDARD RESISTOR', 'AEG', '1 000  ?', '7664', 0, '2018-12-20', '2020-12-20', 2, 'SENTOT HERY', '2000-01-29', 6, '#VALUE!', '', '', 'test.jpg'),
('094/ENE', 'CURRENT TRANSFORMER', 'GAE', 'CT-70-500/5A', '1.50413E+11', 0, '-', '-', 0, 'SLAMET, EDI, ASEP H.', '2001-04-21', 6, '', '', '', 'test.jpg'),
('094/TRA', 'SPECTRUM ANALYZER', 'HP', '8594E', '3710A04393', 0, '2015-02-13', 'Initial', 0, 'RIZKI, ARWIN & NOMAR', '2000-09-23', 6, '', '', '', 'test.jpg'),
('095/CAB', 'DIELECTRIC LOSS MEASURING SET', 'ANDO', 'TR-10C', '3910401', 0, '2015-05-04', '2018-05-04', 3, 'AKHIRUL AKBAR', '2000-07-04', 6, '', '', '', 'test.jpg'),
('095/CAL', 'STANDARD RESISTOR', 'AEG', '100  ?', '7518', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-01-30', 6, 'INTERNAL', '', '', 'test.jpg'),
('095/ENE', 'CURRENT TRANSFORMER', 'GAE', 'CT-70-500/5A', '1.50413E+11', 0, '-', '-', 0, 'SLAMET, EDI, ASEP H.', '2001-04-22', 6, '', '', '', 'test.jpg'),
('095/TRA', 'OPTICAL ATTENUATOR', 'HP', '8156A', '3328G03174', 0, '2017-10-16', '2019-10-16', 2, 'RIZKI, ARWIN & NOMAR', '2000-09-24', 6, '', '', '', 'test.jpg'),
('096/CAB', 'NULL DITECTOR', 'ANDO', 'BDA-9', '3910401', 0, '2015-07-06', '2018-07-06', 3, 'AKHIRUL AKBAR', '2000-07-05', 6, '', '', '', 'test.jpg'),
('096/CAL', 'STANDARD RESISTOR', 'AEG', '100 000  ?', '-', 0, '2019-01-17', '2021-01-17', 2, 'SENTOT HERY', '2000-01-31', 6, 'INTERNAL', '', '', 'test.jpg'),
('096/ENE', 'CURRENT TRANSFORMER', 'GAE', 'CT-70-500/5A', '1.50413E+11', 0, '-', '-', 0, 'SLAMET, EDI, ASEP H.', '2001-04-23', 6, '', '', '', 'test.jpg'),
('096/TRA', 'LIGHWAVE MULTI METER', 'HP', '81531A', '2946G07883', 0, '2017-10-16', '2019-10-16', 2, 'RIZKI, ARWIN & NOMAR', '2000-09-25', 6, '', '', '', 'test.jpg'),
('097/CAB', 'OSCILLATOR', 'ANDO', 'WBG-9', '3910401', 1, '2009-11-04', '2010-11-04', 1, 'AKHIRUL AKBAR', '2000-07-06', 6, '', '', '', 'test.jpg'),
('097/CAL', 'STANDARD RESISTOR', 'AEG', '10 000  ?', '7097', 0, '2019-01-17', '2021-01-17', 2, 'SENTOT HERY', '2000-02-01', 6, 'INTERNAL', '', '', 'test.jpg'),
('097/ENE', 'DIGITAL WEIGT MEASUREMENT', 'KENKO', 'KK-SW', '8812', 0, '2018-03-21', '2020-03-21', 2, 'SLAMET, EDI, ASEP H.', '2001-04-24', 6, '', '', '', 'test.jpg'),
('097/TRA', 'RADIO COMM. ANALYZER', 'ANRITSU', 'MT 88011 B', 'MT56567', 0, '2019-01-29', '2022-01-29', 3, 'RIZKI, ARWIN & NOMAR', '2000-09-26', 6, '', '', '', 'test.jpg'),
('098/CAB', 'THERMOSTATIC OVEN', 'ANDO', 'TO-19', '3910401', 0, '2016-02-26', '2021-02-26', 5, 'AKHIRUL AKBAR', '2000-07-07', 6, '', '', '', 'test.jpg'),
('098/CAL', 'STANDARD RESISTOR', 'AEG', '0.01  ?', '7172', 0, '2018-01-25', '2020-01-25', 2, 'SENTOT HERY', '2000-02-02', 6, 'INTERNAL', '', '', 'test.jpg'),
('098/ENE', 'DIGITAL WEIGT MEASUREMENT', 'KRISBOW', 'TCS-ZE11-300', '-', 0, '2018-03-21', '2020-03-21', 2, 'SLAMET, EDI, ASEP H.', '2001-04-25', 6, '', '', '', 'test.jpg'),
('099/CAB', 'POLARISATION MODE DIPERSION SYSTEM', 'PERKIN ELMER', 'NEXUS', '26801', 0, '2006-05-25', '2011-05-25', 5, 'AKHIRUL AKBAR', '2000-07-08', 6, '', '', '', 'test.jpg'),
('099/CAL', 'STANDARD RESISTOR', 'AEG', '10  ?', '7529', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-02-03', 6, 'INTERNAL', '', '', 'test.jpg'),
('099/ENE', 'TRUE RMS MULTIMETER ', 'FLUKE', '289', '38620076', 0, '2017-05-02', '2019-05-02', 1, 'SLAMET, EDI, ASEP H.', '2001-04-26', 6, '', '', '', 'test.jpg'),
('099/TRA', 'CHAMBER', 'ETAC', 'HS240', '129706037', 0, '2016-02-26', '2019-02-26', 3, 'RIZKI, ARWIN & NOMAR', '2000-09-27', 6, '', '', '', 'test.jpg'),
('100/CAB', 'MEGATEST 5000', 'AMPROBE', 'AMB-5KVD', '4061594', 0, '2017-10-25', '2019-10-25', 2, 'AKHIRUL AKBAR', '2000-07-09', 6, '', '', '', 'test.jpg'),
('100/CAL', 'STANDARD RESISTOR', 'AEG', '0.1  ?', '7810', 0, '2019-01-17', '2021-01-17', 2, 'SENTOT HERY', '2000-02-04', 6, 'INTERNAL', '', '', 'test.jpg'),
('100/ENE', 'PRECISION POWER SCOPE', 'YOKOGAWA', 'PX8000', '91V814050', 0, '2019-09-30', '2020-09-30', 1, 'SLAMET, EDI, ASEP H.', '2001-04-27', 6, '', '', '', 'test.jpg'),
('100/TRA', 'BALANCE MEAS ATTACHMENT. ', 'WG', 'SDZ-12', 'AR-0005', 0, '2018-10-16', '2021-10-16', 3, 'RIZKI, ARWIN & NOMAR', '2000-09-28', 6, '', '', '', 'test.jpg'),
('101/CAB', 'DIGIMATIC CALIPER', 'MITUTOYO', 'CD-12\"C / 0 ~ 300mm', '66203', 0, '2017-05-08', '2019-05-08', 2, 'AKHIRUL AKBAR', '2000-07-10', 6, '', '', '', 'test.jpg'),
('101/CAL', 'STANDARD RESISTOR', 'AEG', '100  ?', '7520', 0, '2019-01-18', '2021-01-18', 2, 'SENTOT HERY', '2000-02-05', 6, 'INTERNAL', '', '', 'test.jpg'),
('101/ENE', 'POWER QUALITY AND ENERGY ANALYZER', 'FLUKE', '435 SERIES II', '46903103', 0, '2019-10-31', '2021-10-31', 2, 'SLAMET, EDI, ASEP H.', '2001-04-28', 6, '', '', '', 'test.jpg'),
('101/TRA', 'BALANCE MEAS. ATTACHMENT ', 'WG', 'SMZ-120/75', 'BK-0075', 0, '2018-10-15', '2021-10-15', 3, 'RIZKI, ARWIN & NOMAR', '2000-09-29', 6, '', '', '', 'test.jpg'),
('102/CAB', 'OTDR & OPTICAL DWDM ANALIZER', 'ACTERNA', 'MTS 8000', '940', 0, '2017-10-26', '2022-10-26', 5, 'AKHIRUL AKBAR', '2000-07-11', 6, '', '', '', 'test.jpg'),
('102/CAL', 'STANDARD RESISTOR', 'AEG', '1  ?', '7691', 0, '2018-12-20', '2020-12-20', 2, 'SENTOT HERY', '2000-02-06', 6, 'INTERNAL', '', '', 'test.jpg'),
('102/ENE', 'BATTERY ANALYZER', 'FLUKE', 'BT521', '47080074WS', 0, '2019-11-01', '2021-11-01', 2, 'SLAMET, EDI, ASEP H.', '2001-04-29', 6, '', '', '', 'test.jpg'),
('102/TRA', 'IMPEDANCE MEAS. ATTACHMENT', 'WG', 'SFZ-1', 'BC-001', 0, '2018-12-08', '2019-12-08', 1, 'RIZKI, ARWIN & NOMAR', '2000-09-30', 6, '', '', '', 'test.jpg'),
('103/CAB', 'SOUND LEVEL METER', 'RION', 'NA-27', '10362601', 0, '-', '-', 0, 'AKHIRUL AKBAR', '2000-07-12', 6, '', '', '', 'test.jpg'),
('103/CAL', 'STANDARD RESISTOR', 'AEG', '1000  ?', '7662', 0, '2019-01-17', '2021-01-17', 2, 'SENTOT HERY', '2000-02-07', 6, 'INTERNAL', '', '', 'test.jpg'),
('103/TRA', 'ADVANCED NETWORK TESTER', 'W.W.G.', 'ANT-20', 'AU-0058', 1, '2011-01-27', '2013-01-27', 2, 'RIZKI, ARWIN & NOMAR', '2000-10-01', 6, '', '', '', 'test.jpg'),
('104/CAB', 'FUSION SPLICER', 'FITEL', 'S177A', '4406', 0, '-', '-', 0, 'AKHIRUL AKBAR', '2000-07-13', 6, '', '', '', 'test.jpg'),
('104/CAL', 'STANDARD RESISTOR', 'AEG', '0.1  ?', '7419', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-02-08', 6, 'INTERNAL', '', '', 'test.jpg'),
('104/TRA', 'DIGITAL COMMUNICATION ANALYZER', 'W.G', 'PFA-35', 'CL-0803', 1, '2006-12-18', '2007-12-18', 1, 'RIZKI, ARWIN & NOMAR', '2000-10-02', 6, '', '', '', 'test.jpg'),
('105/CAB', 'OPTICAL FIBER GEOMETRIC SYSTEM', 'PHOTO KINETICS', 'PK 240', '53172503', 0, '2013-12-19', '2018-12-19', 5, 'AKHIRUL AKBAR', '2000-07-14', 6, '', '', '', 'test.jpg'),
('105/CAL', 'STANDARD RESISTOR', 'AEG', '10 000  ?', '7099', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-02-09', 6, 'INTERNAL', '', '', 'test.jpg'),
('105/TRA', 'OPTICAL SPECTRUM ANALYZER.', 'ANRITSU', 'MS9710B', '6100043092', 0, '2016-07-14', '2021-07-14', 5, 'RIZKI, ARWIN & NOMAR', '2000-10-03', 6, '', '', '', 'test.jpg'),
('106/CAB', 'OPTICAL COATING GEOMETRY', 'PHOTO KINETICS', '2400', '53782388', 0, '2013-12-19', '2018-12-19', 5, 'AKHIRUL AKBAR', '2000-07-15', 6, '', '', '', 'test.jpg'),
('106/CAL', 'STANDARD RESISTOR', 'AEG', '1  ?', '7687', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-02-10', 6, 'INTERNAL', '', '', 'test.jpg'),
('106/TRA', 'DC POWER SUPPLY', 'ELTEK', 'SMPS 700 WALLBOX', '2111.34', 0, '2009-04-30', 'Initial', 0, 'RIZKI, ARWIN & NOMAR', '2000-10-04', 6, '', '', '', 'test.jpg'),
('107/CAB', 'MODULAR IMPULSE GENERATOR', 'CE', 'MIG-0612', '826', 0, '2018-01-29', '2021-01-29', 3, 'AKHIRUL AKBAR', '2000-07-16', 6, '', '', '', 'test.jpg'),
('107/CAL', 'STANDARD RESISTOR', 'AEG', '0.001  ?', '6895', 0, '2019-04-22', '2021-04-22', 2, 'SENTOT HERY', '2000-02-11', 6, 'INTERNAL', '', '', 'test.jpg'),
('107/TRA', 'DIGITALCOMMUNICATIONS ANALYZER', 'W.G', 'PFA-35', 'DB-0171', 1, '2008-12-23', '2010-12-23', 2, 'RIZKI, ARWIN & NOMAR', '2000-10-05', 6, '', '', '', 'test.jpg'),
('108/CAB', 'OTDR ', 'PHOTON KINETICS', '8000 / 86501-YO', '80000417', 0, '2018-07-18', '2020-07-18', 2, 'AKHIRUL AKBAR', '2000-07-17', 6, '', '', '', 'test.jpg'),
('108/CAL', 'LCR METER', 'HP', '4263B', 'JP1KD00894', 0, '2019-07-05', '2021-07-05', 2, 'SENTOT HERY', '2000-02-12', 6, 'INTERNAL', '', '', 'test.jpg'),
('108/TRA', 'CDMA BTS TEST SET', 'TEKTRONIK', 'YBT250/ YBA250', 'B042507 B011053', 0, '2017-04-06', '2018-04-06', 1, 'RIZKI, ARWIN & NOMAR', '2000-10-06', 6, '', '', '', 'test.jpg');
INSERT INTO `devices` (`id`, `name`, `manufacturer`, `model`, `serial_number`, `defect_status`, `calibration_date`, `due_date`, `calibration_period`, `supervisor`, `issue_date`, `test_interval`, `calibration_method`, `manual_file`, `spec_file`, `documentation`) VALUES
('109/CAB', 'OPTICAL LASER SOURCE', 'JDSU', 'OLS-55', 'M-0165', 0, '2014-07-07', '2019-07-07', 5, 'AKHIRUL AKBAR', '2000-07-18', 6, '', '', '', 'test.jpg'),
('109/CAL', '50 W TERMINATION', 'TETRONIX', '50 W 2 W', '011-0049-01', 0, '2019-07-15', '2021-07-15', 2, 'SENTOT HERY', '2000-02-13', 6, 'INTERNAL', '', '', 'test.jpg'),
('109/TRA', 'DWDM LASER  SOURSE', 'NET TEST', 'ECL-1600,  ECL-1560', '10-9881, 10-9611', 0, '2017-02-02', '2020-02-02', 3, 'RIZKI, ARWIN & NOMAR', '2000-10-07', 6, '', '', '', 'test.jpg'),
('110/CAB', 'SELECTIVE OPTICAL POWER METER', 'JDSU', 'OLP-57', 'P-0019', 0, '2014-07-07', '2019-07-07', 5, 'AKHIRUL AKBAR', '2000-07-19', 6, '', '', '', 'test.jpg'),
('110/CAL', 'STEP ATTENUATOR', 'HP', '8496 B', '1350A02875', 0, '2019-04-23', '2021-04-23', 2, 'SENTOT HERY', '2000-02-14', 6, 'INTERNAL', '', '', 'test.jpg'),
('110/TRA', 'SDH TRANMISSION ANALYZER', 'NET TEST', '5615-000-OTA, 5625-000-OTA', 'NP043400120, NP043300120', 0, '2017-04-05', '2019-04-05', 2, 'RIZKI, ARWIN & NOMAR', '2000-10-08', 6, '', '', '', 'test.jpg'),
('111/CAB', 'OTDR', 'JDSU', 'MTS-4000', '5416, 0-0042', 0, '2017-11-20', '2022-11-20', 5, 'AKHIRUL AKBAR', '2000-07-20', 6, '', '', '', 'test.jpg'),
('111/TRA', 'PERFORMANCE  ANALYSIS SYSTEM', 'SPIRERT', 'SmartBits 600B', 'N06011082', 0, '-', '-', 0, 'RIZKI, ARWIN & NOMAR', '2000-10-09', 6, '', '', '', 'test.jpg'),
('112/CAB', 'INSERTION LOSS / RETUR LOSS TEST STATION', 'JOINWIT', 'JW3307A', '11052019', 0, '2017-10-26', '2019-10-26', 2, 'AKHIRUL AKBAR', '2000-07-21', 6, '', '', '', 'test.jpg'),
('112/CAL', 'POWER SENSOR', 'HP', '8482 H', '1545A00991', 0, '2018-05-08', '2020-05-08', 2, 'SENTOT HERY', '2000-02-15', 6, 'EXTERNAL', '', '', 'test.jpg'),
('112/TRA', 'SPECTRUM ANALYZER', 'ADVANTEST', 'R3182', '150301800', 0, '2019-01-15', '2020-01-15', 1, 'RIZKI, ARWIN & NOMAR', '2000-10-10', 6, '', '', '', 'test.jpg'),
('113/CAB', 'OPTICAL TIME DOMAIN REFLECTOMETER (OTDR)', 'EXFO', 'FTB-200', '713161', 0, '2018-05-25', '2019-05-25', 1, 'AKHIRUL AKBAR', '2000-07-22', 6, '', '', '', 'test.jpg'),
('113/TRA', 'RF STEP ATTENUATOR', 'WEINSCHEL', '9012-70', '20943', 0, '2018-08-03', '2019-08-03', 1, 'RIZKI, ARWIN & NOMAR', '2000-10-11', 6, '', '', '', 'test.jpg'),
('114/CAB', 'OPTICAL TIME DOMAIN REFLECTOMETER (OTDR)', 'EXFO', 'FTB-200', '769498', 0, '2018-05-25', '2019-05-25', 1, 'AKHIRUL AKBAR', '2000-07-23', 6, '', '', '', 'test.jpg'),
('114/TRA', 'RF STEP ATTENUATOR', 'WEINSCHEL', '9015-9', '20066', 0, '2017-10-18', '2019-10-18', 2, 'RIZKI, ARWIN & NOMAR', '2000-10-12', 6, '', '', '', 'test.jpg'),
('115/CAB', 'ARC FUSION SPLICER', 'SWIFT', 'K-7', 'AA361509010924', 0, '-', '-', 0, 'AKHIRUL AKBAR', '2000-07-24', 6, '', '', '', 'test.jpg'),
('115/TRA', 'UNIVERSAL TEST SYSTEM', 'EXFO', 'FTB 400', '359969', 0, '2005-06-03', '2010-06-03', 5, 'RIZKI, ARWIN & NOMAR', '2000-10-13', 6, '', '', '', 'test.jpg'),
('116/CAB', 'PE FIBER OPTICS', '-', 'WS-500', '-', 0, '-', '-', 0, 'AKHIRUL AKBAR', '2000-07-25', 6, '', '', '', 'test.jpg'),
('116/TRA', 'VECTOR SIGNAL ANALIZER', 'AGILENT TECNOLOGIES', '89600S', 'US43490743', 0, '2006-05-11', '2010-05-11', 4, 'RIZKI, ARWIN & NOMAR', '2000-10-14', 6, '', '', '', 'test.jpg'),
('117/CAB', 'CLADDING DIAMETER STANDARD', 'NPL', '-', '-', 0, '2016-04-19', 'INITIAL', 0, 'AKHIRUL AKBAR', '2000-07-26', 6, '', '', '', 'test.jpg'),
('117/TRA', 'MODULAR OPTICAL TEST PLATFORM', 'JDSU', 'MTS 8000', '2163', 0, '2006-06-08', '2010-06-08', 4, 'RIZKI, ARWIN & NOMAR', '2000-10-15', 6, '', '', '', 'test.jpg'),
('118/CAB', 'CORNING (R) SINGLE MODE OPTICAL FIBER ITU-TG-652D', 'CORNING', '12867 METER', '1.00544E+11', 0, '2016-04-13', 'INITIAL', 0, 'AKHIRUL AKBAR', '2000-07-27', 6, '', '', '', 'test.jpg'),
('118/CAL', 'DUAL DIRECT. COUPLER', 'HP', '796 D', '7090', 0, '2019-04-23', '2021-04-23', 2, 'SENTOT HERY', '2000-02-16', 6, 'INTERNAL', '', '', 'test.jpg'),
('118/TRA', 'ADVANCED NETWORK TESTER ', 'JDSU', 'ANT-20 SE', 'GD-0001', 0, '2017-12-15', '2022-12-15', 5, 'RIZKI, ARWIN & NOMAR', '2000-10-16', 6, '', '', '', 'test.jpg'),
('119/CAB', 'CORNING (R) SINGLE MODE OPTICAL FIBER ITU-TG-652D', 'CORNING', '12864 METER', '1.00544E+11', 0, '2016-04-12', 'INITIAL', 0, 'AKHIRUL AKBAR', '2000-07-28', 6, '', '', '', 'test.jpg'),
('119/CAL', 'PREC. TERMIN DC 100 KHZ ', 'TETRONIX', '50 W', '011-0129-00', 0, '2017-04-26', '2019-04-26', 2, 'SENTOT HERY', '2000-02-17', 6, 'INTERNAL', '', '', 'test.jpg'),
('119/TRA', 'ADVANCED NETWORK TESTER', 'JDSU', 'ANT-10Gig', 'GD-0003', 0, '2017-08-30', '2022-08-30', 5, 'RIZKI, ARWIN & NOMAR', '2000-10-17', 6, '', '', '', 'test.jpg'),
('120/CAB', 'CORNING (R) SINGLE MODE OPTICAL FIBER ITU-TG-652D', 'CORNING', '12,6 KM', '1.00547E+11', 0, '2016-05-11', 'INITIAL', 0, 'AKHIRUL AKBAR', '2000-07-29', 6, '', '', '', 'test.jpg'),
('120/TRA', 'TRAFFIC GENERATOR/ PERFORMANCE ANALYSER', 'IXIA', '-', '-', 0, '-', '-', 0, 'RIZKI, ARWIN & NOMAR', '2000-10-18', 6, '', '', '', 'test.jpg'),
('121/CAB', 'OPTICAL FIBRE REFERENCE ', 'CORNING', '2,2 KM', '100537530456D', 0, '2016-05-12', 'INITIAL', 0, 'AKHIRUL AKBAR', '2000-07-30', 6, '', '', '', 'test.jpg'),
('121/CAL', 'MATCHED 75-50 W', 'TETRONIX', '75 W 50 W', '011-057', 0, '2017-04-26', '2019-04-26', 2, 'SENTOT HERY', '2000-02-18', 6, 'INTERNAL', '', '', 'test.jpg'),
('122/CAB', 'DIDITAL CALIPER ', 'TORA', '150mm', '13110131', 0, '2018-08-02', '2019-08-02', 1, 'AKHIRUL AKBAR', '2000-07-31', 6, '', '', '', 'test.jpg'),
('122/CAL', 'PREC. TERMIN DC 18 Ghz', 'SUHNER', '50 W', '6500.17.A', 0, '2018-09-18', '2020-09-18', 2, 'SENTOT HERY', '2000-02-19', 6, 'INTERNAL', '', '', 'test.jpg'),
('122/TRA', 'MICROWAVE SYNTHESIZER', 'GIGATRONIC', '2440 B, 01-40 GHz ', '0825001,  1838049', 0, '2018-11-21', '2020-11-21', 2, 'RIZKI, ARWIN & NOMAR', '2000-10-19', 6, '', '', '', 'test.jpg'),
('123/CAB', 'FUSION SPLICER', 'FITEL', 'S123M12', '10014', 0, '-', '-', 0, 'AKHIRUL AKBAR', '2000-08-01', 6, '', '', '', 'test.jpg'),
('123/TRA', 'UNIVERSAL POWER METER', 'GIGATRONIC', '8651 A', '8652353', 0, '2017-03-16', '2018-03-16', 1, 'RIZKI, ARWIN & NOMAR', '2000-10-20', 6, '', '', '', 'test.jpg'),
('124/CAB', 'FUSION SPLICER', 'FITEL', 'S178A VER.2', '33967', 0, '-', '-', 0, 'AKHIRUL AKBAR', '2000-08-02', 6, '', '', '', 'test.jpg'),
('124/TRA', 'OPTICAL DWDM ANALYZER', 'JDSU', 'OSA-320', 'O-0027', 0, '2014-04-08', '2019-04-08', 5, 'RIZKI, ARWIN & NOMAR', '2000-10-21', 6, '', '', '', 'test.jpg'),
('125/CAB', 'INSERTION LOSS / RETUR LOSS TEST STATION', 'STC', 'IRL-3201', '171221628', 0, '2018-11-23', '2020-11-23', 2, 'AKHIRUL AKBAR', '2000-08-03', 6, '', '', '', 'test.jpg'),
('125/CAL', 'FEED THR. TERM DC1.2 Ghz', 'SUHNER', '75 W', '-', 0, '2017-10-13', '2019-10-13', 2, 'SENTOT HERY', '2000-02-20', 6, 'INTERNAL', '', '', 'test.jpg'),
('125/TRA', 'OPTICAL RETURN LOSS METER', 'JDSU', 'ORL-55', 'F-0117', 0, '2014-04-25', '2019-04-25', 5, 'RIZKI, ARWIN & NOMAR', '2000-10-22', 6, '', '', '', 'test.jpg'),
('126/CAB', 'CLIMATIC CHAMBER ', 'WELLTECH', 'JHT-880R CA 8800L', '17-214', 0, '2017-10-29', '-', 0, 'AKHIRUL AKBAR', '2000-08-04', 6, '', '', '', 'test.jpg'),
('126/CAL', 'PULSE GENERATOR', 'HP', '8112A', '3205G11966', 0, '2017-04-17', '2019-04-17', 2, 'SENTOT HERY', '2000-02-21', 6, 'INTERNAL', '', '', 'test.jpg'),
('126/TRA', 'OPTICAL MM ATTENUATOR', 'JDSU', 'OLA-54', 'N-0204', 0, '2014-04-25', '2019-04-25', 5, 'RIZKI, ARWIN & NOMAR', '2000-10-23', 6, '', '', '', 'test.jpg'),
('127/CAB', 'SINGLE WIRE & CABLE VERTICAL FLAME TEST ', 'EQUIPMENT', 'BND-DXR', '17092301', 0, '2017-09-01', '-', 0, 'AKHIRUL AKBAR', '2000-08-05', 6, '', '', '', 'test.jpg'),
('127/CAL', 'CALIBRATION SYSTEM', 'WAVETEK', '9100', '32781', 0, '2018-04-25', '2020-04-25', 2, 'SENTOT HERY', '2000-02-22', 6, 'EXTERNAL', '', '', 'test.jpg'),
('127/TRA', 'OPTICAL SM ATTENUATOR', 'JDSU', 'OLA-55', 'N-0266', 0, '2014-04-16', '2019-04-16', 5, 'RIZKI, ARWIN & NOMAR', '2000-10-24', 6, '', '', '', 'test.jpg'),
('128/CAB', 'CABLE AND ANTENNA ANALYZER ', 'ROHDE & SCHWARZ', 'ZVH4', '1309.6800K24-102722-fB', 0, '2014-07-18', '-', 0, 'AKHIRUL AKBAR', '2000-08-06', 6, '', '', '', 'test.jpg'),
('128/CAL', 'STANDARD INDUCTOR', 'QUADTECH', '1482-B', '6422734', 0, '2019-11-20', '2021-11-20', 2, 'SENTOT HERY', '2000-02-23', 6, 'EXTERNAL', '', '', 'test.jpg'),
('128/TRA', 'SELECTIVE OPTICAL POWER METER', 'JDSU', 'OLP-57', 'P-0071', 0, '2014-04-25', '2019-04-25', 5, 'RIZKI, ARWIN & NOMAR', '2000-10-25', 6, '', '', '', 'test.jpg'),
('129/CAB', 'STRAIN POWER & LENGTH MEASUREMENT SYSTEM', 'PERKIN ELMER OPTOELECTRICS', 'SPL400', '-', 0, '2014-07-18', '-', 0, 'AKHIRUL AKBAR', '2000-08-07', 6, '', '', '', 'test.jpg'),
('129/CAL', 'STANDARD INDUCTOR', 'QUADTECH', '1482-E', '6422735', 0, '2019-07-12', '2021-07-12', 2, 'SENTOT HERY', '2000-02-24', 6, 'INTERNAL', '', '', 'test.jpg'),
('129/TRA', 'RF STEP ATTENUATOR (110 Db)', 'AGILENT', '8496 B', 'MY 42145653', 1, '2014-06-24', '2015-06-24', 1, 'RIZKI, ARWIN & NOMAR', '2000-10-26', 6, '', '', '', 'test.jpg'),
('130/CAB', 'OPTICAL INSERTION LOSS / RETURN LOSS TESTER', 'TRIBRER', 'GRL200', '5.0101E+12', 0, '-', '-', 0, 'AKHIRUL AKBAR', '2000-08-08', 6, '', '', '', 'test.jpg'),
('130/CAL', 'STANDARD INDUCTOR', 'QUADTECH', '1482-H', '6422736', 0, '2019-07-12', '2021-07-12', 2, 'SENTOT HERY', '2000-02-25', 6, 'INTERNAL', '', '', 'test.jpg'),
('130/TRA', 'RF STEP ATTENUATOR (11 Db)', 'AGILENT', '8494 B', 'MY 42149290', 0, '2018-01-16', '2019-01-16', 1, 'RIZKI, ARWIN & NOMAR', '2000-10-27', 6, '', '', '', 'test.jpg'),
('131/CAL', 'STANDARD INDUCTOR', 'QUADTECH', '1482-L', '6422737', 0, '2019-11-20', '2021-11-20', 2, 'SENTOT HERY', '2000-02-26', 6, 'EXTERNAL', '', '', 'test.jpg'),
('131/TRA', '40G, OTN & FIBER CHANNEL ANALYZER', 'JDSU', 'MTS-8000, 40G TRANSPORT MODULE', 'B-0068', 0, '2015-09-09', '2020-09-09', 5, 'RIZKI, ARWIN & NOMAR', '2000-10-28', 6, '', '', '', 'test.jpg'),
('132/CAL', 'STANDARD INDUCTOR', 'QUADTECH', '1482-P', '6422738', 0, '2019-11-20', '2021-11-20', 2, 'SENTOT HERY', '2000-02-27', 6, 'EXTERNAL', '', '', 'test.jpg'),
('132/TRA', 'VECTOR SIGNAL GENERATOR', 'LITEPOINT', 'ZT8651PXIe, ZT8751PXIe', '23914, 23998', 0, '2016-07-21', '2021-07-21', 5, 'RIZKI, ARWIN & NOMAR', '2000-10-29', 6, '', '', '', 'test.jpg'),
('133/CAL', 'STANDARD INDUCTOR', 'QUADTECH', '1482-T', '6422739', 0, '2019-07-12', '2021-07-12', 2, 'SENTOT HERY', '2000-02-28', 6, 'INTERNAL', '', '', 'test.jpg'),
('133/TRA', 'BER TEST (NETWORK MASTER FLEX)', 'ANRITSU', 'MT1100A, MU110001A, MU110011A ', '6201476992, 621478509, 6201464889', 0, '-', '-', 0, 'RIZKI, ARWIN & NOMAR', '2000-10-30', 6, '', '', '', 'test.jpg'),
('134/CAL', 'SCALAR NETWORK ANALYZER', 'HP', '8757 C', '3210A02391', 1, '2016-12-23', '2017-12-23', 1, 'SENTOT HERY', '2000-02-29', 6, 'INTERNAL', '', '', 'test.jpg'),
('134/TRA', 'SIGNAL & SPECTRUM ANALYSER', 'ROHDE & SCHWARTZ', 'FSW43', '103952', 0, '2019-01-29', '2022-01-29', 3, 'RIZKI, ARWIN & NOMAR', '2000-10-31', 6, '', '', '', 'test.jpg'),
('135/CAL', 'OSCILLOSCOPE 1 Ghz', 'HP', '54710 D', 'US35370102', 0, '2017-10-25', '2019-10-25', 2, 'SENTOT HERY', '2000-03-01', 6, 'INTERNAL', '', '', 'test.jpg'),
('135/TRA', 'SPECTRUM ANALYSER', 'RIGOL', 'DSA832E-TG', 'DSA8H194800240', 0, '2019-01-29', '2020-01-29', 1, 'RIZKI, ARWIN & NOMAR', '2000-11-01', 6, '', '', '', 'test.jpg'),
('136/CAL', 'MULTIMETER', 'HP', '3458 A', '2823A13780', 0, '2019-11-14', '2021-11-14', 2, 'SENTOT HERY', '2000-03-02', 6, 'EXTERNAL', '', '', 'test.jpg'),
('136/TRA', 'ESA-E SERIES SPECTRUM ANALYSER (9 kHz - 26,5 GHz)', 'AGILENT ', 'E4407B', 'MY44212591', 0, '-', '-', 2, 'RIZKI, ARWIN & NOMAR', '2000-11-02', 6, '', '', '', 'test.jpg'),
('137/CAL', 'FREQ. ERROR MEAS. SYSTEM', 'ODETICS', '345-200-01', '3450046-9718', 1, '2017-10-16', '2018-10-16', 1, 'SENTOT HERY', '2000-03-03', 6, 'INTERNAL', '', '', 'test.jpg'),
('137/TRA', 'TEMPERATURE ALARM', 'KRISBOW', 'KW06-797', '-', 0, '2018-11-22', '2020-11-22', 2, 'RIZKI, ARWIN & NOMAR', '2000-11-03', 6, '', '', '', 'test.jpg'),
('138/CAL', 'PRECISION LCR METER', 'QUAD-TECH', '7600', '7124266', 0, '2019-11-18', '2021-11-18', 2, 'SENTOT HERY', '2000-03-04', 6, 'EXTERNAL', '', '', 'test.jpg'),
('138/TRA', 'LASER WATER PAS', 'IKEA', '-', '-', 0, '-', '-', 0, 'RIZKI, ARWIN & NOMAR', '2000-11-04', 6, '', '', '', 'test.jpg'),
('139/CAL', 'CALIBRATION STANDARD', 'QUAD-TECH', '800064-69', '7204770', 0, '2019-07-08', '2021-07-08', 2, 'SENTOT HERY', '2000-03-05', 6, 'INTERNAL', '', '', 'test.jpg'),
('139/TRA', 'SPECTRUM ANALYZER (9 kHz - 6,5 GHz)', 'RIGOL', 'RSAC5065-T6', '28nf50-2', 0, '-', '-', 0, 'RIZKI, ARWIN & NOMAR', '2000-11-05', 6, '', '', '', 'test.jpg'),
('140/CAL', 'REFFERENCE DIVIDER', 'FLUKE', '752A', '6780202', 0, '2019-04-23', '2021-04-23', 2, 'SENTOT HERY', '2000-03-06', 6, 'INTERNAL', '', '', 'test.jpg'),
('140/TRA', 'ANALOG SIGNAL GENERATOR (250 kHz - 6 GHz)', 'AGILENT ', 'N5181A', 'MY50140391', 0, '-', '-', 0, 'RIZKI, ARWIN & NOMAR', '2000-11-06', 6, '', '', '', 'test.jpg'),
('141/CAL', 'AC/DC TRANSFER STANDARD', 'FLUKE', '792A', '6765001', 1, '2015-04-03', '2017-04-03', 2, 'SENTOT HERY', '2000-03-07', 6, 'INTERNAL', '', '', 'test.jpg'),
('141/TRA', 'RF POWER AMPLYFIER (80 MHz - 1 GHz)', 'FRANKONIA', 'FLH-200B1 REV.E', '1072/1905', 0, '-', '-', 0, 'RIZKI, ARWIN & NOMAR', '2000-11-07', 6, '', '', '', 'test.jpg'),
('142/CAL', 'DC VOLTAGE REFF STD.', 'WAVETEK', '4910', '33957', 0, '2019-04-23', '2021-04-23', 2, 'SENTOT HERY', '2000-03-08', 6, 'INTERNAL', '', '', 'test.jpg'),
('142/TRA', 'LINE IMPEDANCE STABILIZATION NETWORK (LISN)', 'COM-POWER CORP', 'LI-220A', '192047', 0, '2019-01-28', '2020-01-28', 0, 'RIZKI, ARWIN & NOMAR', '2000-11-08', 6, '', '', '', 'test.jpg'),
('143/CAL', 'SYNT/ FUNCTION GENERATOR', 'HP', '3325B', '2847A13258', 0, '2017-10-25', '2019-10-25', 2, 'SENTOT HERY', '2000-03-09', 6, 'INTERNAL', '', '', 'test.jpg'),
('143/TRA', 'ARTIFICIAL MAINS NETWORK', 'TEKBOX', 'TLBC 08', 'TLBC08-15556', 0, '-', '-', 0, 'RIZKI, ARWIN & NOMAR', '2000-11-09', 6, '', '', '', 'test.jpg'),
('144/CAL', 'UNIVERSAL TIME INTERVAL COUNTER', 'HP', '5370B', '2904A02827', 0, '2018-08-03', '2020-08-03', 2, 'SENTOT HERY', '2000-03-10', 6, 'INTERNAL', '', '', 'test.jpg'),
('144/TRA', 'CONDUCTED IMMUNITY TEST SYSTEM ', 'FRANKONIA', 'CIT-10', '19901997-0101', 0, '-', '-', 0, 'RIZKI, ARWIN & NOMAR', '2000-11-10', 6, '', '', '', 'test.jpg'),
('145/CAL', 'THERMO HIGROMETER', 'HISAMATSU', 'TN-2500', '4556', 0, '2018-03-22', '2020-03-22', 2, 'SENTOT HERY', '2000-03-11', 6, 'EXTERNAL', '', '', 'test.jpg'),
('145/TRA', 'FIELD STRENGTH METER', 'FRANKONIA', 'EFS-10', 'PFC180280803', 0, '-', '-', 0, 'RIZKI, ARWIN & NOMAR', '2000-11-11', 6, '', '', '', 'test.jpg'),
('146/CAL', 'SWEEP OSCILLATOR', 'HP', '8350 B', '3241A16772', 1, '2016-12-23', '2017-12-23', 1, 'SENTOT HERY', '2000-03-12', 6, 'INTERNAL', '', '', 'test.jpg'),
('146/TRA', 'ANTENNA EMC (30 MHz - 6 GHz) + TRIPOD + CABLE ', 'AARONIA', '-', '201746', 0, '-', '-', 0, 'RIZKI, ARWIN & NOMAR', '2000-11-12', 6, '', '', '', 'test.jpg'),
('147/TRA', 'VECTOR NETWORK ANALYZER (VNA) DC 6 GHz', 'ANRITSU', 'MS2036C', '1911038', 0, '-', '-', 0, 'RIZKI, ARWIN & NOMAR', '2000-11-13', 6, '', '', '', 'test.jpg'),
('148/CAL', 'CALIBRATION SYSTEM', 'WAVETEK', '9100', '40766', 0, '2019-11-19', '2021-11-19', 2, 'SENTOT HERY', '2000-03-13', 6, 'EXTERNAL', '', '', 'test.jpg'),
('148/TRA', 'SEMI ANECHOIC CHAMBER ', 'MEASUREMENT ENGINEERING', '-', '-', 0, '-', '-', 0, 'RIZKI, ARWIN & NOMAR', '2000-11-14', 6, '', '', '', 'test.jpg'),
('149/CAL', 'SIGNAL GENERATOR', 'HP', '8656 B', '333414996', 0, '2018-05-31', '2019-05-31', 1, 'SENTOT HERY', '2000-03-14', 6, 'EXTERNAL', '', '', 'test.jpg'),
('149/TRA', 'ANTENNA OMNILOG 70600', 'AARONIA AG', '70600', '18082', 0, '-', '-', 0, 'RIZKI, ARWIN & NOMAR', '2000-11-15', 6, '', '', '', 'test.jpg'),
('150/CAL', 'POWER SENSOR', 'HP', '8481H', '2237A06238', 0, '2018-04-05', '2020-04-05', 2, 'SENTOT HERY', '2000-03-15', 6, 'EXTERNAL', '', '', 'test.jpg'),
('150/TRA', 'DRG HORN ANTENNA ', 'AH SYSTEM, INC ', 'SAS-571', '756', 0, '-', '-', 0, 'RIZKI, ARWIN & NOMAR', '2000-11-16', 6, '', '', '', 'test.jpg'),
('151/CAL', 'POWER SENSOR', 'HP', '8481A', '2237A35799', 0, '2019-11-14', '2021-11-14', 2, 'SENTOT HERY', '2000-03-16', 6, 'EXTERNAL', '', '', 'test.jpg'),
('151/TRA', 'HORN ANTENNA', 'ELECTRONICS ', 'EM-6961', '6528', 0, '-', '-', 0, 'RIZKI, ARWIN & NOMAR', '2000-11-17', 6, '', '', '', 'test.jpg'),
('152/CAL', 'POWER SENSOR', 'HP', '8483A', '2329A02232', 0, '2018-04-05', '2020-04-05', 2, 'SENTOT HERY', '2000-03-17', 6, 'EXTERNAL', '', '', 'test.jpg'),
('152/TRA', 'CONTROLLER EM 1000', 'EM ELECTRONICS', 'EM1000', '60873', 0, '-', '-', 0, 'RIZKI, ARWIN & NOMAR', '2000-11-18', 6, '', '', '', 'test.jpg'),
('153/CAL', 'POWER SENSOR', 'HP', '8481D', '2928A03960', 0, '2019-11-14', '2021-11-14', 2, 'SENTOT HERY', '2000-03-18', 6, 'EXTERNAL', '', '', 'test.jpg'),
('153/TRA', 'COUPLING/DECOUPLING NETWORK 4 BALANCED PAIRS - UNSCREENED (150kHz to 230 MHz) PLUS 2 ADAPTOR FOR TELECOM SERIES', 'COM-POWER CORP', 'CDN T8E, CDN ADA-T4/T8E ', '34250018', 0, '-', '-', 0, 'RIZKI, ARWIN & NOMAR', '2000-11-19', 6, '', '', '', 'test.jpg'),
('154/CAL', 'POWER SENSOR', 'HP', '8485A', '3318A16530', 1, '2018-05-08', '2020-05-08', 2, 'SENTOT HERY', '2000-03-19', 6, 'EXTERNAL', '', '', 'test.jpg'),
('154/TRA', 'TRANSMISION & SYNCHRONIZATION', 'ALBEDO', 'XGENIUS', 'LEX0211P', 0, '2019-09-04', '2021-09-04', 2, 'RIZKI, ARWIN & NOMAR', '2000-11-20', 6, '', '', '', 'test.jpg'),
('155/TRA', 'DIGITAL OSCILLOSCOPE 4 CHANNEL 350 MHz', 'RIGOL', 'MS05354', 'MS5A213303328', 0, '2019-08-21', '2021-08-21', 2, 'RIZKI, ARWIN & NOMAR', '2000-11-21', 6, '', '', '', 'test.jpg'),
('156/CAL', 'DUAL DIRECTIONAL COUPLER', 'HP', '778D', '17275', 0, '2018-10-16', '2021-10-16', 3, 'SENTOT HERY', '2000-03-20', 6, 'INTERNAL', '', '', 'test.jpg'),
('156/TRA', 'EMC SOFTWARE MEASUREMENT ', 'ROHDE & SCHWARTZ', 'VERSION 10.50.40', 'PRODUCT ID : 1040-0', 0, '-', '-', 0, 'RIZKI, ARWIN & NOMAR', '2000-11-22', 6, '', '', '', 'test.jpg'),
('157/CAL', 'DUAL DIRECTIONAL COUPLER', 'HP', '772D', '2839A00843', 0, '2017-03-30', '2020-03-30', 3, 'SENTOT HERY', '2000-03-21', 6, 'INTERNAL', '', '', 'test.jpg'),
('157/TRA', 'EMI TEST COMPLIANCE SOFTWARE', 'RIGOL', 'S1210', '-', 0, '-', '-', 0, 'RIZKI, ARWIN & NOMAR', '2000-11-23', 6, '', '', '', 'test.jpg'),
('158/CAL', 'POWER SENSOR', 'HP', '8482A', 'US37290006', 0, '2018-03-23', '2020-03-23', 2, 'SENTOT HERY', '2000-03-22', 6, 'EXTERNAL', '', '', 'test.jpg'),
('158/TRA', 'IP PERFORMANCE TESTER (BESAR)', 'IXIA', 'OPTIXIA XM12', 'XM12-0702206', 0, '', '', 0, 'RIZKI, ARWIN & NOMAR', '2000-11-24', 6, '', '', '', 'test.jpg'),
('159/CAL', '50 OHM TERMINATION', 'SUHNER', '15W DC-10G', '6515.01B', 0, '2019-07-08', '2021-07-08', 2, 'SENTOT HERY', '2000-03-23', 6, 'INTERNAL', '', '', 'test.jpg'),
('159/TRA', 'IP PERFORMANCE TESTER (KECIL)', 'IXIA', 'OPTIXIA XM2', 'XM2-0301041', 0, '-', '-', 0, 'RIZKI, ARWIN & NOMAR', '2000-11-25', 6, '', '', '', 'test.jpg'),
('160/CAL', 'MICROWAVE SYNTH. GENERATOR', 'GIGA-TRONICS', '12720A', '22005', 0, '2019-08-19', '2020-08-19', 1, 'SENTOT HERY', '2000-03-24', 6, 'EXTERNAL', '', '', 'test.jpg'),
('160/TRA', 'SIGNAL GENERATOR 16 GHz', 'WINDFREAK TECHNOLOGY', 'HW V2.03', '1172', 0, '-', '-', 2, 'RIZKI, ARWIN & NOMAR', '2000-11-26', 6, '', '', '', 'test.jpg'),
('161/CAL', 'DIGITAL MULTIMETER', 'IWATSU', 'VOAC 92', '21701', 0, '2019-09-09', '2020-09-09', 1, 'SENTOT HERY', '2000-03-25', 6, 'INTERNAL', '', '', 'test.jpg'),
('161/TRA', 'BLUETOOTH TESTER ', 'ANRITSU', 'MT 8852-B', '6262007597', 0, '-', '-', 2, 'RIZKI, ARWIN & NOMAR', '2000-11-27', 6, '', '', '', 'test.jpg'),
('162/CAL', 'DIGITAL MULTIMETER', 'IWATSU', 'VOAC 92', '21706', 0, '2019-09-09', '2020-09-09', 1, 'SENTOT HERY', '2000-03-26', 6, 'INTERNAL', '', '', 'test.jpg'),
('162/TRA', 'RADIO COMMUNICATION ANALYZER', 'ANRITSU', 'MT 8820-C', '6261760911', 0, '-', '-', 2, 'RIZKI, ARWIN & NOMAR', '2000-11-28', 6, '', '', '', 'test.jpg'),
('163/TRA', 'WIRELESS CONNECTIVITY TEST SET', 'ANRITSU', 'MT 8862-A', '6262021089', 0, '-', '-', 2, 'RIZKI, ARWIN & NOMAR', '2000-11-29', 6, '', '', '', 'test.jpg'),
('164/CAL', 'AC VOLTMETER', 'YOKOGAWA', '235300-80-13', '60LH0860', 0, '2019-09-11', '2020-09-11', 1, 'SENTOT HERY', '2000-03-27', 6, 'INTERNAL', '', '', 'test.jpg'),
('164/TRA', 'RF SHIELD BOX ', 'TOJOIN', 'MS 4040-M', 'SZA19G6727', 0, '-', '-', 2, 'RIZKI, ARWIN & NOMAR', '2000-11-30', 6, '', '', '', 'test.jpg'),
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
  `codename` char(3) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` char(1) NOT NULL,
  `registered` varchar(24) NOT NULL,
  `updated` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_engineers`
--

INSERT INTO `test_engineers` (`id`, `name`, `lab`, `codename`, `password`, `email`, `role`, `registered`, `updated`) VALUES
('970037', 'Aldi Wiranata', 'CAB', 'ALW', 'o5TGTBA3uRfGOpb+wpIidUWLCczMQyqmn518w2RQXiE=', 'aldiw01@gmail.com', '2', '2020-01-15T04:51:54.211Z', '2020-01-15T04:51:54.211Z');

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

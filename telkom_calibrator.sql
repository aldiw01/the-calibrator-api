-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2020 at 09:30 AM
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
  `device_id` varchar(24) NOT NULL,
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
('064-KAL-19', '023/CAB', '2019-11-26', '2021-11-26', '970037', 'test.pdf'),
('132/KAB/L/QA/2020', '022/132/QA/2020', '2019-08-21', '2019-09-13', '970037', 'certificate_file_1584900013909_KSO DIRECT BURIED 4 - 96 CORE G.655.C English final.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `cal_requests`
--

CREATE TABLE `cal_requests` (
  `id` varchar(15) NOT NULL,
  `lab` varchar(3) NOT NULL,
  `request_type` varchar(3) NOT NULL,
  `device_name` text NOT NULL,
  `manufacturer` text NOT NULL,
  `model` text NOT NULL,
  `serial_number` text NOT NULL,
  `capacity` text NOT NULL,
  `made_in` varchar(24) NOT NULL,
  `test_reference` text NOT NULL,
  `company_name` text NOT NULL,
  `company_address` text NOT NULL,
  `created` varchar(24) NOT NULL,
  `start_target` varchar(24) NOT NULL,
  `finished_target` varchar(24) NOT NULL,
  `actual_start` varchar(24) NOT NULL,
  `actual_finished` varchar(24) NOT NULL,
  `engineer_1` varchar(11) NOT NULL,
  `engineer_2` varchar(11) NOT NULL,
  `engineer_3` varchar(11) NOT NULL,
  `documentation` text NOT NULL,
  `status` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cal_requests`
--

INSERT INTO `cal_requests` (`id`, `lab`, `request_type`, `device_name`, `manufacturer`, `model`, `serial_number`, `capacity`, `made_in`, `test_reference`, `company_name`, `company_address`, `created`, `start_target`, `finished_target`, `actual_start`, `actual_finished`, `engineer_1`, `engineer_2`, `engineer_3`, `documentation`, `status`) VALUES
('022/132/QA/2020', 'CAB', 'QA', 'KABEL SERAT OPTIK SINGLE MODE BERKONSTRUKSI LOOSE TUBE UNTUK APLIKASI TANAM LANGSUNG (KSO DIRECT BURIED)', 'VOKSEL', 'NZDS C LF B WG LT ( G 655 C ) ', '', '4 to 96 CORE', 'Indonesia', 'STEL K-016-2013 Ver. 3.0', 'VOKSEL ELECTRIC, Tbk. PT.', 'JL. RAYA NAROGONG KM.16, CILEUNGSI, BOGOR\r\n', '2020-03-18', '2020-03-18', '2020-04-08', '2020-03-20', '2020-04-10', '970037', '970000', '201902060', 'test.jpg', '1'),
('a', '', '', 'ab', 'a', 'a', '', '', '', '', 'a', 'a', '2020-03-26', '2020-03-26', '2020-04-02', '2020-03-27', '', '970037', '', '', 'test.jpg', '1');

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
  `info` text NOT NULL,
  `created` varchar(24) NOT NULL,
  `updated` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cal_steps`
--

INSERT INTO `cal_steps` (`id`, `step_name`, `step_number`, `info`, `created`, `updated`) VALUES
('CER1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('CER2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('CER3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('DEV1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('DEV2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('DEV3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('DEV4', 'Documentation', 0, 'has add a device documentation', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('DEV5', 'Manual', 0, 'has add a device manual', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('DEV6', 'Specification', 0, 'has add a device specification', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('ENG1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('ENG2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('ENG3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('FRM1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('FRM2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('FRM3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('MEQ1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('MEQ2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('MEQ3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('PRO1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('PRO2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('PRO3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('RAW1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('RAW2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('RAW3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQ1', 'Add', 1, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQ2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQ3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQ4', 'Documentation', 0, 'has add a device documentation', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQCAL1', 'Registered', 1, 'has change the request status to REGISTERED', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQCAL2', 'Function Test', 2, 'has change the request status to FUNCTION TEST', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQCAL3', 'Calibrating', 3, 'has change the request status to CALIBRATING', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQCAL4', 'Submitted', 4, 'has change the request status to SUBMITTED', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQCAL5', 'Finished', 5, 'has change the request status to FINISHED', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQQA1', 'Registered', 1, 'has change the request status to REGISTERED', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQQA2', 'Function Test', 2, 'has change the request status to FUNCTION TEST', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQQA3', 'QA Test', 3, 'has change the request status to QA TEST', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQQA4', 'Submitted', 4, 'has change the request status to SUBMITTED', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQQA5', 'Finished', 5, 'has change the request status to FINISHED', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQTA1', 'Registered', 1, 'has change the request status to REGISTERED', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQTA2', 'Function Test', 2, 'has change the request status to FUNCTION TEST', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQTA3', 'TA Test', 3, 'has change the request status to TA TEST', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQTA4', 'Submitted', 4, 'has change the request status to SUBMITTED', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQTA5', 'Finished', 5, 'has change the request status to FINISHED', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQVT1', 'Registered', 1, 'has change the request status to REGISTERED', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQVT2', 'Function Test', 2, 'has change the request status to FUNCTION TEST', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQVT3', 'VT Test', 3, 'has change the request status to VT TEST', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQVT4', 'Submitted', 4, 'has change the request status to SUBMITTED', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('REQVT5', 'Finished', 5, 'has change the request status to FINISHED', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('RES1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('RES2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('RES3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('SPC1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('SPC2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('SPC3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('TIM1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('TIM2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('TIM3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('TTY1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('TTY2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('TTY3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('UNC1', 'Add', 0, 'has add the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('UNC2', 'Edit', 0, 'has edit the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z'),
('UNC3', 'Delete', 0, 'has delete the record', '2020-04-19T15:40:53.729Z', '2020-04-19T15:40:53.729Z');

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
  `calibration_object` int(1) NOT NULL,
  `calibration_method` varchar(10) NOT NULL,
  `manual_file` text,
  `spec_file` text,
  `documentation` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `name`, `manufacturer`, `model`, `serial_number`, `defect_status`, `calibration_date`, `due_date`, `calibration_period`, `supervisor`, `issue_date`, `test_interval`, `calibration_object`, `calibration_method`, `manual_file`, `spec_file`, `documentation`) VALUES
('001/CAB', 'TENSILE MACHINE', 'AUTOGRAPH', 'AG5000 E', '30096828', 0, '2018-07-31', '2019-07-31', 1, 'KUATIN, IRFAN, WILDA', '2000-01-01', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('001/CAL', 'TES UNIT', 'F & G', 'PM-2', '200759', 0, '2019-09-10', '2020-09-10', 1, 'SENTOT HERY', '2000-01-01', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('002/CAL', 'POWER METER', 'HP', '436 A', '2347A16880', 1, '2013-04-05', '2014-04-05', 1, 'SENTOT HERY', '2000-01-02', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('003/CAB', 'HIGH RESISTANCE METER', 'HP', '4329A', '1836 J 04161', 0, '2020-01-23', '2022-01-23', 2, 'KUATIN, IRFAN, WILDA', '2000-01-02', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('003/CAL', 'POWER METER', 'HP', '436 A', '2236A12973', 0, '2019-01-29', '2020-01-29', 1, 'SENTOT HERY', '2000-01-03', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('004/CAB', 'ECHO METER', 'KARL DEUTSH', '1070', '22307', 0, '2018-08-21', '2021-08-21', 3, 'KUATIN, IRFAN, WILDA', '2000-01-03', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('006/CAL', 'RANGE CALIBRATOR', 'HP', '11683 A', '2236A02035', 0, '2019-07-12', '2021-07-12', 2, 'SENTOT HERY', '2000-01-04', 6, 1, 'INTERNAL', 'manual_file_006-CAL_1582255924176', 'spec_file_1582255775780_01 US7804764.pdf', 'test.jpg'),
('008/CAB', 'OSCILLATOR', 'ANDO', 'WBG-9', '50069', 0, '2019-10-25', '2021-10-25', 2, 'KUATIN, IRFAN, WILDA', '2000-01-04', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('009/CAL', 'COUNTER / POWER METER (500 MHz - 20 GHz)', 'HP', '5347 A', '3009A00995', 0, '2018-01-25', '2020-01-25', 2, 'SENTOT HERY', '2000-01-05', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('010/CAL', 'SYNTHESIZER / LEVEL GEN.', 'HP', '3335 A', '1640A01067', 1, '2013-04-05', '2014-04-05', 1, 'SENTOT HERY', '2000-01-06', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('011/CAL', 'SYNTHESIZER / LEVEL GEN.', 'HP', '3335 A', '1640A02114', 0, '2018-08-06', '2020-08-06', 2, 'SENTOT HERY', '2000-01-07', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('012/CAB', 'AC AMPERE METER', 'HB BRASIL', 'HB', '6', 2, '2015-10-09', '2017-10-09', 2, 'KUATIN, IRFAN, WILDA', '2000-01-05', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('013/CAL', 'DECADE RESISTANCE BOX', 'YOKOGAWA', '279301', '54FT0301', 0, '2018-09-18', '2020-09-18', 2, 'SENTOT HERY', '2000-01-08', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('014/CAB', 'SURGE VOLTAGE TESTER', 'HAEFELY', 'P6T', 'P6T-080723-20-8', 0, '2018-01-16', '2020-01-16', 2, 'KUATIN, IRFAN, WILDA', '2000-01-06', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('015/CAB', 'ALAT TEMBUS (CONE PENETRATION TEST)', 'STANHOPE SET', 'KI10', '1710', 0, '2018-08-20', '2019-08-20', 1, 'KUATIN, IRFAN, WILDA', '2000-01-07', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('016/CAB', 'DC DIELECTRIC TEST SET ', 'BIDDLE', '220070', '16107', 0, '2019-08-22', '2020-08-22', 1, 'KUATIN, IRFAN, WILDA', '2000-01-08', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('018/CAB', 'VISCOSITY METER', 'BROOKFIELD', 'RVF', '80119', 0, '2008-09-19', '2011-09-19', 3, 'KUATIN, IRFAN, WILDA', '2000-01-09', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('020/CAB', 'CARBON CONTENT BLACK TESTER', 'IZUSU SEISAKUSHO', '-', '3025/280', 0, '2019-04-25', '2021-04-25', 2, 'KUATIN, IRFAN, WILDA', '2000-01-10', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('021/CAB', 'PROFILE  PROJECTOR', 'MITUTOYO', 'PJ – 300', '440177', 0, '2018-07-31', '2019-07-31', 1, 'KUATIN, IRFAN, WILDA', '2000-01-11', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('022/CAB', 'RCKE MEASURING SYSTEM', 'AESA', '9440', '3706', 1, '2010-10-11', '2012-10-11', 2, 'KUATIN, IRFAN, WILDA', '2000-01-12', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('023/CAB', 'SET OF 5 STANDARD AESA', 'AESA', '9001', '4007', 0, '2019-08-23', '2022-08-23', 3, 'KUATIN, IRFAN, WILDA', '2000-01-13', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('023/CAL', 'ATTENUATOR 600 OHM', 'HP', '4437 A', '1250J01182', 0, '2018-09-18', '2020-09-18', 2, 'SENTOT HERY', '2000-01-09', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('025/CAB', 'METERAN  20  METER', 'SILVER CUSTOM', '20 M', '025/CAB', 0, '2002-05-14', 'Initial', 0, 'KUATIN, IRFAN, WILDA', '2000-01-14', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('026/CAB', 'MISTAR 1 METER  (STELL RULE)', 'KDS-10 ME', '1 M', '026/CAB', 0, '2001-05-28', 'Initial', 0, 'KUATIN, IRFAN, WILDA', '2000-01-15', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('026/CAL', 'STANDARD AIR CAPACITOR', 'HP', '16380 C', '2519J00513', 0, '2019-07-05', '2021-07-05', 2, 'SENTOT HERY', '2000-01-10', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('027/CAB', 'TIMBANGAN ELEKTRONIK  PAN TUNGGAL', 'SATORIUS', 'BP210 S', '50808685', 1, '2013-11-27', '2015-11-27', 2, 'KUATIN, IRFAN, WILDA', '2000-01-16', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('027/CAL', 'STANDARD AIR CAPACITOR', 'HP', '16380 A', '-', 0, '2019-11-20', '2021-11-20', 2, 'SENTOT HERY', '2000-01-11', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('031/CAB', 'INSULATING & ARRESTER TESTER', 'OBO BETTERMAN', 'ISOLAB', 'VB6 (031/CAB)', 0, '2014-09-18', '2019-09-18', 5, 'KUATIN, IRFAN, WILDA', '2000-01-17', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('033/CAB', 'OVEN', 'WTB BINDER', '1.51E+13', '940062', 1, '2012-06-18', '2013-06-18', 1, 'KUATIN, IRFAN, WILDA', '2000-01-18', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('034/CAL', 'DIRECTIONAL COUPLER', 'HP', '11691 D', '1212A02334', 0, '2019-04-23', '2021-04-23', 2, 'SENTOT HERY', '2000-01-12', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('035/CAB', 'VERNIER CALIPER (0-300 mm)', 'MITUTOYO', '0-300 mm', '035/CAB', 0, '2009-07-17', '2012-07-17', 3, 'KUATIN, IRFAN, WILDA', '2000-01-19', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('036/CAB', 'DIGIMATIC CALIPER', 'MITUTOYO', '573-142-10', '333', 0, '2018-04-10', '2020-04-10', 2, 'KUATIN, IRFAN, WILDA', '2000-01-20', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('037/CAB', 'CLIMATIC CHAMBER ( OVEN )', 'HERAEUS VOTSCH', 'HC-4030', '43468', 0, '2016-10-07', '2019-10-07', 3, 'KUATIN, IRFAN, WILDA', '2000-01-21', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('037/CAL', 'AC/DC CURRENT PROBE', 'FLUKE', 'Y 8100', '2672160', 0, '2019-07-12', '2022-07-12', 3, 'SENTOT HERY', '2000-01-13', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('038/CAB', 'DIGIMATIC CALIPER', 'MITUTOYO', '500-151', '59319', 1, '2015-02-23', '2016-02-23', 1, 'KUATIN, IRFAN, WILDA', '2000-01-22', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('038/CAL', 'AUDIO ANALYZER', 'HP', '8903 B', '2818A04574', 0, '2017-10-13', '2019-10-13', 2, 'SENTOT HERY', '2000-01-14', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('039/CAB', 'DIGIMATIC MICROMETER', 'MITUTOYO', '331-511-30', '6035629', 0, '2016-02-17', '2019-02-17', 3, 'KUATIN, IRFAN, WILDA', '2000-01-23', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('040/CAB', 'DIGIMATIC MICROMETER', 'MITUTOYO', '395-541-30', '5176337', 1, '2011-12-19', '2012-12-19', 1, 'KUATIN, IRFAN, WILDA', '2000-01-24', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('041/CAB', 'DIAL THICKNESS', 'MITUTOYO', '7313', '445F51', 0, '2015-03-09', '2020-03-09', 5, 'KUATIN, IRFAN, WILDA', '2000-01-25', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('042/CAB', 'TERMO HIGROMETER', 'PALMA', 'SATO', '107662', 0, '2018-03-15', '2020-03-15', 2, 'KUATIN, IRFAN, WILDA', '2000-01-26', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('043/CAB', 'ELECTRONIC BALANCE', 'SATORIUS', 'AC 211S / 210g', '50710490', 0, '2018-07-31', '2020-07-31', 2, 'KUATIN, IRFAN, WILDA', '2000-01-27', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('043/CAL', 'DECADE CAPACITOR', 'HP', '4440 B', '1224J04572', 0, '2019-04-23', '2021-04-23', 2, 'SENTOT HERY', '2000-01-15', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('044/CAB', 'DIAL THICKNESS GAUGE', 'MITUTOYO', '7305', '54F928', 0, '2018-04-09', '2020-04-09', 2, 'KUATIN, IRFAN, WILDA', '2000-01-28', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('044/CAL', 'LEVEL METER', 'ANRITSU', 'ML424B', 'M57339', 0, '2017-10-13', '2019-10-13', 2, 'SENTOT HERY', '2000-01-16', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('045/CAB', 'DIAL CALIPER GAUGE', 'MITUTOYO', '209-105', '045/CAB', 0, '2018-04-09', '2020-04-09', 2, 'KUATIN, IRFAN, WILDA', '2000-01-29', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('045/CAL', 'DECADE RESISTANCE BOX', 'YOKOGAWA', '2793 - 03', '26FT1066', 0, '2017-10-25', '2019-10-25', 2, 'SENTOT HERY', '2000-01-17', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('046/CAB', 'DIAL CALIPER GAUGE', 'MITUTOYO', '209-103', '046/CAB', 0, '2018-04-09', '2020-04-09', 2, 'KUATIN, IRFAN, WILDA', '2000-01-30', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('047/CAB', 'TERMO HIGROMETER', 'HISAMATSU', 'TN-2500', '4097', 1, '2015-12-04', '2017-12-04', 2, 'KUATIN, IRFAN, WILDA', '2000-01-31', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('048/CAL', 'DC REFFERENCE STANDARD', 'FLUKE', '731 B', '2575007', 0, '2019-04-23', '2021-04-23', 2, 'SENTOT HERY', '2000-01-18', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('051/CAB', 'INSULATION TESTER', 'MEGGER', 'BM-11', '50610140893', 1, '2016-03-21', '2018-03-21', 2, 'KUATIN, IRFAN, WILDA', '2000-02-01', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('053/CAB', 'INSULATION TESTER', 'MEGGER', 'BM-11', '6.7501E+11', 1, '2009-06-05', '2010-06-05', 1, 'KUATIN, IRFAN, WILDA', '2000-02-02', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('054/CAB', 'TIMBANGAN GANTUNG 200 KG', 'CASTON', 'NC-200', '96100012', 0, '2019-04-25', '2022-04-25', 3, 'KUATIN, IRFAN, WILDA', '2000-02-03', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('056/CAB', 'PRESSURE GAUGE 2,5 KG/CM2', 'EMPERO-', '0 to 2.5 KG/CM2', '056/CAB', 0, '2018-03-23', '2021-03-23', 3, 'KUATIN, IRFAN, WILDA', '2000-02-04', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('057/CAB', 'PRESSURE GAUGE 350 ', 'REG KOIKE COLT', '0 to 350 PSI', '057/CAB', 0, '2018-03-20', '2021-03-20', 3, 'KUATIN, IRFAN, WILDA', '2000-02-05', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('058/CAB', 'PRESSURE GAUGE 3500 PSI', 'COLT-', '0 to 3500 PSI', '058/CAB', 0, '2018-03-19', '2021-03-19', 3, 'KUATIN, IRFAN, WILDA', '2000-02-06', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('059/CAB', 'STANDARD WEIGHT (8 BUAH)', 'VCI VERUST', '1129 – 2296.6', '059/CAB', 0, '2012-07-20', 'Initial', 0, 'KUATIN, IRFAN, WILDA', '2000-02-07', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('061/CAB', 'DIAL THERMOMETER', 'LOOSCO', '0 to 250 °C', '061/CAB', 1, '2015-03-04', '2020-03-04', 5, 'KUATIN, IRFAN, WILDA', '2000-02-08', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('062/CAB', 'DIELECTRIC/ INSULATION TESTER', 'BASE', 'BHP-5200', '19718', 0, '2019-08-22', '2021-08-22', 2, 'KUATIN, IRFAN, WILDA', '2000-02-09', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('063/CAB', 'OVEN (INCUBATOR)', 'HERAEUS', 'B6060', 'S1000339', 0, '2018-07-31', '2019-07-31', 1, 'KUATIN, IRFAN, WILDA', '2000-02-10', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('064/CAB', 'SALT  SPRAY CHAMBER', 'HERAEUS', 'H5K 1000', '43467', 0, '2018-07-31', '2019-07-31', 1, 'KUATIN, IRFAN, WILDA', '2000-02-11', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('066/CAB', 'VIDEO FIBRE', 'YORK', 'S 200', '200-01-032', 0, '2013-12-18', '2018-12-18', 5, 'KUATIN, IRFAN, WILDA', '2000-02-12', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('067/CAB', 'CHROMATIC DISPERTION', 'YORK', 'S 18', '18972944', 1, '2013-12-16', '2018-12-16', 5, 'KUATIN, IRFAN, WILDA', '2000-02-13', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('068/CAB', 'SPECTRAL  ATTENUATOR     ', 'YORK', 'S 25', '25-02-174', 1, '2013-12-18', '2018-12-18', 5, 'KUATIN, IRFAN, WILDA', '2000-02-14', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('069/CAB', 'PORTABLE  WHEATSTONE BRIDGE', 'YOKOGAWA', '2755', '66VNO140', 0, '2019-08-22', '2022-08-22', 3, 'KUATIN, IRFAN, WILDA', '2000-02-15', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('069/CAL', 'TERMO-HIGROMETER', 'HISAMATSU', 'TN-2500', '4098', 0, '2018-03-14', '2020-03-14', 2, 'SENTOT HERY', '2000-01-19', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('070/CAB', 'THERMAL SHOCK CHAMBER', 'HERAEUS', 'VMS 2/08/22/3', '7059168', 1, '2008-02-25', '2009-02-25', 1, 'KUATIN, IRFAN, WILDA', '2000-02-16', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('070/CAL', 'TERMO-HIGROMETER', 'PALMA', 'SATO', '107669', 0, '2018-03-15', '2020-03-15', 2, 'SENTOT HERY', '2000-01-20', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('071/CAL', 'TERMO-HIGROMETER', 'HISAMATSU', 'TN-2500', '4099', 0, '2018-03-13', '2020-03-13', 2, 'SENTOT HERY', '2000-01-21', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('074/CAB', 'OTDR (Optic Time Domain Reflector)', 'PHOTON KINETICS', '6500', '6571702', 1, '2010-05-20', '2012-05-20', 2, 'KUATIN, IRFAN, WILDA', '2000-02-17', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('075/CAB', 'TDR (Time Division Reflector)', 'TEKTRONIK', 'TS.100 ', 'B.056208', 0, '2006-04-25', 'Initial', 0, 'KUATIN, IRFAN, WILDA', '2000-02-18', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('076/CAB', 'COMPUTER TENSILE SQUEEZEE  TESTER', 'HUNGTA', 'HT-8760', '1003', 0, '2019-09-24', '2021-09-24', 2, 'KUATIN, IRFAN, WILDA', '2000-02-19', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('077/CAB', 'FIBRE CONTINOUS  FLEXING TESTER', 'HUNGTA', 'HT-8761', '1104', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-02-20', 6, 0, '-', '', '', 'test.jpg'),
('078/CAB', 'FIBRE CONTINOUS IMPACT TESTER', 'HUNGTA', 'HT-8762', '1203', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-02-21', 6, 0, '-', '', '', 'test.jpg'),
('079/CAB', 'AUTO FIBRE TORSION TESTER', 'HUNGTA', 'HT-8763', '1233', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-02-22', 6, 0, '-', '', '', 'test.jpg'),
('080/CAB', 'DIGITAL MONOMETER (pressure gauge)', 'VDO', '3904.000.004', '53707', 1, '2013-02-25', '2015-02-25', 2, 'KUATIN, IRFAN, WILDA', '2000-02-23', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('081/CAB', 'VIBRATION TESTING SYSTEM', 'B & K', '3391-086', '1767753', 0, '2017-03-15', '2022-03-15', 5, 'KUATIN, IRFAN, WILDA', '2000-02-24', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('084/CAB', ' TRUE RMS MULTIMETER', 'FLUKE', '79 III', '76870983', 0, '2018-09-18', '2020-09-18', 2, 'KUATIN, IRFAN, WILDA', '2000-02-25', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('085/CAB', 'TIMBANGAN 11 KG', 'UWE  GENIWEIQHER', 'GM – 11 K', 'E06108', 0, '2016-08-30', '2019-08-30', 3, 'KUATIN, IRFAN, WILDA', '2000-02-26', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('086/CAL', 'STANDARD RESISTOR', 'SIEMEN', '0.001 ?', '1600726', 0, '2019-07-12', '2021-07-12', 2, 'SENTOT HERY', '2000-01-22', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('087/CAL', 'STANDARD RESISTOR', 'SIEMEN', '1 000  ?', '19007', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-01-23', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('089/CAB', 'TERMOMETER GELAS', 'GOLD BRAND', '0 – 150 ºC', '-4-', 1, '2018-03-14', '2020-03-14', 2, 'KUATIN, IRFAN, WILDA', '2000-02-27', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('089/CAL', 'STANDARD RESISTOR', 'SIEMEN', '10 000  ?', '19005', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-01-24', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('090/CAL', 'STANDARD RESISTOR', 'SIEMEN', '0.1  ?', '1600674', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-01-25', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('091/CAL', 'STANDARD RESISTOR', 'SIEMEN', '0.01  ?', '1600688', 0, '2019-01-17', '2021-01-17', 2, 'SENTOT HERY', '2000-01-26', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('092/CAB', 'STOP WATCH', 'NIKE', 'H2O Resistance', '-', 0, '2019-08-23', '2020-08-23', 1, 'KUATIN, IRFAN, WILDA', '2000-02-28', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('092/CAL', 'STANDARD RESISTOR', 'AEG', '10  ?', '7528', 0, '2019-04-22', '2021-04-22', 2, 'SENTOT HERY', '2000-01-27', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('093/CAB', 'STOP WATCH', 'NIKE', 'H2O Resistance', '-', 0, '2019-08-23', '2020-08-23', 1, 'KUATIN, IRFAN, WILDA', '2000-02-29', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('093/CAL', 'STANDARD RESISTOR', 'AEG', '0.0001  ?', '7348', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-01-28', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('094/CAB', 'MILI OHM METER', 'QUADTECH', '1880', '489818', 0, '2020-01-27', '2022-01-27', 2, 'KUATIN, IRFAN, WILDA', '2000-03-01', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('094/CAL', 'STANDARD RESISTOR', 'AEG', '1 000  ?', '7664', 0, '2018-12-20', '2020-12-20', 2, 'SENTOT HERY', '2000-01-29', 6, 1, 'Internal', '', '', 'test.jpg'),
('095/CAB', 'DIELECTRIC LOSS MEASURING SET', 'ANDO', 'TR-10C', '3910401', 0, '2015-05-04', '2018-05-04', 3, 'KUATIN, IRFAN, WILDA', '2000-03-02', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('095/CAL', 'STANDARD RESISTOR', 'AEG', '100  ?', '7518', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-01-30', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('096/CAB', 'NULL DITECTOR', 'ANDO', 'BDA-9', '3910401', 0, '2015-07-06', '2018-07-06', 3, 'KUATIN, IRFAN, WILDA', '2000-03-03', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('096/CAL', 'STANDARD RESISTOR', 'AEG', '100 000  ?', '-', 0, '2019-01-17', '2021-01-17', 2, 'SENTOT HERY', '2000-01-31', 6, 1, 'INTERNAL', '', '', 'documentation_1582182995869_Standard Resistor.png'),
('097/CAB', 'OSCILLATOR', 'ANDO', 'WBG-9', '3910401', 1, '2009-11-04', '2010-11-04', 1, 'KUATIN, IRFAN, WILDA', '2000-03-04', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('097/CAL', 'STANDARD RESISTOR', 'AEG', '10 000  ?', '7097', 0, '2019-01-17', '2021-01-17', 2, 'SENTOT HERY', '2000-02-01', 6, 1, 'INTERNAL', '', '', 'documentation_1582182148262_Standard Resistor.png'),
('098/CAB', 'THERMOSTATIC OVEN', 'ANDO', 'TO-19', '3910401', 0, '2016-02-26', '2021-02-26', 5, 'KUATIN, IRFAN, WILDA', '2000-03-05', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('098/CAL', 'STANDARD RESISTOR', 'AEG', '0.01  ?', '7172', 0, '2018-01-25', '2020-01-25', 2, 'SENTOT HERY', '2000-02-02', 6, 1, 'INTERNAL', '', '', 'documentation_1582132721778_Standard Resistor.png'),
('099/CAB', 'POLARISATION MODE DIPERSION SYSTEM', 'PERKIN ELMER', 'NEXUS', '26801', 0, '2006-05-25', '2011-05-25', 5, 'KUATIN, IRFAN, WILDA', '2000-03-06', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('099/CAL', 'STANDARD RESISTOR', 'AEG', '10  ?', '7529', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-02-03', 6, 1, 'INTERNAL', '', '', 'documentation_1582132855813_Standard Resistor.png'),
('100/CAB', 'MEGATEST 5000', 'AMPROBE', 'AMB-5KVD', '4061594', 0, '2019-12-02', '2021-12-02', 2, 'KUATIN, IRFAN, WILDA', '2000-03-07', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('100/CAL', 'STANDARD RESISTOR', 'AEG', '0.1  ?', '7810', 0, '2019-01-17', '2021-01-17', 2, 'SENTOT HERY', '2000-02-04', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('101/CAB', 'DIGIMATIC CALIPER', 'MITUTOYO', 'CD-12\"C / 0 ~ 300mm', '66203', 0, '2019-06-11', '2021-06-11', 2, 'KUATIN, IRFAN, WILDA', '2000-03-08', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('101/CAL', 'STANDARD RESISTOR', 'AEG', '100  ?', '7520', 0, '2019-01-18', '2021-01-18', 2, 'SENTOT HERY', '2000-02-05', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('102/CAB', 'OTDR & OPTICAL DWDM ANALIZER', 'ACTERNA', 'MTS 8000', '940', 0, '2017-10-26', '2022-10-26', 5, 'KUATIN, IRFAN, WILDA', '2000-03-09', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('102/CAL', 'STANDARD RESISTOR', 'AEG', '1  ?', '7691', 0, '2018-12-20', '2020-12-20', 2, 'SENTOT HERY', '2000-02-06', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('103/CAB', 'SOUND LEVEL METER', 'RION', 'NA-27', '10362601', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-03-10', 6, 0, '-', '', '', 'test.jpg'),
('103/CAL', 'STANDARD RESISTOR', 'AEG', '1000  ?', '7662', 0, '2019-01-17', '2021-01-17', 2, 'SENTOT HERY', '2000-02-07', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('104/CAB', 'FUSION SPLICER', 'FITEL', 'S177A', '4406', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-03-11', 6, 0, '-', '', '', 'test.jpg'),
('104/CAL', 'STANDARD RESISTOR', 'AEG', '0.1  ?', '7419', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-02-08', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('105/CAB', 'OPTICAL FIBER GEOMETRIC SYSTEM', 'PHOTO KINETICS', 'PK 240', '53172503', 0, '2013-12-19', '2018-12-19', 5, 'KUATIN, IRFAN, WILDA', '2000-03-12', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('105/CAL', 'STANDARD RESISTOR', 'AEG', '10 000  ?', '7099', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-02-09', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('106/CAB', 'OPTICAL COATING GEOMETRY', 'PHOTO KINETICS', '2400', '53782388', 0, '2013-12-19', '2018-12-19', 5, 'KUATIN, IRFAN, WILDA', '2000-03-13', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('106/CAL', 'STANDARD RESISTOR', 'AEG', '1  ?', '7687', 0, '2018-07-30', '2020-07-30', 2, 'SENTOT HERY', '2000-02-10', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('107/CAB', 'MODULAR IMPULSE GENERATOR', 'CE', 'MIG-0612', '826', 0, '2018-01-29', '2021-01-29', 3, 'KUATIN, IRFAN, WILDA', '2000-03-14', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('107/CAL', 'STANDARD RESISTOR', 'AEG', '0.001  ?', '6895', 0, '2019-04-22', '2021-04-22', 2, 'SENTOT HERY', '2000-02-11', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('108/CAB', 'OTDR ', 'PHOTON KINETICS', '8000 / 86501-YO', '80000417', 0, '2018-07-18', '2020-07-18', 2, 'KUATIN, IRFAN, WILDA', '2000-03-15', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('108/CAL', 'LCR METER', 'HP', '4263B', 'JP1KD00894', 0, '2019-07-05', '2021-07-05', 2, 'SENTOT HERY', '2000-02-12', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('109/CAB', 'OPTICAL LASER SOURCE', 'JDSU', 'OLS-55', 'M-0165', 0, '2020-01-28', '2025-01-28', 5, 'KUATIN, IRFAN, WILDA', '2000-03-16', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('109/CAL', '50 W TERMINATION', 'TETRONIX', '50 W 2 W', '011-0049-01', 0, '2019-07-15', '2021-07-15', 2, 'SENTOT HERY', '2000-02-13', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('110/CAB', 'SELECTIVE OPTICAL POWER METER', 'JDSU', 'OLP-57', 'P-0019', 0, '2020-01-28', '2025-01-28', 5, 'KUATIN, IRFAN, WILDA', '2000-03-17', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('110/CAL', 'STEP ATTENUATOR', 'HP', '8496 B', '1350A02875', 0, '2019-04-23', '2021-04-23', 2, 'SENTOT HERY', '2000-02-14', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('111/CAB', 'OTDR', 'JDSU', 'MTS-4000', '5416, 0-0042', 0, '2017-11-20', '2022-11-20', 5, 'KUATIN, IRFAN, WILDA', '2000-03-18', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('112/CAB', 'INSERTION LOSS / RETUR LOSS TEST STATION', 'JOINWIT', 'JW3307A', '11052019', 0, '2019-11-05', '2021-11-05', 2, 'KUATIN, IRFAN, WILDA', '2000-03-19', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('112/CAL', 'POWER SENSOR', 'HP', '8482 H', '1545A00991', 0, '2018-05-08', '2020-05-08', 2, 'SENTOT HERY', '2000-02-15', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('113/CAB', 'OPTICAL TIME DOMAIN REFLECTOMETER (OTDR)', 'EXFO', 'FTB-200', '713161', 0, '2018-05-25', '2019-05-25', 1, 'KUATIN, IRFAN, WILDA', '2000-03-20', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('114/CAB', 'CD & PMD', 'EXFO', '-', '-', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-03-21', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('115/CAB', 'ARC FUSION SPLICER', 'SWIFT', 'K-7', 'AA361509010924', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-03-22', 6, 0, '-', '', '', 'test.jpg'),
('116/CAB', 'PE FIBER OPTICS', '-', 'WS-500', '-', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-03-23', 6, 0, '-', '', '', 'test.jpg'),
('117/CAB', 'CLADDING DIAMETER STANDARD', 'NPL', '-', '-', 0, '2016-04-19', 'INITIAL', 0, 'KUATIN, IRFAN, WILDA', '2000-03-24', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('118/CAB', 'CORNING (R) SINGLE MODE OPTICAL FIBER ITU-TG-652D', 'CORNING', '12867 METER', '1.00544E+11', 0, '2016-04-13', 'INITIAL', 0, 'KUATIN, IRFAN, WILDA', '2000-03-25', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('118/CAL', 'DUAL DIRECT. COUPLER', 'HP', '796 D', '7090', 0, '2019-04-23', '2021-04-23', 2, 'SENTOT HERY', '2000-02-16', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('119/CAB', 'CORNING (R) SINGLE MODE OPTICAL FIBER ITU-TG-652D', 'CORNING', '12864 METER', '1.00544E+11', 0, '2016-04-12', 'INITIAL', 0, 'KUATIN, IRFAN, WILDA', '2000-03-26', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('119/CAL', 'PREC. TERMIN DC 100 KHZ ', 'TETRONIX', '50 W', '011-0129-00', 0, '2017-04-26', '2019-04-26', 2, 'SENTOT HERY', '2000-02-17', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('120/CAB', 'CORNING (R) SINGLE MODE OPTICAL FIBER ITU-TG-652D', 'CORNING', '12,6 KM', '1.00547E+11', 0, '2016-05-11', 'INITIAL', 0, 'KUATIN, IRFAN, WILDA', '2000-03-27', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('121/CAB', 'OPTICAL FIBRE REFERENCE ', 'CORNING', '2,2 KM', '100537530456D', 0, '2016-05-12', 'INITIAL', 0, 'KUATIN, IRFAN, WILDA', '2000-03-28', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('121/CAL', 'MATCHED 75-50 W', 'TETRONIX', '75 W 50 W', '011-057', 0, '2017-04-26', '2019-04-26', 2, 'SENTOT HERY', '2000-02-18', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('122/CAB', 'DIDITAL CALIPER ', 'TORA', '150mm', '13110131', 0, '2018-08-02', '2020-08-02', 2, 'KUATIN, IRFAN, WILDA', '2000-03-29', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('122/CAL', 'PREC. TERMIN DC 18 Ghz', 'SUHNER', '50 W', '6500.17.A', 0, '2018-09-18', '2020-09-18', 2, 'SENTOT HERY', '2000-02-19', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('123/CAB', 'FUSION SPLICER', 'FITEL', 'S123M12', '10014', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-03-30', 6, 0, '-', '', '', 'test.jpg'),
('124/CAB', 'FUSION SPLICER', 'FITEL', 'S178A VER.2', '33967', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-03-31', 6, 0, '-', '', '', 'test.jpg'),
('125/CAB', 'INSERTION LOSS / RETUR LOSS TEST STATION', 'STC', 'IRL-3201', '171221628', 0, '2018-11-23', '2020-11-23', 2, 'KUATIN, IRFAN, WILDA', '2000-04-01', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('125/CAL', 'FEED THR. TERM DC1.2 Ghz', 'SUHNER', '75 W', '-', 0, '2017-10-13', '2019-10-13', 2, 'SENTOT HERY', '2000-02-20', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('126/CAB', 'CLIMATIC CHAMBER ', 'WELLTECH', 'JHT-880R CA 8800L', '17-214', 0, '2017-10-29', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-04-02', 6, 0, '-', '', '', 'test.jpg'),
('126/CAL', 'PULSE GENERATOR', 'HP', '8112A', '3205G11966', 0, '2017-04-17', '2019-04-17', 2, 'SENTOT HERY', '2000-02-21', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('127/CAB', 'SINGLE WIRE & CABLE VERTICAL FLAME TEST ', 'EQUIPMENT', 'BND-DXR', '17092301', 0, '2017-09-01', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-04-03', 6, 0, '-', '', '', 'test.jpg'),
('127/CAL', 'CALIBRATION SYSTEM', 'WAVETEK', '9100', '32781', 0, '2018-04-25', '2020-04-25', 2, 'SENTOT HERY', '2000-02-22', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('128/CAB', 'CABLE AND ANTENNA ANALYZER ', 'ROHDE & SCHWARZ', 'ZVH4', '1309.6800K24-102722-fB', 0, '2014-07-18', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-04-04', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('128/CAL', 'STANDARD INDUCTOR', 'QUADTECH', '1482-B', '6422734', 0, '2019-11-20', '2021-11-20', 2, 'SENTOT HERY', '2000-02-23', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('129/CAB', 'STRAIN POWER & LENGTH MEASUREMENT SYSTEM', 'PERKIN ELMER OPTOELECTRICS', 'SPL400', '-', 0, '2014-07-18', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-04-05', 6, 0, '-', '', '', 'test.jpg'),
('129/CAL', 'STANDARD INDUCTOR', 'QUADTECH', '1482-E', '6422735', 0, '2019-07-12', '2021-07-12', 2, 'SENTOT HERY', '2000-02-24', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('130/CAB', 'OPTICAL INSERTION LOSS / RETURN LOSS TESTER', 'TRIBRER', 'GRL200', '5.0101E+12', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-04-06', 6, 0, '-', '', '', 'test.jpg'),
('130/CAL', 'STANDARD INDUCTOR', 'QUADTECH', '1482-H', '6422736', 0, '2019-07-12', '2021-07-12', 2, 'SENTOT HERY', '2000-02-25', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('131/CAB', 'TIMBANGAN GANTUNG 500 KG', 'NANKAI', 'Crane Scale', '2019051731', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-04-07', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('131/CAL', 'STANDARD INDUCTOR', 'QUADTECH', '1482-L', '6422737', 0, '2019-11-20', '2021-11-20', 2, 'SENTOT HERY', '2000-02-26', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('132/CAB', 'TENSILE MACHINE', 'SINOWON', 'SM-200', 'GD7521511522', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-04-08', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('132/CAL', 'STANDARD INDUCTOR', 'QUADTECH', '1482-P', '6422738', 0, '2019-11-20', '2021-11-20', 2, 'SENTOT HERY', '2000-02-27', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('133/CAB', 'CLIMATIC CHAMBER', 'GRANDE', 'GTH-408', '20190925001', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-04-09', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('133/CAL', 'STANDARD INDUCTOR', 'QUADTECH', '1482-T', '6422739', 0, '2019-07-12', '2021-07-12', 2, 'SENTOT HERY', '2000-02-28', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('134/CAB', 'LASER CUTTING', 'YUEHONG CUTING', '', '', 0, '-', '-', 0, 'KUATIN, IRFAN, WILDA', '2000-04-10', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('134/CAL', 'SCALAR NETWORK ANALYZER', 'HP', '8757 C', '3210A02391', 1, '2016-12-23', '2017-12-23', 1, 'SENTOT HERY', '2000-02-29', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('135/CAL', 'OSCILLOSCOPE 1 Ghz', 'HP', '54710 D', 'US35370102', 0, '2017-10-25', '2019-10-25', 2, 'SENTOT HERY', '2000-03-01', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('136/CAL', 'MULTIMETER', 'HP', '3458 A', '2823A13780', 0, '2019-11-14', '2021-11-14', 2, 'SENTOT HERY', '2000-03-02', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('137/CAL', 'FREQ. ERROR MEAS. SYSTEM', 'ODETICS', '345-200-01', '3450046-9718', 1, '2017-10-16', '2018-10-16', 1, 'SENTOT HERY', '2000-03-03', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('138/CAL', 'PRECISION LCR METER', 'QUAD-TECH', '7600', '7124266', 0, '2019-11-18', '2021-11-18', 2, 'SENTOT HERY', '2000-03-04', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('139/CAL', 'CALIBRATION STANDARD', 'QUAD-TECH', '800064-69', '7204770', 0, '2019-07-08', '2021-07-08', 2, 'SENTOT HERY', '2000-03-05', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('140/CAL', 'REFFERENCE DIVIDER', 'FLUKE', '752A', '6780202', 0, '2019-04-23', '2021-04-23', 2, 'SENTOT HERY', '2000-03-06', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('141/CAL', 'AC/DC TRANSFER STANDARD', 'FLUKE', '792A', '6765001', 1, '2015-04-03', '2017-04-03', 2, 'SENTOT HERY', '2000-03-07', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('142/CAL', 'DC VOLTAGE REFF STD.', 'WAVETEK', '4910', '33957', 0, '2019-04-23', '2021-04-23', 2, 'SENTOT HERY', '2000-03-08', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('143/CAL', 'SYNT/ FUNCTION GENERATOR', 'HP', '3325B', '2847A13258', 0, '2017-10-25', '2019-10-25', 2, 'SENTOT HERY', '2000-03-09', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('144/CAL', 'UNIVERSAL TIME INTERVAL COUNTER', 'HP', '5370B', '2904A02827', 0, '2018-08-03', '2020-08-03', 2, 'SENTOT HERY', '2000-03-10', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('145/CAL', 'THERMO HIGROMETER', 'HISAMATSU', 'TN-2500', '4556', 0, '2018-03-22', '2020-03-22', 2, 'SENTOT HERY', '2000-03-11', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('146/CAL', 'SWEEP OSCILLATOR', 'HP', '8350 B', '3241A16772', 1, '2016-12-23', '2017-12-23', 1, 'SENTOT HERY', '2000-03-12', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('148/CAL', 'CALIBRATION SYSTEM', 'WAVETEK', '9100', '40766', 0, '2019-11-19', '2021-11-19', 2, 'SENTOT HERY', '2000-03-13', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('149/CAL', 'SIGNAL GENERATOR', 'HP', '8656 B', '333414996', 0, '2018-05-31', '2019-05-31', 1, 'SENTOT HERY', '2000-03-14', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('150/CAL', 'POWER SENSOR', 'HP', '8481H', '2237A06238', 0, '2018-04-05', '2020-04-05', 2, 'SENTOT HERY', '2000-03-15', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('151/CAL', 'POWER SENSOR', 'HP', '8481A', '2237A35799', 0, '2019-11-14', '2021-11-14', 2, 'SENTOT HERY', '2000-03-16', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('152/CAL', 'POWER SENSOR', 'HP', '8483A', '2329A02232', 0, '2018-04-05', '2020-04-05', 2, 'SENTOT HERY', '2000-03-17', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('153/CAL', 'POWER SENSOR', 'HP', '8481D', '2928A03960', 0, '2019-11-14', '2021-11-14', 2, 'SENTOT HERY', '2000-03-18', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('154/CAL', 'POWER SENSOR', 'HP', '8485A', '3318A16530', 1, '2018-05-08', '2020-05-08', 2, 'SENTOT HERY', '2000-03-19', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('156/CAL', 'DUAL DIRECTIONAL COUPLER', 'HP', '778D', '17275', 0, '2018-10-16', '2021-10-16', 3, 'SENTOT HERY', '2000-03-20', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('157/CAL', 'DUAL DIRECTIONAL COUPLER', 'HP', '772D', '2839A00843', 0, '2017-03-30', '2020-03-30', 3, 'SENTOT HERY', '2000-03-21', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('158/CAL', 'POWER SENSOR', 'HP', '8482A', 'US37290006', 0, '2018-03-23', '2020-03-23', 2, 'SENTOT HERY', '2000-03-22', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('159/CAL', '50 OHM TERMINATION', 'SUHNER', '15W DC-10G', '6515.01B', 0, '2019-07-08', '2021-07-08', 2, 'SENTOT HERY', '2000-03-23', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('160/CAL', 'MICROWAVE SYNTH. GENERATOR', 'GIGA-TRONICS', '12720A', '22005', 0, '2019-08-19', '2020-08-19', 1, 'SENTOT HERY', '2000-03-24', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('161/CAL', 'DIGITAL MULTIMETER', 'IWATSU', 'VOAC 92', '21701', 0, '2019-09-09', '2020-09-09', 1, 'SENTOT HERY', '2000-03-25', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('162/CAL', 'DIGITAL MULTIMETER', 'IWATSU', 'VOAC 92', '21706', 0, '2019-09-09', '2020-09-09', 1, 'SENTOT HERY', '2000-03-26', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('164/CAL', 'AC VOLTMETER', 'YOKOGAWA', '235300-80-13', '60LH0860', 0, '2019-09-11', '2020-09-11', 1, 'SENTOT HERY', '2000-03-27', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('165/CAL', 'AC VOLTMETER', 'YOKOGAWA', '235300-80-13', '60LH0861', 0, '2019-09-11', '2020-09-11', 1, 'SENTOT HERY', '2000-03-28', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('166/CAL', 'AC VOLTMETER ', 'YOKOGAWA ', '235300-80-13', '60LH0862', 0, '2019-09-11', '2020-09-11', 1, 'SENTOT HERY', '2000-03-29', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('167/CAL', 'DECADE RESISTANCE BOX', 'YOKOGAWA', '2793-01', '60VX0222', 0, '2017-10-25', '2019-10-25', 2, 'SENTOT HERY', '2000-03-30', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('168/CAL', 'DECADE RESISTANCE BOX', 'YOKOGAWA', '2786-20', '60VU1118', 0, '2019-04-23', '2021-04-23', 2, 'SENTOT HERY', '2000-03-31', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('169/CAL', 'DIGITAL THERMOMETER', 'YOKOGAWA', 'TX10-03', '900417', 0, '2018-03-12', '2020-03-12', 2, 'SENTOT HERY', '2000-04-01', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('171/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-600/75', 'CN-0001', 0, '2019-04-22', '2021-04-22', 2, 'SENTOT HERY', '2000-04-02', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('172/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-75/75', 'CI-0010', 0, '2019-04-16', '2021-04-16', 2, 'SENTOT HERY', '2000-04-03', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('173/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-135/75', 'DF-0007', 0, '2019-04-22', '2021-04-22', 2, 'SENTOT HERY', '2000-04-04', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('174/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-120/75', 'CT-0011', 0, '2019-04-16', '2021-04-16', 2, 'SENTOT HERY', '2000-04-05', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('175/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-124/75', 'CM-0005', 0, '2019-04-16', '2021-04-16', 2, 'SENTOT HERY', '2000-04-06', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('176/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-150/75', 'CO-0014', 0, '2019-04-16', '2021-04-16', 2, 'SENTOT HERY', '2000-04-07', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('177/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-50/75', 'DG-001', 0, '2019-04-16', '2021-04-16', 2, 'SENTOT HERY', '2000-04-08', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('178/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-100/75', 'DB-0007', 0, '2019-04-16', '2021-04-16', 2, 'SENTOT HERY', '2000-04-09', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('179/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-600/50', 'CD-0002', 0, '2019-04-16', '2021-04-16', 2, 'SENTOT HERY', '2000-04-10', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('180/CAL', 'CESIUM BEAM', 'OSCILLOQUARTZ', '3210', '945.321.000.63', 0, '2019-01-15', '2021-01-15', 2, 'SENTOT HERY', '2000-04-11', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('181/CAL', 'SYNCRONISATION TEST SET', 'OSCILLOQUARTZ', '5565', '945,556,502', 0, '2018-08-07', '2020-08-07', 2, 'SENTOT HERY', '2000-04-12', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('182/CAL', 'SIGNAL GENERATOR', 'HP', '8648 B', '3537AO1287', 0, '2019-09-12', '2020-09-12', 1, 'SENTOT HERY', '2000-04-13', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('184/CAL', 'THERMOHYGROMETER', 'CENTER-314', '314', '20306895', 0, '2018-03-15', '2020-03-15', 2, 'SENTOT HERY', '2000-04-14', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('186/CAL', 'CLAMP METER KEW SNAP', 'KYORITSU', '2904', '905563', 0, '2019-09-10', '2020-09-10', 1, 'SENTOT HERY', '2000-04-15', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('187/CAL', 'HIGH VOLTAGE DIGITAL METER', 'KIKUSUI', '149-10A', 'JC003087', 0, '2019-02-26', '2020-02-26', 1, 'SENTOT HERY', '2000-04-16', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('188/CAL', 'HIGH RESISTANCE DECADE SUBSTITUTER', 'IET', 'HRRS-Q-7-100-5KV', 'B1-0416034', 0, '2019-03-26', '2021-03-26', 2, 'SENTOT HERY', '2000-04-17', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('189/CAL', 'WITHSTANDING VOLTAGE TESTER', 'KIKUSUI', 'TOS5051', 'JD000740', 0, '2019-09-12', '2020-09-12', 1, 'SENTOT HERY', '2000-04-18', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('190/CAL', 'FREQUENCY STANDARD', 'SCHOMANDL', 'FN-GPS/R', '10001', 1, '2012-08-31', '2017-08-31', 5, 'SENTOT HERY', '2000-04-19', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('191/CAL', 'SELECTIVE LEVEL MEASURINGH SET', 'WG', 'PSM-139', 'CF-0041', 0, '2019-09-13', '2020-09-13', 1, 'SENTOT HERY', '2000-04-20', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('192/CAL', 'OSCILLOSCOPE', 'TEKTRONIK', 'TDS 3052B', 'C010090', 0, '2019-09-09', '2020-09-09', 1, 'SENTOT HERY', '2000-04-21', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('193/CAL', 'HIGH VOLTAGE DIGITAL PROBE ', 'ROSS', 'VMP120GH-C-ALF', '070215-6', 0, '2018-10-26', '2022-10-26', 4, 'SENTOT HERY', '2000-04-22', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('194/CAL', 'RF STEP ATTENUATOR (110 Db)', 'AGILENT', '8496 B', 'MY42145654', 0, '2019-01-29', '2020-01-29', 1, 'SENTOT HERY', '2000-04-23', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('195/CAL', 'RF STEP ATTENUATOR (11 Db)', 'AGILENT', '8494 B', 'MY42149296', 0, '2017-10-13', '2018-10-13', 1, 'SENTOT HERY', '2000-04-24', 6, 1, 'INTERNAL', '', '', 'test.jpg'),
('196/CAL', 'TERMO-HIGROMETER', 'VICTOR', 'HTC-1', '-', 0, '2018-07-31', '2019-07-31', 1, 'SENTOT HERY', '2000-04-25', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('197/CAL', 'TERMO-HIGROMETER', 'VICTOR', 'HTC-1', '-', 0, '2018-07-31', '2019-07-31', 1, 'SENTOT HERY', '2000-04-26', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('198/CAL', 'TERMO-HIGROMETER', 'ELITECH', 'RC-4HC', '-', 0, '2018-08-02', '2019-08-02', 1, 'SENTOT HERY', '2000-04-27', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('199/CAL', 'RUBIDIUM FREQUENCY STANDARD', 'PENDULUM', '12R', '452029', 0, '2019-08-13', '2021-08-13', 2, 'SENTOT HERY', '2000-04-28', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('200/CAL', 'ADVANCED MULTI PRODUCT CALIBRATOR', 'TRANSMILLE', '4015', 'Y1269E18', 0, '2019-09-03', '2021-09-03', 2, 'SENTOT HERY', '2000-04-29', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('201/CAL', 'POWER METER ', 'ANRITSU', 'ML2437A', '1922004', 0, '-', '-', 1, 'SENTOT HERY', '2000-04-30', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('202/CAL', 'POWER SENSOR (10MHz to 32 GHz, 50?, -70 to +20dBm)', 'ANRITSU', 'MA2473D', '1922004', 0, '-', '-', 1, 'SENTOT HERY', '2000-05-01', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('203/CAL', 'MICROWAVE FREQUENCY COUNTER ', 'HP', '5350 B', '2098A02285', 0, '2019-04-18', '2021-04-18', 2, 'SENTOT HERY', '2000-05-02', 6, 1, 'EXTERNAL', '', '', 'test.jpg'),
('204/CAL', 'MICROWAVE COUNTER / ANALYZER', 'PENDULUM', 'CNT-90XL', '969631', 0, '-', '-', 2, 'SENTOT HERY', '2000-05-03', 6, 1, 'EXTERNAL', '', '', 'test.jpg');

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
  `reference_id` varchar(24) NOT NULL,
  `test_engineer_id` varchar(11) NOT NULL,
  `cal_step_id` varchar(11) NOT NULL,
  `message` text,
  `created` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `reference_id`, `test_engineer_id`, `cal_step_id`, `message`, `created`) VALUES
('H1E69KFPCO', '012/CAB', '970037', 'DEV2', '', '2020-04-19T16:31:34.808Z'),
('H1E69KJEJN', '022/132/QA/2020', '970037', 'REQ1', '', '2020-04-19T16:33:34.839Z'),
('H1E6H6EF3G', '022/132/QA/2020', '970037', 'REQQA2', 'prfkt', '2020-04-22T15:00:06.896Z'),
('H1E6H7G8FK', '022/132/QA/2020', '970037', 'REQQA3', 'proceed', '2020-04-22T15:18:34.228Z');

-- --------------------------------------------------------

--
-- Table structure for table `measuring_equipment`
--

CREATE TABLE `measuring_equipment` (
  `id` varchar(11) NOT NULL,
  `request_id` varchar(15) NOT NULL,
  `device_name` text NOT NULL,
  `manufacturer` text NOT NULL,
  `model` text NOT NULL,
  `serial_number` text NOT NULL,
  `device_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `procedures`
--

CREATE TABLE `procedures` (
  `id` varchar(20) NOT NULL,
  `name` text NOT NULL,
  `effective_date` varchar(24) NOT NULL,
  `pic` varchar(20) NOT NULL,
  `version` varchar(10) NOT NULL,
  `file` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `procedures`
--

INSERT INTO `procedures` (`id`, `name`, `effective_date`, `pic`, `version`, `file`) VALUES
('PM/TLKM Bag-B', 'Panduan Mutu Laboratorium Quality Assurance ( B. Daftar Penerima Notifikasi, D. Daftar Isi)', '2019-11-06', 'EGM-DDS', '2', 'PMTLKM-BagBD-v02--Panduan-Mutu-Lab-QA-Penerima-Notifikasi-dan-Daftar-Isi.pdf'),
('PM/TLKM Bag-C', 'Panduan Mutu Laboratorium Quality Assurance ( C. Rekaman Riwayat Dokumen )', '2019-11-06', 'EGM-DDS', '3', 'PMTLKM-BagC-v03--Panduan-Mutu-Lab-QA-Rekaman-Riwayat-Dokumen.pdf'),
('PM/TLKM Ch-1', 'Panduan Mutu Laboratorium Quality Assurance ( 1. Lingkup dan Kebijakan )', '2019-11-06', 'EGM-DDS', '2', 'PMTLKM-Chapt1-v02--Lingkup-dan-Kebijakan.pdf'),
('PM/TLKM Ch-2', 'Panduan Mutu Laboratorium Quality Assurance ( 2. Acuan Normatif )', '2019-11-06', 'EGM-DDS', '2', 'PMTLKM-Chapt2-v02--Acuan-Normatif.pdf'),
('PM/TLKM Ch-3', 'Panduan Mutu Laboratorium Quality Assurance ( 3. Singkatan, Istilah, dan Definisi )', '2019-11-06', 'EGM-DDS', '2', 'PMTLKM-Chapt3-v02--Singkatan-Istilah-dan-Definisi.pdf'),
('PM/TLKM Ch-4', 'Panduan Mutu Laboratorium Quality Assurance ( 4. Persyaratan Umum )', '2019-11-06', 'EGM-DDS', '2', 'PMTLKM-Chapt4-v02--Persyaratan-Umum.pdf'),
('PM/TLKM Ch-5', 'Panduan Mutu Laboratorium Quality Assurance ( 5. Persyaratan Struktural )', '2019-11-06', 'EGM-DDS', '2', 'PMTLKM-Chapt5-v02--Persyaratan-Struktural.pdf'),
('PM/TLKM Ch-6', 'Panduan Mutu Laboratorium Quality Assurance ( 6. Persyaratan Sumber Daya )', '2019-11-06', 'EGM-DDS', '3', 'PMTLKM-Chapt6-v03--Persyaratan-Sumber-Daya.pdf'),
('PM/TLKM Ch-7', 'Panduan Mutu Laboratorium Quality Assurance ( 7. Persyaratan Proses )', '2019-11-06', 'EGM-DDS', '2', 'PMTLKM-Chapt7-v02--Persyaratan-Proses.pdf'),
('PM/TLKM Ch-8', 'Panduan Mutu Laboratorium Quality Assurance ( 8. Persyaratan Sistem Manajemen )', '2019-11-06', 'EGM-DDS', '2', 'PMTLKM-Chapt8-v02--Persyaratan-Sistem-Manajemen.pdf'),
('PM/TLKM Lp-1', 'Panduan Mutu Laboratorium Quality Assurance ( L1. Dokumen Terkait )', '2019-11-06', 'EGM-DDS', '3', 'PMTLKM-Lamp1-v03--Dokumen-Terkait.pdf'),
('PM/TLKM Lp-2', 'Panduan Mutu Laboratorium Quality Assurance ( L2. Penandatanganan Laporan )', '2019-11-06', 'EGM-DDS', '2', 'PMTLKM-Lamp2-v02--Penandatanganan-Laporan.pdf'),
('PM/TLKM Lp-3', 'Panduan Mutu Laboratorium Quality Assurance ( L3. Layout Ruangan Lab QA )', '2019-11-06', 'EGM-DDS', '2', 'PMTLKM-Lamp3-v02--Layout-Ruangan-Lab-QA.pdf'),
('PM/TLKM Lp-4', 'Panduan Mutu Laboratorium Quality Assurance ( L4. Persyaratan Umum )', '2019-11-06', 'EGM-DDS', '2', 'PMTLKM-Lamp4-v02--Struktur-Organisasi-DDS.pdf'),
('PM/TLKM Lp-5', 'Panduan Mutu Laboratorium Quality Assurance ( L5. Akreditasi Lab Kalibrasi LK-002-IDN )', '2019-11-06', 'EGM-DDS', '2', 'PMTLKM-Lamp7-v02--Akreditasi-SDPPI-IDN-002-2019.pdf'),
('PM/TLKM Lp-6', 'Panduan Mutu Laboratorium Quality Assurance ( L6. Akreditasi Lab Pengujian LP-490-IDN )', '2019-11-06', 'EGM-DDS', '2', 'PMTLKM-Lamp6-v02--Akreditasi-Lab-Pengujian-LP-490-IDN-2566.pdf'),
('PM/TLKM Lp-7', 'Panduan Mutu Laboratorium Quality Assurance ( L7. Akreditasi SDPPI ( IDN-002/2019 )', '2019-11-06', 'EGM-DDS', '1', 'PMTLKM-Lamp5-v02--Akreditasi-Lab-Kalibrasi-LK-002-IDN.pdf'),
('TLKM/I/DEV/001', 'Panduan Umum Pengujian', '2018-10-23', 'Mgr-DEQA', '1', 'TLKMIDEV001-v01--Panduan-Umum-Pengujian.pdf'),
('TLKM/I/DEV/002', 'Modem (2 wires), S/N Ratio, Transmit, and Receive Levels Test', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/003', 'Modem (4 wires), S/N Ratio, Transmit, dan Receive Levels Test', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/004', 'Modem, Availability Test Against DC Line Supply', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/005', 'Modem Leased Line, Impedance dan Return Loss Test', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/006', 'Facsimile, Transmit, and Receive Levels Test', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/007', 'Uji Pemeriksaan Label Perangkat Terminal dan Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/008', 'Uji Operasi Perangkat Facsimile', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/009', 'Pengukuran Sinyal CNG Perangkat Facsimile', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/010', 'Pemeriksaan Fasilitas Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/011', 'Wrist Strap Check', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/012', 'Pengujian Kebocoran Tegangan Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/013', 'Uji Operasi Perangkat Modem Data', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/014', 'Validasi Software Data Line Analyzer Siemens K1190', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/015', 'Validasi-Software-Oscilloscope-HP-54520A', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/016', 'Validasi Software Consultronics TCS-500', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/017', 'Validasi Software Telephone Test Set Microtronix Model 60', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/018', 'Validasi Software Telephone Set Tester HE-212', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/019', 'Validasi Software PCM Test Set Siemens P2112', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/020', 'Pemeriksaan-Fraud-Fungsi-PDPT', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/021', 'Pengujian Catu Operasi Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/022', 'Pengujian Unit Pilih DP Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/023', 'Pengujian Unit Pilih DTMF Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/024', 'Pengujian Impedansi Keadaan Off-Hook Arus Searah Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/025', 'Pengujian Impedansi Keadaan Off-Hook Frek 1000Hz Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/026', 'Pengujian Impedansi Keadaan Bebas (On-Hook) Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/027', 'Pengujian Return Loss Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/028', 'Pengujian Tahanan Isolasi (Kebocoran) Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/029', 'Pengujian Noise Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/030', 'Pengujian Deteksi Sinyal Panggil (Bel) Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/031', 'Pengujian Elektro Akustik Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/032', 'Pengujian Deteksi Cashing Signal 16kHz Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/033', 'Pengujian Deteksi Cashing Signal Reverse Polarity Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/034', 'Pengujian Deteksi Cashing Signal 50Hz Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/035', 'Pengujian Interferensi Gelombang Radio ke Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/036', 'Uji Operasi Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/037', 'Terminal Equipment Transmit and Receive Levels Test', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/038', 'Pengujian Pendeteksian DTMF', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/039', 'Pengujian Catu Operasi Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/040', 'Pengujian Unit Pilih DP Perangkat Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/041', 'Pengujian Unit Pilih DTMF Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/042', 'Pengujian Impedansi Off-Hook Utk Arus Searah Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/043', 'Pengujian Impedansi Off-Hook untuk Frekuensi 1000Hz Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/044', 'Pengujian Redaman Eksternal Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/045', 'Pengujian Return Loss Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/046', 'Pengujian Redaman Bicara Silang Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/047', 'Pengujian Kemampuan Sistem Switching terhadap Kondisi Saluran', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/048', 'Pengujian Pembangkit Sinyal Bel Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/049', 'Pengujian Dial Tone Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/050', 'Pengujian Ring Back Tone Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/051', 'Pengujian Busy Tone Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/052', 'Pengujian Tahanan Isolasi (Kebocoran) Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/053', 'Pengujian Kebocoran Tegangan Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/054', 'Pengujian Impedansi Keadaan On-Hook Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/055', 'Pengujian Kemampuan Sistem Switching Terhadap Sinyal Panggil', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/056', 'Pengujian Elektro Akustik Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/057', 'Pengujian Noise Ripple Sistem Switching', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/058', 'Pengujian Kepekaan Sensitivitas Switching thd Kondisi Saluran Pokok', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/059', 'Pengujian Pencatatan Data Pembicaraan Per PDPT', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/060', 'Pengujian Fungsi Pensinyalan Panggilan Keluar Per PDPT', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/061', 'Pengujian Noise Riple Unit Catu Daya Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/062', 'Pengujian Unit Catu Daya Perangkat Terminal', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/063', 'Panduan Umum Opini Dalam Pengujian', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/064', 'Pemeriksaan Alat Ukur di Laboratorium', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/065', 'Pengujian Bit Error Rate (BER)', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/066', 'Pengujian Perangkat Modem 2B1Q', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/067', 'Pengujian Chamber', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/068', 'Pengujian Interface Analog Menggunakan PSTN 21', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/069', 'Pengujian Arus DC Selama Pengebelan', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/070', 'Regular Check Telephone Test Set Microtronix M-60', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/071', 'Regular Check Data Line Analyzer Siemens K-1190', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/072', 'Regular Check PCM Test SetSiemens P2112', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/073', 'Regular Check Telephone SetTester HE-212', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/074', 'Regular Check DTMF Generator HE-305', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/075', 'Regular Check Attenuator', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/076', 'Regular Check Multimeter', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/077', 'Regular Check Oscilloscope', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/078', 'Regular Check Testel-510', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/079', 'Regular Check Insulation Meter', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/080', 'Regular Check Signal Sequence Relay', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/081', 'Regular Check 16kHz Payphone Tester', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/082', 'Regular Check Level Measurement Set Selective Level Meter', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/083', 'Regular Check Modem and Fax Test System Consultronics', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/084', 'Regular Check Test Feed Coil HE-215', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/085', 'Regular Check Power Supply', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/086', 'Regular Check Spectrum Analyzer', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/087', 'Regular Check Balancing Transformer', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/088', 'Regular Check 600Ohm Terminator', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/089', 'Regular Check Decade Resistor', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/090', 'Regular Check Transmission Test Set', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/091', 'Regular Check Level Generator', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/092', 'Regular Check Selective Level Meter', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/093', 'Regular Check Data Line Analyzer WG DLA-9D', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/094', 'Regular Check DC Loop Holding Circuit', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/095', 'Regular Check Signal Generator AM dan FM', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/096', 'Pengujian Code Delay Time Perangkat Gateway VoIP Gatekeeper', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/097', 'Pengujian Round Trip Latency', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/098', 'Regular Check Noise Generator', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/099', 'Pengujian Jitter VoIP', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/100', 'Pengujian Audio Compression Gateway VoIP Gatekeeper', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/101', 'Pengujian Loss Packet VoIP', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/102', 'PrismLite RadCom Conf dan OPU Fast LAN Line Interface Module (LIM) for VoIP', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/103', 'Panduan Verifikasi Antarmuka Ethernet (10/100/1000Mbps) IXIA Optixia XM2', '2019-03-28', 'Mgr-DEQA', '2', ''),
('TLKM/I/DEV/104', 'Pengujian Link Aggregation (LAG) Perangkat Switch Ethernet', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/105', 'Pengujian Sistem Akses - IP Address Filtering, PSE', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/106', 'Pengujian Sistem Akses - MAC Address Filtering, PSE', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/107', 'Pengujian Spanning Tree Protocol (STP), PSE', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/108', 'Pengujian Switching Engine, PSE', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/109', 'Pengujian Temperatur Kerja, PSE', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/110', 'Pengujian Total Kebisingan Suara (Audible Noise), PSE', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/111', 'Pengujian VLAN 802.1Q Tagging, PSE', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/112', 'Pengujian VLAN Priority 802.1P, PSE', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/113', 'Panduan Umum Pengoperasian IXIA Optixia XM2', '2019-01-09', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/114', 'Pengujian Performansi Port Ethernet (RFC2544) Perangkat ONT (Optical Network Termination) Retail', '2019-01-09', 'Mgr-DEQA', '1', ''),
('TLKM/I/DEV/115', 'Pengujian Performansi Port Ethernet (RFC2544) Perangkat Switch Ethernet', '2019-01-09', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/001', 'Panduan Umum Pengujian', '2018-10-23', 'Mgr-DEQA', '1', 'TLKMIENE001-v01--Panduan-Umum-Pengujian.pdf'),
('TLKM/I/ENE/002', 'Pengujian Ketahanan Bentur', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/003', 'Pengujian Kapasitas Batere', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/004', 'Pengujian Efisiensi Batere', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/005', 'Pengujian Tegangan dan Arus Floating', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/006', 'Pengujian Tegangan Tembus', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/007', 'Pengujian Tegangan Equalizing', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/008', 'Pengujian Pengosongan Cepat', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/009', 'Pengujian Operasi Charge Discharge', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/010', 'Pengujian Charge Discharge Batere Starting Engine', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/011', 'Pengaturan Arus Kejut', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/012', 'Pengaturan Tegangan Floating dan Equalizing', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/013', 'Pengujian Regulasi Beban', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/014', 'Pengujian Harmonisa', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/015', 'Pengujian Fungsi dan Operasi Manual Otomatis Equalizing', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/016', 'Pengujian Daya Guna Rectifier dan UPS', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/017', 'Pengujian Power Factor', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/018', 'Pengujian Pembatas Tegangan Rendah', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/019', 'Pengujian Pembatas Arus Keluaran', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/020', 'Pengujian Power Walk In', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/021', 'Pengujian Kapasitas Rectifier dan UPS', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/022', 'Pengujian Regulasi Catuan Input', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/023', 'Pengujian Tegangan Ripple dan Noise', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/024', 'Pengujian Pembatas Tegangan Tinggi', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/025', 'Pengujian Load Sharing', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/026', 'Pengujian LVD (Low Voltage Disconnection)', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/027', 'Pengaturan Tegangan Keluaran dan Regulasi Beban UPS', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/028', 'Pengujian Beban Lebih Pada UPS', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/029', 'Pengujian Sistem Operasi UPS', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/030', 'Pengujian Manual dan Automatic Bypass Switch', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/031', 'Pengujian Beban Tidak Seimbang Pada UPS 3-Phase', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/032', 'Pengujian Pengontrol Phase', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/033', 'Pengujian Alat Ukur Panel', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/034', 'Pengujian Kebisingan (Audible Noise)', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/035', 'Pembuatan Elektrolit (H2SO4)', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/036', 'Validasi Software Life Cycle Battery Tester', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/037', 'Pemeriksaan Konstruksi Rectifier', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/038', 'Pemeriksaan Konstruksi UPS', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/039', 'Pembuatan Program Bitrode', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/040', 'Panduan Penanganan Aluk untuk Pengujian di Luar Lab DEQA', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/041', 'Jaminan Umum Hasil Pengujian', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/042', 'Pedoman Umum Regular Check', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/043', 'Pemeriksaan Alat Ukur yang Akan Digunakan di Luar Lab DEQA', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/044', 'Regular Check Digital Multimeter', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/045', 'Regular Check LCN Bitrode', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/046', 'Regular Check Current Shunt', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/047', 'Regular Check Power Harmonic Analyzer', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/048', 'Regular Check Reserve Capacity Tester', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/049', 'Regular Check Stop Watch', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/050', 'Regular Check High Port Tester', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/ENE/051', 'Regular Check Psophometer', '2018-10-23', 'Mgr-DEQA', '1', ''),
('TLKM/I/KAB/001', 'Pengujian Ketahanan terhadap Beban Statis', '2018-10-23', 'Mgr-IQA', '1', 'TLKMIKAB001_v01_Pengujian-Ketahanan-thd-Beban-Statis.pdf'),
('TLKM/I/KAB/002', 'Pengujian Bursting Strength', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/003', 'Pengujian Celup Air', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/004', 'Pengujian Ketahanan terhadap Arus Surja', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/005', 'Pengujian Bahan Perekat', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/006', 'Pengujian Dimensi Kabel dan Accesories', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/007', 'Pengujian Ketahanan terhadap Panas', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/008', 'Pengujian Jatuh Tiang Telepon Besi', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/009', 'Pengujian Kapasitansi Bersama', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/010', 'Pengujian Kadar Jelaga dalam PE', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/011', 'Pengujian Pengerutan PE pada 100dC', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/012', 'Pengujian Bocor Lembab', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/013', 'Pengujian Lengkung Tiang Telepon Besi', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/014', 'Pengujian Konstanta Dielektrikum', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/015', 'Pengujian Kemampuan Pakai Ulang Blok Terminal', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/016', 'Pengujian Ketahanan Terhadap Panas Kering', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/017', 'Pengujian Ketahanan Terhadap Puntiran', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/018', 'Pengujian Redaman Saluran Kabel PCM', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/019', 'Pengujian Ketahanan Terhadap Hablur Garam', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/020', 'Pengujian Ketahanan terhadap Perubahan Suhu', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/021', 'Pengujian Ketahanan terhadap Siklus Suhu Lembab untuk Konektor', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/022', 'Pengujian Ketahanan Terhadap Siklus Suhu Untuk Konektor', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/023', 'Pengujian Tahanan Isolasi', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/024', 'Pengujian Tahanan Arus Searah', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/025', 'Pengujian Tahanan Kontak Blok Terminal', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/026', 'Pengujian Ketidakseimbangan Kapasitansi', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/027', 'Ketidakseimbangan Tahanan Arus Searah Pasangan Penghantar', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/028', 'Pengujian Tegangan Tembus terhadap Sarana Sambung Kabel', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/029', 'Pengujian Tegangan Tembus Kabel', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/030', 'Pengujian Ketahanan Terhadap Tekanan Udara', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/031', 'Pengujian Ketahanan Terhadap Tekukan', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/032', 'Pengujian Tembus Air Untuk Kabel Jelly', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/033', 'Pengujian Kejut Termis untuk Konektor', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/034', 'Pengujian Ketahanan terhadap Arus Bolak Balik', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/035', 'Pengujian Kuat Tarik PE', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/036', 'Pengujian Kuat Tarik Pipa PVC PE', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/037', 'Pengujian Ketahanan terhadap Arus Beban', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/038', 'Pengujian Getar', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/039', 'Ketahanan terhadap Benturan untuk KP, RK, SSK, atau KTB', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/040', 'Pengujian Kedap Air', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/041', 'Pengujian Tarik Logam', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/042', 'Pengujian Ketahanan Terhadap Tegangan Bolak-Balik', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/043', 'Pengujian Kuat Lentur Tiang Telepon Beton', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/044', 'Pengujian Pipih (Flatening)', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/045', 'Pengujian Ketahanan terhadap Tegangan Surja', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/046', 'Pengujian Tembus Kerucut untuk Jelly', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/047', 'Pengujian Kekentalan Jelly', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/048', 'Pengujian Titik Tetes Jelly', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/049', 'Pengujian Titik Nyala Jelly', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/050', 'Pengujian Density Jelly dan PE', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/051', 'Pengujian Ketahanan terhadap Kelembaban', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/052', 'Pengujian Kuat Dielektrikum', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/053', 'Pengujian Titik Lunak PE', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/054', 'Pengujian Ketahanan Terhadap Tekanan Udara Untuk Pipa Sub Duct HDPE', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/055', 'Pengujian Bending Sub Duct', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/056', 'Pengujian Penuaan Termis SSK', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/057', 'Pengujian Daya Serap Air untuk SSK', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/058', 'Pengujian Ketahanan terhadap Larutan Kimia untuk SSK', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/059', 'Ketentuan Global Suhu, Humidity, dan Jumlah Sample', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/060', 'Pengujian Wrist Strap', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/061', 'Pengukuran Tahanan Jenis PE dan Jelly', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/062', 'Pengukuran Geometri Fiber Optic', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/063', 'Pengukuran Spectral Attenuation Fiber Optic', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/064', 'Pengukuran Attenuation Fiber Optic', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/065', 'Pengukuran Chromatic Dispersion Fiber Optic', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/066', 'Pengujian Mekanik Kabel Fiber Optic', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/067', 'Panduan Umum Opini', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/068', 'Pengujian Koefisien Friksi Pipa Sub Duct HDPE', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/069', 'Pengujian Ketahanan Tumbukan Pipa HDPE', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/070', 'Pengujian Tarikan dan Pemuluran Pipa Sub Duct HDPE', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/071', 'Panduan Umum Pengujian Sistem Komputerisasi', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/072', 'Menentukan Braid Coverage Kabel Koaksial Drop', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/073', 'Pengujian Pengerutan Longitudinal Selubung PE Kabel Koaksial HFC', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/074', 'Pengujian Ketahanan Korosi Kabel Koaksial HFC', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/075', 'Pengujian Polarization Mode Dispersion (PMD)', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/076', 'Pengukuran Redaman dan Panjang FO dengan Mini OTDR', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/077', 'Pengukuran Panjang Kabel Metal dengan MTDR', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/078', 'Pengukuran Geometry FO Menggunakan OFGS 2400 Photon Kinetics', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/079', 'Pengukuran Insertion Loss Splitter dengan OIL Tester', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/080', 'Pengukuran Return Loss Splitter dengan Optical Return Loss Tester', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAB/081', 'Pengukuran Attenuation dengan OTDR PK-8000', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/001', 'Kalibrasi Generator', '2019-10-10', 'Mgr-IQA', '2', 'TLKMIKAL001-v02--Kalibrasi-Generator.pdf'),
('TLKM/I/KAL/002', 'Kalibrasi Power Meter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/003', 'Kalibrasi Spectrum Analyzer', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/004', 'Kalibrasi Multimeter', '2019-10-10', 'Mgr-IQA', '2', ''),
('TLKM/I/KAL/005', 'Kalibrasi Power Supply', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/006', 'Kalibrasi Oscilloscope', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/007', 'Kalibrasi Generator Pulsa', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/008', 'Kalibrasi Frequency Counter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/009', 'Kalibrasi Resistor', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/010', 'Kalibrasi Capacitor', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/011', 'Panduan Persiapan dan Proses Kalibrasi', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/012', 'Kalibrasi Induktor', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/013', 'Spesifikasi Generik', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/014', 'Pengukuran Frekuensi Error', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/015', 'Prosedur Pemeriksaan Berkala', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/016', 'Kalibrasi Arus AC/DC', '2019-10-10', 'Mgr-IQA', '2', ''),
('TLKM/I/KAL/017', 'Kalibrasi LCR Meter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/018', 'Kalibrasi Earth Tester', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/019', 'Kalibrasi Wheatstone Bridge', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/020', 'Kalibrasi Insulation Tester', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/021', 'Kalibrasi Directional Coupler', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/022', 'Kalibrasi Matching Impedance', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/023', 'Kalibrasi Attenuator', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/024', 'Kalibrasi Terminator', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/025', 'Kalibrasi Range Calibrator HP 11683A', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/026', 'Kalibrasi Subscriber Line Measuring Set (Sulim X200 400) STDI EWSD', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/027', 'Kalibrasi Tegangan DC AC Arus DC AC Tahanan DC dgn Multimeter HP3458A', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/028', 'Kalibrasi Tegangan AC dgn Standar Transfer ACDC', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/029', 'Kalibrasi Clamp Meter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/030', 'Panduan Persiapan dan Proses Kalibrasi di Lokasi', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/031', 'Kalibrasi AC Resistor', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/032', 'Peta Kendali', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/033', 'Instruksi Kerja Kalibrasi dan Perbaikan', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/KAL/034', 'Instruksi Kerja Penyiapan Sertifikat Kalibrasi', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/001', 'Panduan Umum Pengujian', '2019-12-19', 'Mgr-IQA', '2', 'TLKMITRA001-v02--Panduan-Umum-Pengujian.pdf'),
('TLKM/I/TRA/002', 'Pengukuran Return Loss RF', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/003', 'Pengukuran VSWR', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/004', 'Pengukuran Frekuensi', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/005', 'Pengukuran Daya Pancar', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/006', 'Pengukuran Spurious Emission', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/007', 'Noise Spectrum', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/008', 'Pulse Mask/Kode/Tegangan/Lebar Pulsa', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/009', 'Jitter Product', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/010', 'Jitter Tolerance', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/011', 'Jitter Transfer', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/012', 'Toleransi Redaman', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/013', 'Toleransi Bit Rate', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/014', 'Channel Net Loss', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/015', 'Audio Frekuensi Response', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/016', 'Impedansi Suara', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/017', 'Return Loss', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/018', 'Longitudinal Balance', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/019', 'Idle Channel Noise', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/020', 'Diskriminasi Terhadap Sinyal Input di Luar Band', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/021', 'Sinyal Spurious di Luar Band', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/022', 'Distorsi Kuantisasi', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/023', 'Sinyal Spurious di Dalam Band', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/024', 'Variasi Gain Terhadap Input Level', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/025', 'Cakap Silang Antar Kanal', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/026', 'Loop Resistance', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/027', 'Kepekaan Terhadap Saluran', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/028', 'Kepekaan Terhadap Arus', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/029', 'Tegangan dan Frekuensi Ring Generator', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/030', 'Sensitivitas (Digital)', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/031', 'Group Delay', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/032', 'Bit Rate', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/033', 'Wrist Strap Check', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/034', 'Impedansi RF', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/035', 'Jenis Sinyal Optik', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/036', 'Transmit Output Power', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/037', 'Receiver Sensitivity', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/038', 'Panjang Gelombang Optic', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/039', 'Return Loss 2Mbps', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/040', 'Jitter Generation', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/041', '16kHz Cashing Signal', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/042', 'Terminal STB GSM', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/043', 'Terminal STB CDMA', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/044', 'Chamber', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/045', 'Kemampuan Terhadap Kondisi Saluran', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/046', 'Antar Muka Data n x 64kbit/s', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/047', 'Automatic Laser Shutdown (ALS)', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/048', 'Jitter Kombinasi', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/049', 'Bandwidth', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/050', 'Panduan Umum Opini', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/051', 'Round-Trip Delay', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/052', 'Adaptive Modulation', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/053', 'Frequency Diversity (FD)', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/054', 'Frequency Tolerance', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/055', 'Hot Standby (HSB)', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/056', 'Signal Mask', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/057', 'Modulation Selectable by Software', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/058', 'Automatic Power Control', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/059', 'Power Tolerance', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/060', 'Rx Sensitivity', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/061', 'Space Diversity (SD)', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/062', 'Selectable Channel Bandwidth', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/063', 'IP Throughput Test', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/064', 'IP Latency Test', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/065', 'IP Packet Loss Test', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/066', 'IP Back to Back Test', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/067', 'Ketentuan Pencatatan Suhu, Kelembaban, dan Tegangan Catuan', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/068', 'Instruksi Kerja Pemilihan Sample Uji', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/069', 'Eye Diagram', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/070', 'Side Mode Suppression Ratio', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/071', 'Extinction Ratio', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/072', 'Insertion Loss MUX/DEMUX DWDM', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/073', 'Cross Talk MUX/DEMUX DWDM', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/074', 'Center Wavelength Offset MUX/DEMUX DWDM', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/075', 'Channel Uniformity MUX/DEMUX DWDM', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/076', 'Gain Optical Amplifier', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/077', 'Automatic Protection Switch SDH', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/078', 'ATM Bit Error Rate Test (BERT)', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/079', 'ATM Latency Test without Background Traffic', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/080', 'ATM Latency Test with Background Traffic', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/081', 'ATM Test – Loss of Cell Delineation (LCD)', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/082', 'ATM Test – Traffic Management PVC Connection', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/083', 'ATM Test – Traffic Management SVC Connection', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/084', 'ATM Reliability Test', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/085', 'Optical Spectral Width', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/086', 'Optical Signal to Noise Ratio', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/087', 'Minimum Gain', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/088', 'Minimum Rate Output Power', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/089', 'Variation Power Supply', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/090', 'Total Audible Noise Level (dBA)', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/091', 'Gain Down Converter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/092', 'Gain Up Converter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/093', 'Gain Slope Down Converter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/094', 'Gain Slope Up Converter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/095', 'Intermodulasi Down Converter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/096', 'Intermodulasi Up Converter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/097', 'Ripple Down Converter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/098', 'Ripple Up Converter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/099', 'Stabilitas Gain Down Converter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/100', 'Stabilitas Gain Up Converter', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/101', 'Flatness Gain', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/102', 'Abnormal Frame', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/103', 'Auto Negotiation', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/104', 'Jumbo Frame', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/105', 'MAC Address Static Learning', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/106', 'MAC Address Dynamic Learning', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/107', 'Untagged VLAN', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/108', 'Tagged VLAN', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/109', 'Equivalent Isotropically Radiated Power (EIRP)', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/110', 'Gain Antenna', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/111', 'Impulse Noise', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/112', 'Jumlah Kanal Radio', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/113', 'Sistem MIMO (Multi Level Multi Output)', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/114', 'Maximum MAC Learning', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/115', 'Auto Sense', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/116', 'Uni-cast, Multi-cast, Broad-cast', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/117', 'Multi SSID Based On VLAN', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/118', 'Minimum Gain', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/119', 'Traffic Priority 802.1p', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/120', 'Synchronization Clock Test', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/121', 'Perangkat DWDM With ROADM', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/122', 'Small Metro Ethernet', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/123', 'IOT (Interoperablity) Small Metro Ethernet', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/124', 'Pengukuran WLAN', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/125', 'Pengukuran Bluetooth', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/126', 'Pengukuran Perangkat HF, VHF, dan UHF', '2018-10-23', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/127', 'Pengukuran Antarmuka PON dari OLT', '2019-01-09', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/128', 'Self Verification Alat Ukur Berbasis IP', '2019-04-12', 'Mgr-IQA', '1', ''),
('TLKM/I/TRA/129', 'Pengukuran Loss Kabel/Aksesories RF', '2020-01-10', 'Mgr-IQA', '1', ''),
('TLKM/I/USE/001', 'Instruksi Kerja Penerimaan Perangkat Uji Dari Pelanggan', '2019-01-04', 'Mgr-UREL', '1', 'TLKMIUSE001-v01--IK-Penerimaan-Perangkat-Uji-Dari-Pelanggan.pdf'),
('TLKM/I/USE/002', 'Instruksi Kerja Penerbitan Surat Perintah Kerja (SPK)', '2019-01-04', 'Mgr-UREL', '1', 'TLKMIUSE002-v01--IK-Penerbitan-Surat-Perintah-Kerja-SPK.pdf'),
('TLKM/I/USE/003', 'Instruksi Kerja Pengambilan dan Pengembalian Perangkat Uji Oleh Laboratorium', '2019-01-04', 'Mgr-UREL', '1', 'TLKMIUSE003-v01--IK-Pengambilan-dan-Pengembalian-Perangkat-Uji-.pdf'),
('TLKM/I/USE/004', 'Instruksi Kerja Penyerahan Perangkat Uji Kepada Pelanggan', '2019-01-04', 'Mgr-UREL', '1', 'TLKMIUSE004-v01--IK-Penyerahan-Perangkat-Uji-Kepada-Pelanggan.pdf'),
('TLKM/I/USE/005', 'Instruksi Kerja Permohonan Uji Lokasi', '2019-01-04', 'Mgr-UREL', '1', 'TLKMIUSE005-v01--IK-Permohonan-Uji-Lokasi.pdf'),
('TLKM/TP/DEV/001', 'Optical Network Termination (ONT) Premium', '2019-08-23', 'Mgr-DEQA', '1', ''),
('TLKM/TP/DEV/002', 'Optical Network Termination (ONT) Retail', '2019-08-23', 'Mgr-DEQA', '1', ''),
('TLKM/TP/DEV/003', 'Optical Network Termination (ONT) Backhaul GPON', '2019-08-23', 'Mgr-DEQA', '1', ''),
('TLKM/TP/DEV/004', 'Optical Network Termination (ONT) Enterprise', '2019-08-23', 'Mgr-DEQA', '1', ''),
('TLKM/TP/DEV/005', 'Optical Network Termination (ONT) Enterprise XGS-PON', '2019-08-23', 'Mgr-DEQA', '1', ''),
('TLKM/TP/DEV/006', 'Open ONT (Optical Network Termination) Retail', '2019-08-23', 'Mgr-DEQA', '1', ''),
('TLKM/TP/DEV/007', 'Optical Network Termination (ONT) Bridge for Single Family Unit (SFU)', '2019-08-23', 'Mgr-DEQA', '1', ''),
('TLKM/TP/DEV/008', 'Optical Network Termination (ONT) Backhaul for XGS-PON', '2019-08-23', 'Mgr-DEQA', '1', ''),
('TLKM/TP/TRA/001', 'Open OLT XGS PON', '2019-09-08', 'Mgr-IQA', '1', ''),
('TLKM/TP/TRA/002', 'Pengukuran Radiated Emission EMC', '2019-09-08', 'Mgr-IQA', '1', ''),
('TLKM/TP/TRA/003', 'Pengukuran Conducted Emission EMC', '2019-09-08', 'Mgr-IQA', '1', ''),
('TLKM/TP/TRA/004', 'Pengukuran Radiated Immunity EMC', '2019-09-08', 'Mgr-IQA', '1', ''),
('TLKM/TP/TRA/005', 'Pengukuran Conducted Emission EMC', '2019-09-08', 'Mgr-IQA', '1', ''),
('TLKM01/P ', 'Pengendalian Dokumen Sistem Manajemen', '2018-09-18', 'SM-PIA', '1', 'TLKM01P_v01_Pengendalian-Dokumen-Sistem-Manajemen.pdf'),
('TLKM02/P ', 'Prosedur Tinjauan Permintaan, Tender, dan Kontrak', '2019-10-03', 'Mgr-UREL', '3', 'TLKM02P-v03--Tinjauan-Permintaan-Tender-dan-Kontrak.pdf'),
('TLKM03/P ', 'Prosedur Sub-Kontrak Pengujian', '2018-10-22', 'Mgr-UREL', '1', 'TLKM03P_v01_Prosedur-Sub-Kontrak-Pengujian.pdf'),
('TLKM04/P ', 'Prosedur Keluhan Pelanggann', '2018-10-22', 'Mgr-UREL', '1', 'TLKM04P_v01_Prosedur-Keluhan-Pelanggan.pdf'),
('TLKM05/P ', 'Prosedur Survei Kepuasan Pelanggan', '2018-10-22', 'Mgr-UREL', '1', 'TLKM05P_v01_Prosedur-Survei-Kepuasan-Pelanggan.pdf'),
('TLKM06/P ', 'Prosedur Umum dan Pelaporan Hasil Laboratorium', '2019-04-11', 'SM-PIA', '3', 'TLKM06P-v03--Prosedur-Umum-dan-Pelaporan-Hasil-Laboratorium.pdf'),
('TLKM07/P ', 'Prosedur Tindakan Koreksi, Perbaikan, dan Pencegahan', '2018-10-22', 'SM-PIA', '1', 'TLKM07P_v01_Prosedur-Tindakan-Koreksi-Perbaikan-dan-Pencegahan.pdf'),
('TLKM08/P ', 'Prosedur Validitas Hasil Uji dan Kalibrasi', '2019-04-17', 'SM-PIA', '2', 'TLKM08P-v02--Prosedur-Validitas-Hasil-Uji-dan-Kalibrasi.pdf'),
('TLKM09/P ', 'Prosedur Audit Internal', '2018-10-22', 'SM-PIA', '1', 'TLKM09P_v01_Prosedur-Audit-Internal.pdf'),
('TLKM10/P ', 'Prosedur Tinjauan Manajemen', '2018-10-22', 'SM-PIA', '1', 'TLKM10P_v01_Prosedur-Tinjauan-Manajemen.pdf'),
('TLKM11/P ', 'Prosedur Pengembangan Kompetensi', '2018-10-22', 'SM-PIA', '1', 'TLKM11P_v01_Prosedur-Pengembangan-Kompetensi.pdf'),
('TLKM12/P ', 'Prosedur Penanganan Barang Pengujian dan Kalibrasi', '2019-10-03', 'Mgr-UREL', '3', 'TLKM12P-v03--Penanganan-Barang-Pengujian-dan-Kalibrasi.pdf'),
('TLKM13/P ', 'Prosedur Penanganan Peralatan dan Pengecekan Antara', '2018-10-22', 'SM-PIA', '1', 'TLKM13P-v01--Prosedur-Penanganan-Peralatan-dan-Pengecekan-Antara.pdf'),
('TLKM14/P ', 'Prosedur Evaluasi Ketidakpastian Pengukuran', '2018-10-22', 'SM-PIA', '1', 'TLKM14P-v01--Prosedur-Evaluasi-Ketidakpastian-Pengukuran.pdf'),
('TLKM15/P ', 'Prosedur Seleksi, Verifikasi, dan Metode Validasi', '2018-10-22', 'SM-PIA', '1', 'TLKM15P-v01--Prosedur-Seleksi-Verifikasi-dan-Validasi-Metode.pdf'),
('TLKM16/P ', 'Prosedur Peta Kendali', '2018-10-22', 'SM-PIA', '1', 'TLKM16P-v01--Prosedur-Peta-Kendali.pdf'),
('TLKM17/P ', 'Pengendalian Pekerjaan Pengujian dan Kalibrasi yang Tidak Sesuai', '2018-10-22', 'SM-PIA', '1', 'TLKM17P-v01--Prosedur-Pekerjaan-Pengujian-dan-Kalibrasi-Yang-Tidak-Sesuai.pdf'),
('TLKM18/P ', 'Prosedur Ketertelusuran Pengukuran (Metrologi)', '2018-10-22', 'SM-PIA', '1', 'TLKM18P_v01_Prosedur-Ketertelusuran-Pengukuran-Metrologi.pdf'),
('TLKM19/P ', 'Prosedur Tindakan Mengatasi Risiko dan Peluang', '2018-10-22', 'SM-PIA', '1', 'TLKM19P_v01_Prosedur-Tindakan-Mengatasi-Risiko-dan-Peluang.pdf'),
('TLKM20/P ', 'Prosedur Rekrutmen dan Pengembangan Personel Alih Daya', '2019-12-20', 'SM-PIA', '2', 'TLKM20P-v02--Prosedur-Pengelolaan-Personel.pdf');

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
('201902060', 'Sony', 'CAL', 'IpAcjld+IgEyLdzcKekO420BpkmALUetLwxI2B3Hco8=', 'sonY@gmail.com', '1', 'test.jpg', '2020-02-18T02:02:52.563Z', '2020-02-18T02:02:52.563Z'),
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
  ADD KEY `FK` (`engineer_1`,`engineer_2`,`engineer_3`),
  ADD KEY `engineer_2` (`engineer_2`),
  ADD KEY `engineer_3` (`engineer_3`);

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
  ADD KEY `test_engineer_id` (`test_engineer_id`),
  ADD KEY `cal_step_id` (`cal_step_id`);

--
-- Indexes for table `measuring_equipment`
--
ALTER TABLE `measuring_equipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK` (`request_id`);

--
-- Indexes for table `procedures`
--
ALTER TABLE `procedures`
  ADD PRIMARY KEY (`id`);

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
  ADD CONSTRAINT `cal_certificates_ibfk_2` FOREIGN KEY (`test_engineer_id`) REFERENCES `test_engineers` (`id`);

--
-- Constraints for table `cal_requests`
--
ALTER TABLE `cal_requests`
  ADD CONSTRAINT `cal_requests_ibfk_1` FOREIGN KEY (`engineer_1`) REFERENCES `test_engineers` (`id`);

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
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`test_engineer_id`) REFERENCES `test_engineers` (`id`),
  ADD CONSTRAINT `history_ibfk_3` FOREIGN KEY (`cal_step_id`) REFERENCES `cal_steps` (`id`);

--
-- Constraints for table `measuring_equipment`
--
ALTER TABLE `measuring_equipment`
  ADD CONSTRAINT `measuring_equipment_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `cal_requests` (`id`);

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

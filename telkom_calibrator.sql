-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2020 at 02:29 AM
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
('002-KAL-19', '194/CAL', '25/09/2019', '25/09/2021', '970037', 'test.pdf'),
('003-KAL-19', '103/CAL', '26/09/2019', '26/09/2021', '970037', 'test.pdf'),
('004-KAL-19', '101/CAL', '27/09/2019', '27/09/2021', '970037', 'test.pdf'),
('005-KAL-19', '100/CAL', '28/09/2019', '28/09/2021', '970037', 'test.pdf'),
('006-KAL-19', '097/CAL', '29/09/2019', '29/09/2021', '970037', 'test.pdf'),
('007-KAL-19', '096/CAL', '30/09/2019', '30/09/2021', '970037', 'test.pdf'),
('008-KAL-19', '091/CAL', '03/10/2019', '03/10/2021', '970037', 'test.pdf'),
('010-KAL-19', 'EXTERNAL', '02/10/2019', '02/10/2021', '970037', 'test.pdf'),
('011-KAL-19', '095/CAL', '04/10/2019', '04/10/2021', '970037', 'test.pdf'),
('041-KAL-19', 'EXTERNAL', '03/11/2019', '03/11/2021', '970037', 'test.pdf'),
('048-KAL-19', '086/CAL', '10/11/2019', '10/11/2021', '970037', 'test.pdf'),
('049-KAL-19', '129/CAL', '11/11/2019', '11/11/2021', '970037', 'test.pdf'),
('050-KAL-19', '130/CAL', '12/11/2019', '12/11/2021', '970037', 'test.pdf'),
('051-KAL-19', '109/CAL', '13/11/2019', '13/11/2021', '970037', 'test.pdf'),
('052-KAL-19', '121/CAL', '14/11/2019', '14/11/2021', '970037', 'test.pdf'),
('053-KAL-19', '119/CAL', '15/11/2019', '15/11/2021', '970037', 'test.pdf'),
('054-KAL-19', '037/CAL', '16/11/2019', '16/11/2021', '970037', 'test.pdf'),
('057-KAL-19', '180/CAL', '19/11/2019', '19/11/2021', '970037', 'test.pdf'),
('058-KAL-19', '006/CAL', '20/11/2019', '20/11/2021', '970037', 'test.pdf'),
('059-KAL-19', '133/CAL', '21/11/2019', '21/11/2021', '970037', 'test.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `cal_manuals`
--

CREATE TABLE `cal_manuals` (
  `id` varchar(11) NOT NULL,
  `device_id` varchar(11) NOT NULL,
  `test_item_id` varchar(11) NOT NULL,
  `ppm_output` double NOT NULL,
  `floor` double NOT NULL,
  `resolution` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Table structure for table `cal_steps`
--

CREATE TABLE `cal_steps` (
  `id` varchar(11) NOT NULL,
  `step_name` text NOT NULL,
  `step_number` int(5) NOT NULL,
  `created` varchar(24) NOT NULL,
  `updated` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cal_steps`
--

INSERT INTO `cal_steps` (`id`, `step_name`, `step_number`, `created`, `updated`) VALUES
('S1', 'Registered', 1, '2020-01-15T04:51:54.211Z', '2020-01-15T04:51:54.211Z'),
('S2', 'Evaluasi Perangkat', 2, '2020-01-15T04:51:54.211Z', '2020-01-15T04:51:54.211Z'),
('S3', 'Selesai', 3, '2020-01-15T04:51:54.211Z', '2020-01-15T04:51:54.211Z');

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
  `owner` varchar(20) NOT NULL,
  `issue_date` varchar(24) NOT NULL,
  `calibration_date` varchar(24) NOT NULL,
  `due_date` varchar(24) NOT NULL,
  `calibration_period` int(5) NOT NULL,
  `defect_status` int(11) NOT NULL,
  `documentation` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `name`, `manufacturer`, `model`, `serial_number`, `owner`, `issue_date`, `calibration_date`, `due_date`, `calibration_period`, `defect_status`, `documentation`) VALUES
('001/CAL', 'TES UNIT', 'F & G', 'PM-2', '200759', 'CAL', '02/08/2015', '03/08/2018', '03/08/2019', 2, 0, 'test.jpg'),
('002/CAL', 'POWER METER', 'HP', '436 A', '2347A16880', 'CAL', '03/08/2015', '05/04/2013', '05/04/2014', 2, 1, 'test.jpg'),
('003/CAL', 'POWER METER', 'HP', '436 A', '2236A12973', 'CAL', '04/08/2015', '29/01/2019', '29/01/2020', 2, 0, 'test.jpg'),
('006/CAL', 'RANGE CALIBRATOR', 'HP', '11683A', '2236A02035', 'CAL', '05/08/2015', '25/04/2017', '25/04/2019', 2, 0, 'test.jpg'),
('009/CAL', 'COUNTER/POWER METER', 'HP', '5347A', '3009A00995', 'CAL', '06/08/2015', '25/01/2018', '25/01/2020', 2, 0, 'test.jpg'),
('010/CAL', 'SYNTHESIZER/LEVEL GAIN', 'HP', '3335A', '1640A01067', 'CAL', '07/08/2015', '05/04/2013', '05/04/2014', 2, 1, 'test.jpg'),
('011/CAL', 'SYNTHESIZER', 'HP', '3335A', '1640A02114', 'CAL', '08/08/2015', '06/08/2018', '06/08/2020', 2, 0, 'test.jpg'),
('013/CAL', 'DECADE RESISTANCE BOX', 'YOKOGAWA', '279301', '54FT0301', 'CAL', '09/08/2015', '18/09/2018', '18/09/2020', 2, 0, 'test.jpg'),
('023/CAL', 'ATTENUATOR 600 OHM', 'HP', '4437A', '1250J01182', 'CAL', '10/08/2015', '18/09/2018', '18/09/2020', 2, 0, 'test.jpg'),
('026/CAL', 'STANDARD AIR CAPACITOR', 'HP', '16380 C', '2519J00513', 'CAL', '14/09/2015', '25/04/2017', '25/04/2019', 2, 0, 'test.jpg'),
('027/CAL', 'STANDARD AIR CAPACITOR', 'HP', '16380 A', '-', 'CAL', '15/09/2015', '13/10/2017', '13/10/2019', 2, 0, 'test.jpg'),
('034/CAL', 'DIRECTIONAL COUPLER', 'HP', '11691 D', '1212A02334', 'CAL', '11/08/2015', '16/03/2017', '16/03/2019', 2, 0, 'test.jpg'),
('037/CAL', 'AC/DC CURRENT PROBE', 'FLUKE', 'Y 8100', '2672180', 'CAL', '12/08/2015', '02/05/2016', '02/05/2019', 2, 0, 'test.jpg'),
('038/CAL', 'AUDIO ANALYZER', 'HP', '8903 B', '2818A04574', 'CAL', '13/08/2015', '13/10/2017', '13/10/2019', 2, 0, 'test.jpg'),
('043/CAL', 'DECADE CAPACITOR', 'HP', '4440 B', '1224J04572', 'CAL', '14/08/2015', '15/03/2017', '15/03/2019', 2, 0, 'test.jpg'),
('044/CAL', 'LEVEL METER', 'ANRITSU', 'ML424B', 'M57339', 'CAL', '15/08/2015', '13/10/2017', '13/10/2019', 2, 0, 'test.jpg'),
('045/CAL', 'DECADE RESISTANCE BOX', 'YOKOGAWA', '2793 - 03', '26FT1066', 'CAL', '16/08/2015', '25/10/2017', '25/10/2019', 2, 0, 'test.jpg'),
('048/CAL', 'DC REFFERENCE STANDARD', 'FLUKE', '731 B', '2575007', 'CAL', '17/08/2015', '16/03/2017', '16/03/2019', 2, 0, 'test.jpg'),
('069/CAL', 'TERMO-HIGROMETER', 'HISAMATSU', 'TN-2500', '4098', 'CAL', '18/08/2015', '14/03/2018', '14/03/2020', 2, 0, 'test.jpg'),
('070/CAL', 'TERMO-HIGROMETER', 'PALMA', 'SATO', '107669', 'CAL', '19/08/2015', '15/03/2018', '15/03/2020', 2, 0, 'test.jpg'),
('071/CAL', 'TERMO-HIGROMETER', 'HISAMATSU', 'TN-2500', '4099', 'CAL', '20/08/2015', '13/03/2018', '13/03/2020', 2, 0, 'test.jpg'),
('086/CAL', 'STANDARD RESISTOR', 'SIEMEN', '0.001 OHM', '1600726', 'CAL', '21/08/2015', '25/04/2017', '25/04/2019', 2, 0, 'test.jpg'),
('087/CAL', 'STANDARD RESISTOR', 'SIEMEN', '1000 OHM', '19007', 'CAL', '22/08/2015', '30/07/2018', '30/07/2020', 2, 0, 'test.jpg'),
('089/CAL', 'STANDARD RESISTOR', 'SIEMEN', '10000 OHM', '19005', 'CAL', '23/08/2015', '30/07/2018', '30/07/2020', 2, 0, 'test.jpg'),
('090/CAL', 'STANDARD RESISTOR', 'SIEMEN', '0.1 OHM', '1600674', 'CAL', '24/08/2015', '30/07/2018', '30/07/2020', 2, 0, 'test.jpg'),
('091/CAL', 'STANDARD RESISTOR', 'SIEMEN', '0.01 OHM', '1600688', 'CAL', '25/08/2015', '17/01/2019', '17/01/2021', 2, 0, 'test.jpg'),
('092/CAL', 'STANDARD RESISTOR', 'AEG', '10 OHM', '7528', 'CAL', '26/08/2015', '15/03/2017', '15/03/2019', 2, 0, 'test.jpg'),
('093/CAL', 'STANDARD RESISTOR', 'AEG', '0.0001 OHM', '7348', 'CAL', '27/08/2015', '30/07/2018', '30/07/2020', 2, 0, 'test.jpg'),
('094/CAL', 'STANDARD RESISTOR', 'AEG', '1000 OHM', '7664', 'CAL', '28/08/2015', '20/12/2018', '20/12/2020', 2, 0, 'test.jpg'),
('095/CAL', 'STANDARD RESISTOR', 'AEG', '100 OHM', '7518', 'CAL', '29/08/2015', '30/07/2018', '30/07/2020', 2, 0, 'test.jpg'),
('096/CAL', 'STANDARD RESISTOR', 'AEG', '100000 OHM', '-', 'CAL', '30/08/2015', '17/01/2019', '17/01/2021', 2, 0, 'test.jpg'),
('097/CAL', 'STANDARD RESISTOR', 'AEG', '10000', '7097', 'CAL', '31/08/2015', '17/01/2019', '17/01/2021', 2, 0, 'test.jpg'),
('098/CAL', 'STANDARD RESISTOR', 'AEG', '0.01 OHM', '7172', 'CAL', '01/09/2015', '25/01/2018', '25/01/2020', 2, 0, 'test.jpg'),
('099/CAL', 'STANDARD RESISTOR', 'AEG', '10 OHM', '7529', 'CAL', '02/09/2015', '30/07/2018', '30/07/2020', 2, 1, 'test.jpg'),
('100/CAL', 'STANDARD RESISTOR', 'AEG', '0.1 OHM', '7810', 'CAL', '03/09/2015', '17/01/2019', '17/01/2021', 2, 0, 'test.jpg'),
('101/CAL', 'STANDARD RESISTOR', 'AEG', '100 OHM', '7520', 'CAL', '04/09/2015', '18/01/2019', '18/01/2021', 2, 0, 'test.jpg'),
('102/CAL', 'STANDARD RESISTOR', 'AEG', '1 OHM', '7691', 'CAL', '05/09/2015', '20/12/2018', '20/12/2020', 2, 0, 'test.jpg'),
('103/CAL', 'STANDARD RESISTOR', 'AEF', '1000 OHM', '7662', 'CAL', '06/09/2015', '17/01/2019', '17/01/2021', 2, 0, 'test.jpg'),
('104/CAL', 'STANDARD RESISTOR', 'AEG', '0.1 OHM', '7419', 'CAL', '07/09/2015', '30/07/2018', '30/07/2020', 2, 0, 'test.jpg'),
('105/CAL', 'STANDARD RESISTOR', 'AEG', '10000 OHM', '7099', 'CAL', '08/09/2015', '30/07/2018', '30/07/2020', 2, 0, 'test.jpg'),
('106/CAL', 'STANDARD RESISTOR', 'AEG', '1 OHM', '7687', 'CAL', '09/09/2015', '30/07/2018', '30/07/2020', 2, 0, 'test.jpg'),
('107/CAL', 'STANDARD RESISTOR', 'AEG', '0.001 OHM', '6895', 'CAL', '10/09/2015', '27/03/2017', '27/03/2019', 2, 0, 'test.jpg'),
('108/CAL', 'LCR METER', 'HP', '4263B', 'JP1KD00894', 'CAL', '11/09/2015', '17/04/2017', '17/04/2019', 2, 0, 'test.jpg'),
('109/CAL', '50 W TERMINATION', 'TETRONIX', '50 W 2 W', '011-0049-01', 'CAL', '12/09/2015', '26/04/2017', '26/04/2019', 2, 0, 'test.jpg'),
('110/CAL', 'STEP ATTENUATOR', 'HP', '8496 B', '1350A02875', 'CAL', '13/09/2015', '29/03/2017', '29/03/2019', 2, 0, 'test.jpg'),
('112/CAL', 'POWER SENSOR', 'HP', '8482 H', '1545A00991', 'CAL', '16/09/2015', '08/05/2018', '08/05/2020', 2, 0, 'test.jpg'),
('118/CAL', 'DUAL DIRECT. COUPLER', 'HP', '796 D', '7090', 'CAL', '17/09/2015', '29/03/2017', '29/03/2019', 2, 0, 'test.jpg'),
('119/CAL', 'PREC. TERMIN DC 100 KHZ', 'TETRONIX', '50 W', '011-0129-00', 'CAL', '18/09/2015', '26/04/2017', '26/04/2019', 2, 0, 'test.jpg'),
('121/CAL', 'MATCHED 75-50 W', 'TETRONIX', '75 W 50 W', '011-057', 'CAL', '19/09/2015', '26/04/2017', '26/04/2019', 2, 0, 'test.jpg'),
('122/CAL', 'PREC. TERMIN DC 18 GHZ', 'SUHNER', '50 W', '6500.17.A', 'CAL', '20/09/2015', '18/09/2018', '18/09/2020', 2, 0, 'test.jpg'),
('125/CAL', 'FEED THR. TERM DC 1.2 GHZ', 'SUHNER', '75 W', '-', 'CAL', '21/09/2015', '13/10/2017', '13/10/2019', 2, 0, 'test.jpg'),
('126/CAL', 'PULSE GENERATOR', 'HP', '8112A', '3205G11966', 'CAL', '22/09/2015', '17/04/2017', '17/04/2019', 2, 0, 'test.jpg'),
('127/CAL', 'CALIBRATION SYSTEM', 'WAVETEK', '9100', '32781', 'CAL', '23/09/2015', '25/04/2018', '25/04/2020', 2, 0, 'test.jpg'),
('128/CAL', 'STANDARD INDUCTOR', 'QUADTECH', '1482-B', '6422734', 'CAL', '24/09/2015', '05/10/2017', '05/10/2019', 2, 0, 'test.jpg'),
('129/CAL', 'STANDARD INDUCTOR', 'QUADTECH', '1482-E', '6422735', 'CAL', '25/09/2015', '25/04/2017', '25/04/2019', 2, 0, 'test.jpg'),
('130/CAL', 'STANDARD INDUCTOR', 'QUADTECH', '1482-H', '6422736', 'CAL', '26/09/2015', '25/04/2017', '25/04/2019', 2, 0, 'test.jpg'),
('131/CAL', 'STANDARD INDUCTOR', 'QUADTECH', '1482-L', '6422737', 'CAL', '27/09/2015', '05/10/2017', '05/10/2019', 2, 0, 'test.jpg'),
('132/CAL', 'STANDARD INDUCTOR', 'QUADTECH', '1482-P', '6422738', 'CAL', '28/09/2015', '05/10/2017', '05/10/2019', 2, 0, 'test.jpg'),
('133/CAL', 'STANDARD INDUCTOR', 'QUADTECH', '1482-T', '6422739', 'CAL', '29/09/2015', '25/04/2017', '25/04/2019', 2, 0, 'test.jpg'),
('134/CAL', 'SCALAR NETWORK ANALYZER', 'HP', '8757 C', '3210A02391', 'CAL', '30/09/2015', '23/12/2016', '23/12/2017', 2, 0, 'test.jpg'),
('135/CAL', 'OSCILLOSCOPE 1 Ghz', 'HP', '54710 D', 'US35370102', 'CAL', '01/10/2015', '25/10/2017', '25/10/2019', 2, 0, 'test.jpg'),
('136/CAL', 'MULTIMETER', 'HP', '3458 A', '2823A13780', 'CAL', '02/10/2015', '16/03/2018', '16/03/2020', 2, 0, 'test.jpg'),
('137/CAL', 'FRQ. ERROR MEAS. SYSTEM', 'ODETICS', '345-200-01', '3450046-9718', 'CAL', '03/10/2015', '16/10/2017', '16/10/2018', 2, 1, 'test.jpg'),
('138/CAL', 'PRECISION LCR METER', 'QUADTECH', '7600', '7124266', 'CAL', '04/10/2015', '04/05/2018', '04/05/2020', 2, 0, 'test.jpg'),
('139/CAL', 'CALIBRATION STANDARD', 'QUADTECH', '800064-69', '7204770', 'CAL', '05/10/2015', '13/04/2017', '13/04/2019', 2, 0, 'test.jpg'),
('140/CAL', 'REFFERENCE DIVIDER', 'FLUKE', '752A', '6780202', 'CAL', '06/10/2015', '16/03/2017', '16/03/2019', 2, 0, 'test.jpg'),
('141/CAL', 'AC/DC TRANSFER STANDARD', 'FLUKE', '792A', '6765001', 'CAL', '07/10/2015', '03/04/2015', '03/04/2018', 2, 1, 'test.jpg'),
('142/CAL', 'DC VOLTAGE REFF STD.', 'WAVETEK', '4910', '33957', 'CAL', '08/10/2015', '30/03/2017', '30/03/2019', 2, 0, 'test.jpg'),
('143/CAL', 'SYNT/FUNCTION GENERATOR', 'HP', '3325B', '2847A13258', 'CAL', '09/10/2015', '25/10/2017', '25/10/2019', 2, 0, 'test.jpg'),
('144/CAL', 'UNIVERSAL TIME INTERVAL COUNTER', 'HP', '5370B', '2904A02827', 'CAL', '10/10/2015', '03/08/2018', '03/08/2020', 2, 0, 'test.jpg'),
('145/CAL', 'THERMO HIGROMETER', 'HISAMATSU', 'TN-2500', '4556', 'CAL', '11/10/2015', '22/03/2018', '22/03/2020', 2, 0, 'test.jpg'),
('146/CAL', 'SWEEP OSCILLATOR', 'HP', '8350 B', '3241A16772', 'CAL', '12/10/2015', '23/12/2016', '23/12/2017', 2, 1, 'test.jpg'),
('148/CAL', 'CALIBRATION SYSTEM', 'WAVETEK', '9100', '40766', 'CAL', '13/10/2015', '28/09/2017', '28/09/2019', 2, 0, 'test.jpg'),
('149/CAL', 'SIGNAL GENERATOR', 'HP', '8656 B', '333414996', 'CAL', '14/10/2015', '31/05/2018', '31/05/2019', 2, 0, 'test.jpg'),
('150/CAL', 'POWER SENSOR', 'HP', '8481 H', '2237A06238', 'CAL', '15/10/2015', '05/04/2018', '05/04/2020', 2, 0, 'test.jpg'),
('151/CAL', 'POWER SENSOR', 'HP', '8481 A', '2237A35799', 'CAL', '16/10/2015', '07/05/2018', '07/05/2020', 2, 0, 'test.jpg'),
('152/CAL', 'POWER SENSOR', 'HP', '8483 A', '2329A02232', 'CAL', '17/10/2015', '05/04/2018', '05/04/2020', 2, 0, 'test.jpg'),
('153/CAL', 'POWER SENSOR', 'HP', '8481 D', '2928A03960', 'CAL', '18/10/2015', '07/05/2018', '07/05/2020', 2, 0, 'test.jpg'),
('154/CAL', 'POWER SENSOR', 'HP', '8485 A', '3318A16530', 'CAL', '19/10/2015', '08/05/2018', '08/05/2020', 2, 0, 'test.jpg'),
('156/CAL', 'DUAL DIRECTIONAL COUPLER', 'HP', '778D', '17275', 'CAL', '20/10/2015', '16/10/2018', '16/10/2021', 2, 0, 'test.jpg'),
('157/CAL', 'DUAL DIRECTIONAL COUPLER', 'HP', '772D', '2839A00843', 'CAL', '21/10/2015', '30/03/2017', '30/03/2020', 2, 0, 'test.jpg'),
('158/CAL', 'POWER SENSOR', 'HP', '8482 A', 'US37290006', 'CAL', '22/10/2015', '23/03/2018', '23/03/2020', 2, 0, 'test.jpg'),
('159/CAL', '50 OHM TERMINATION', 'SUHNER', '15W DC-10G', '6515.01B', 'CAL', '23/10/2015', '17/04/2017', '17/04/2019', 2, 0, 'test.jpg'),
('160/CAL', 'MICROWAVE SYNTH. GENERATOR', 'GIGA-TRONICS', '12720A', '22005', 'CAL', '24/10/2015', '02/08/2018', '02/08/2020', 2, 0, 'test.jpg'),
('161/CAL', 'DIGITAL MULTIMETER', 'IWATSU', 'VOAC 92', '21701', 'CAL', '25/10/2015', '02/08/2018', '02/08/2019', 2, 0, 'test.jpg'),
('162/CAL', 'DIGITAL MULTIMETER', 'IWATSU', 'VOAC 92', '21706', 'CAL', '26/10/2015', '12/09/2018', '12/09/2019', 2, 0, 'test.jpg'),
('164/CAL', 'AC VOLTMETER', 'YOKOGAWA', '235300-80-13', '60LH0860', 'CAL', '27/10/2015', '01/08/2018', '01/08/2019', 2, 0, 'test.jpg'),
('165/CAL', 'AC VOLTMETER', 'YOKOGAWA', '235300-80-13', '60LH0861', 'CAL', '28/10/2015', '01/08/2018', '01/08/2019', 2, 0, 'test.jpg'),
('166/CAL', 'AC VOLTMETER', 'YOKOGAWA', '235300-80-13', '60LH0862', 'CAL', '29/10/2015', '01/08/2018', '01/08/2019', 2, 0, 'test.jpg'),
('167/CAL', 'DECADE RESISTANCE BOX', 'YOKOGAWA', '2793-01', '60VX0222', 'CAL', '30/10/2015', '25/10/2017', '25/10/2019', 2, 0, 'test.jpg'),
('168/CAL', 'DECADE RESISTANCE BOX', 'YOKOGAWA', '2786-20', '60VU1118', 'CAL', '31/10/2015', '30/03/2017', '30/03/2019', 2, 0, 'test.jpg'),
('169/CAL', 'DIGITAL THERMOMETER', 'YOKOGAWA', 'TX10-03', '900417', 'CAL', '01/11/2015', '12/03/2018', '12/03/2020', 2, 0, 'test.jpg'),
('171/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-600/75', 'CN-0001', 'CAL', '02/11/2015', '30/03/2017', '30/03/2019', 2, 0, 'test.jpg'),
('172/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-75/75', 'CI-0010', 'CAL', '03/11/2015', '30/03/2017', '30/03/2019', 2, 0, 'test.jpg'),
('173/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-135/75', 'DF-0007', 'CAL', '04/11/2015', '30/03/2017', '30/03/2019', 2, 0, 'test.jpg'),
('174/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-120/75', 'CT-0011', 'CAL', '05/11/2015', '30/03/2017', '30/03/2019', 2, 0, 'test.jpg'),
('175/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-124/75', 'CM-0005', 'CAL', '06/11/2015', '30/03/2017', '30/03/2019', 2, 0, 'test.jpg'),
('176/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-150/75', 'CO-0014', 'CAL', '07/11/2015', '30/03/2017', '30/03/2019', 2, 0, 'test.jpg'),
('177/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-50/75', 'DG-001', 'CAL', '08/11/2015', '30/03/2017', '30/03/2019', 2, 0, 'test.jpg'),
('178/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-100/75', 'DB-0007', 'CAL', '09/11/2015', '30/03/2017', '30/03/2019', 2, 0, 'test.jpg'),
('179/CAL', 'BALANCE MEAS. ATTAC.', 'WG', 'SMZ-600/50', 'CD-0002', 'CAL', '10/11/2015', '30/03/2017', '30/03/2019', 2, 0, 'test.jpg'),
('180/CAL', 'CESIUM BEAM', 'OSCILLOQUARTZ', '3210', '945.321.000.63', 'CAL', '11/11/2015', '25/04/2017', '25/04/2019', 2, 0, 'test.jpg'),
('181/CAL', 'SYNCRONISATION TEST SET', 'OSCILLOQUARTZ', '5565', '945.556.502', 'CAL', '12/11/2015', '07/08/2018', '07/08/2020', 2, 0, 'test.jpg'),
('182/CAL', 'SIGNAL GENERATOR', 'HP', '8648 B', '3537AO1287', 'CAL', '13/11/2015', '02/08/2018', '02/08/2019', 2, 0, 'test.jpg'),
('184/CAL', 'THERMOHYGROMETER', 'CENTER-314', '314', '20306895', 'CAL', '14/11/2015', '15/03/2018', '15/03/2020', 2, 0, 'test.jpg'),
('186/CAL', 'CLAMP METER KEW SNAP', 'KYORITSU', '2904', '905563', 'CAL', '15/11/2015', '03/08/2018', '03/08/2019', 2, 0, 'test.jpg'),
('187/CAL', 'HIGH VOLTAGE DIGITAL METER', 'KIKUSUI', '149-10A', 'JC003087', 'CAL', '16/11/2015', '23/03/2018', '23/03/2019', 2, 0, 'test.jpg'),
('188/CAL', 'HIGH RESISTANCE DECADE SUBTITUTER', 'IET', 'HRRS-Q-7-100-5KV', 'B1-0416034', 'CAL', '17/11/2015', '22/02/2017', '22/02/2019', 2, 0, 'test.jpg'),
('189/CAL', 'WITHSTANDING VOLTAGE TESTER', 'KIKUSUI', 'TOS5051', 'JD000740', 'CAL', '18/11/2015', '03/08/2018', '03/08/2019', 2, 0, 'test.jpg'),
('190/CAL', 'FREQUENCY STANDARD', 'SCHOMANDL', 'FN-GPS/R', '10001', 'CAL', '19/11/2015', '31/08/2012', '31/08/2017', 2, 1, 'test.jpg'),
('191/CAL', 'SELECTIVE LEVEL MEASURING SET', 'WG', 'PSM-139', 'CF-0041', 'CAL', '20/11/2015', '03/08/2018', '03/08/2019', 2, 0, 'test.jpg'),
('192/CAL', 'OSCILLOSCOPE', 'TEKTRONIK', 'TDS-3052B', 'C010090', 'CAL', '21/11/2015', '03/08/2018', '03/08/2019', 2, 0, 'test.jpg'),
('193/CAL', 'HIGH VOLTAGE DIGITAL PROBE', 'ROSS', 'VMP120GH-C-AI F', '070215-6', 'CAL', '22/11/2015', '26/10/2018', '26/10/2022', 2, 0, 'test.jpg'),
('194/CAL', 'RF STEP ATTENUATOR (110 Db)', 'AGILENT', '8496 B', 'MY42145654', 'CAL', '23/11/2015', '29/01/2019', '29/01/2020', 2, 0, 'test.jpg'),
('195/CAL', 'RF STEP ATTENUATOR (11 Db)', 'AGILENT', '8494 B', 'MY42149296', 'CAL', '24/11/2015', '13/10/2017', '13/10/2018', 2, 0, 'test.jpg'),
('196/CAL', 'THERMO-HIGROMETER', 'VICTOR', 'HTC-1', '-', 'CAL', '25/11/2015', '31/07/2018', '31/07/2019', 2, 0, 'test.jpg'),
('197/CAL', 'THERMO-HIGROMETER', 'VICTOR', 'HTC-1', '-', 'CAL', '26/11/2015', '31/07/2018', '31/07/2019', 2, 0, 'test.jpg'),
('198/CAL', 'THERMO-HIGROMETER', 'ELITECH', 'RC-4HC', '-', 'CAL', '27/11/2015', '02/08/2018', '02/08/2019', 2, 0, 'test.jpg'),
('199/CAL', 'RUBIDIUM FREQUENCY STANDARD', 'GPS', '12R', '452029', 'CAL', '28/11/2015', '13/08/2019', '13/08/2020', 2, 0, 'test.jpg'),
('200/CAL', 'ADVANCED MULTI PRODUCT CALIBRATOR', 'TRANSMILLE', '4015', 'Y1269E18', 'CAL', '29/11/2015', '03/09/2019', '03/09/2020', 2, 0, 'test.jpg'),
('EXTERNAL', 'EXTERNAL', 'EXTERNAL', 'EXTERNAL', 'EXTERNAL', 'EXT', '30/11/2015', '04/09/2019', '04/09/2020', 2, 0, 'test.jpg');

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
  `cal_request_id` varchar(11) NOT NULL,
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
('970037', 'Aldi Wiranata', 'CAB', 'ALW', '+bzBfGTMIz93h8vtAUJlpD1GQSd1UIJXim+ljUYmdwQ=', 'aldiw01@gmail.com', '2', '2020-01-15T04:51:54.211Z', '2020-01-15T04:51:54.211Z');

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

--
-- Dumping data for table `test_types`
--

INSERT INTO `test_types` (`id`, `type_name`) VALUES
(1, 'Kelistrikan'),
(2, 'Waktu dan Frekuensi');

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
-- Indexes for table `cal_manuals`
--
ALTER TABLE `cal_manuals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK` (`device_id`,`test_item_id`),
  ADD KEY `test_item_id` (`test_item_id`);

--
-- Indexes for table `cal_requests`
--
ALTER TABLE `cal_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK` (`test_engineer_id`,`requestor_id`,`device_id`,`cal_step_id`,`cal_certificate_id`),
  ADD KEY `device_id` (`device_id`),
  ADD KEY `requestor_id` (`requestor_id`),
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
  ADD KEY `FK` (`cal_request_id`,`test_engineer_id`,`cal_step_id`),
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
-- Constraints for table `cal_manuals`
--
ALTER TABLE `cal_manuals`
  ADD CONSTRAINT `cal_manuals_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`),
  ADD CONSTRAINT `cal_manuals_ibfk_2` FOREIGN KEY (`test_item_id`) REFERENCES `test_items` (`id`);

--
-- Constraints for table `cal_requests`
--
ALTER TABLE `cal_requests`
  ADD CONSTRAINT `cal_requests_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`),
  ADD CONSTRAINT `cal_requests_ibfk_2` FOREIGN KEY (`test_engineer_id`) REFERENCES `test_engineers` (`id`),
  ADD CONSTRAINT `cal_requests_ibfk_3` FOREIGN KEY (`requestor_id`) REFERENCES `test_engineers` (`id`),
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
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`cal_request_id`) REFERENCES `cal_requests` (`id`),
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
  ADD CONSTRAINT `test_items_ibfk_1` FOREIGN KEY (`test_type_id`) REFERENCES `test_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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

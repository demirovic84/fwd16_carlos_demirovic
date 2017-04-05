-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 05, 2017 at 05:14 PM
-- Server version: 5.6.35
-- PHP Version: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `asylum`
--
CREATE DATABASE IF NOT EXISTS `asylum` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `asylum`;

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `Q1. Search for any patient, show all patients`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q1. Search for any patient, show all patients` (IN `Nr_patients` VARCHAR(255))  BEGIN
SELECT Patient.Patient_name, Patient.Patient_lastname, Diagnose.Diagnose_ID, Diagnose.Diagnose_name 
AS Diagnose
FROM Patient_Diagnose LEFT JOIN Diagnose 
ON Patient_Diagnose.Diagnose_ID = Diagnose.Diagnose_ID
LEFT JOIN Patient ON Patient_Diagnose.Patient_ID = Patient.Patient_ID;
END$$

DROP PROCEDURE IF EXISTS `Q2. Search number of patients`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q2. Search number of patients` (IN `Nr_of_patients` INT(11))  NO SQL
SELECT COUNT(*)
AS Amount_of_patients
FROM Patient_Diagnose$$

DROP PROCEDURE IF EXISTS `Q3. Search for medicines, show dose for a diagnose`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q3. Search for medicines, show dose for a diagnose` (IN `Medicine` VARCHAR(255))  BEGIN
SELECT Diagnose.Diagnose_name, Medicine.Medicine_name, Medicine.Medicine_dose
AS Dose
FROM Diagnose 
LEFT JOIN Medicine ON Diagnose.Diagnose_ID = Medicine.FK_Diagnose
WHERE Medicine_name = Medicine;
END$$

DROP PROCEDURE IF EXISTS `Q4. Search for nurses and show patients`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q4. Search for nurses and show patients` (IN `Nurses` VARCHAR(255))  BEGIN
SELECT Nurse.Nurse_ID, Nurse.Nurse_name, Nurse.Nurse_lastname, Patient.Patient_ID, Patient.Patient_name, Patient.Patient_lastname 
FROM Nurse_Patient
INNER JOIN Nurse ON Nurse_Patient.Nurse_ID = Nurse.Nurse_ID
INNER JOIN Patient ON Nurse_Patient.Patient_ID = Patient.Patient_ID
WHERE Nurse.Nurse_name = Nurses;
END$$

DROP PROCEDURE IF EXISTS `Q5. Search for doctors and show patients)`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q5. Search for doctors and show patients)` (IN `Doctor` VARCHAR(255))  BEGIN
SELECT doctor.Doctor_name,doctor.Doctor_lastname, Patient.Patient_name, Patient.Patient_lastname
AS Patient_lasname
FROM Patient
INNER JOIN doctor ON Patient.FK_Doct_ID = doctor.Doctor_ID
WHERE doctor.Doctor_name = Doctor;
END$$

DROP PROCEDURE IF EXISTS `Q6. Search for diagnose`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q6. Search for diagnose` (IN `Diagnose` VARCHAR(255))  BEGIN
SELECT Patient.Patient_name, Patient.Patient_lastname, Diagnose.Diagnose_ID, Diagnose.Diagnose_name 
AS Diagnose
FROM Patient_Diagnose LEFT JOIN Diagnose ON Patient_Diagnose.Diagnose_ID = Diagnose.Diagnose_ID
LEFT JOIN Patient ON Patient_Diagnose.Patient_ID = Patient.Patient_ID
WHERE Diagnose_name = Diagnose;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `1_antal_insjukna_i_olika_sjukdomar`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `1_antal_insjukna_i_olika_sjukdomar`;
CREATE TABLE `1_antal_insjukna_i_olika_sjukdomar` (
`Patient_name` varchar(255)
,`Patient_lastname` varchar(255)
,`Diagnose_ID` int(11)
,`Diagnose_name` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `2_antal_sjuka_patienter`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `2_antal_sjuka_patienter`;
CREATE TABLE `2_antal_sjuka_patienter` (
`COUNT(Patient_Diagnose.Diagnose_ID)` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `3_visa_olika_mediciner_och_dosering_f\'f6r_en_viss_sjukdom`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `3_visa_olika_mediciner_och_dosering_f\'f6r_en_viss_sjukdom`;
CREATE TABLE `3_visa_olika_mediciner_och_dosering_f\'f6r_en_viss_sjukdom` (
`Diagnose_name` varchar(255)
,`Medicine_name` varchar(255)
,`Medicine_dose` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `4_sjuksk\'f6terskor_som_behandlar_en_viss_patient.`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `4_sjuksk\'f6terskor_som_behandlar_en_viss_patient.`;
CREATE TABLE `4_sjuksk\'f6terskor_som_behandlar_en_viss_patient.` (
`Nurse_ID` int(11)
,`Nurse_name` varchar(255)
,`Nurse_lastname` varchar(255)
,`Patient_ID` int(11)
,`Patient_name` varchar(255)
,`Patient_lastname` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `5_visa_vilka_patienter_behandlas_av_en_l\'e4kare`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `5_visa_vilka_patienter_behandlas_av_en_l\'e4kare`;
CREATE TABLE `5_visa_vilka_patienter_behandlas_av_en_l\'e4kare` (
`Doctor_name` varchar(255)
,`Doctor_lastname` varchar(255)
,`Patient_name` varchar(255)
,`Patient_lastname` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `Diagnose`
--

DROP TABLE IF EXISTS `Diagnose`;
CREATE TABLE `Diagnose` (
  `Diagnose_ID` int(11) NOT NULL,
  `Diagnose_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Diagnose`
--

INSERT INTO `Diagnose` (`Diagnose_ID`, `Diagnose_name`) VALUES
(1, 'Rabies'),
(2, 'Allergy'),
(3, 'Asthma'),
(4, 'Back pain'),
(5, 'Herpes'),
(6, 'Cholestorol'),
(7, 'Heart failure'),
(8, 'Depression'),
(9, 'Epilepsy'),
(10, 'Headache'),
(11, 'Heel pain'),
(12, 'Colera'),
(13, 'HIV'),
(14, 'AIDS'),
(15, 'Acne');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `Doctor_ID` int(11) NOT NULL,
  `Doctor_name` varchar(255) NOT NULL,
  `Doctor_lastname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`Doctor_ID`, `Doctor_name`, `Doctor_lastname`) VALUES
(1, 'Carlos', 'Demirovic'),
(2, 'David', 'Szmak'),
(3, 'Dragana', 'Jankovic'),
(4, 'Soheil', 'Hasware'),
(5, 'Angelica', 'Gaintatzi'),
(6, 'Le', 'Ly');

-- --------------------------------------------------------

--
-- Table structure for table `Medicine`
--

DROP TABLE IF EXISTS `Medicine`;
CREATE TABLE `Medicine` (
  `Medecine_ID` int(11) NOT NULL,
  `Medicine_name` varchar(255) NOT NULL,
  `Medicine_dose` int(11) NOT NULL,
  `FK_Diagnose` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Medicine`
--

INSERT INTO `Medicine` (`Medecine_ID`, `Medicine_name`, `Medicine_dose`, `FK_Diagnose`) VALUES
(1, 'Voltaren', 8, 1),
(2, 'OxyContin', 7, 2),
(3, 'Methadone', 2, 3),
(4, 'Celebrex', 2, 4),
(5, 'Naproxen', 1, 5),
(6, 'Nucynta', 1, 6),
(7, 'Opana', 2, 7),
(8, 'Kadian', 5, 8),
(9, 'Tylenol', 4, 9),
(10, 'Aspirin', 3, 10),
(11, 'Xtampza', 2, 11),
(12, 'Tylenol', 1, 12),
(13, 'Ecotrin', 5, 13),
(14, 'Pamprin', 6, 14),
(15, 'Diskets', 4, 15),
(19, 'Xanax', 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Nurse`
--

DROP TABLE IF EXISTS `Nurse`;
CREATE TABLE `Nurse` (
  `Nurse_ID` int(11) NOT NULL,
  `Nurse_name` varchar(255) NOT NULL,
  `Nurse_lastname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Nurse`
--

INSERT INTO `Nurse` (`Nurse_ID`, `Nurse_name`, `Nurse_lastname`) VALUES
(1, 'Pamela', 'Andersson'),
(2, 'Katherine', 'Heigl'),
(3, 'Tori', 'Black'),
(4, 'Kate', 'Beckinsale'),
(5, 'Zoe', 'Saldana'),
(6, 'Jessica', 'Simpson');

-- --------------------------------------------------------

--
-- Table structure for table `Nurse_Patient`
--

DROP TABLE IF EXISTS `Nurse_Patient`;
CREATE TABLE `Nurse_Patient` (
  `Patient_ID` int(11) NOT NULL,
  `Nurse_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Nurse_Patient`
--

INSERT INTO `Nurse_Patient` (`Patient_ID`, `Nurse_ID`) VALUES
(1, 1),
(7, 1),
(13, 1),
(2, 2),
(8, 2),
(14, 2),
(3, 3),
(9, 3),
(15, 3),
(4, 4),
(10, 4),
(4, 5),
(5, 5),
(11, 5),
(6, 6),
(12, 6);

-- --------------------------------------------------------

--
-- Table structure for table `Patient`
--

DROP TABLE IF EXISTS `Patient`;
CREATE TABLE `Patient` (
  `Patient_ID` int(11) NOT NULL,
  `Patient_name` varchar(255) NOT NULL,
  `Patient_lastname` varchar(255) NOT NULL,
  `FK_Doct_ID` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Patient`
--

INSERT INTO `Patient` (`Patient_ID`, `Patient_name`, `Patient_lastname`, `FK_Doct_ID`) VALUES
(1, 'Bat ', 'Man', 1),
(2, 'Spider', 'Man', 2),
(3, 'Iron', 'Man', 3),
(4, 'Super', 'Man', 4),
(5, 'Wonder', 'Woman', 5),
(6, 'The', 'Hulk', 6),
(7, 'Thor', 'Thorsson', 1),
(8, 'Ant', 'Man', 2),
(9, 'Captain', 'America', 3),
(10, 'The', 'Wolverine', 4),
(11, 'Black', 'Widow', 5),
(12, 'The', 'Magneto', 6),
(13, 'Dr', 'Doom', 1),
(14, 'Black', 'Panther', 2),
(15, 'Miss', 'Medusa', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Patient_Diagnose`
--

DROP TABLE IF EXISTS `Patient_Diagnose`;
CREATE TABLE `Patient_Diagnose` (
  `Patient_ID` int(11) NOT NULL,
  `Diagnose_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Patient_Diagnose`
--

INSERT INTO `Patient_Diagnose` (`Patient_ID`, `Diagnose_ID`) VALUES
(1, 1),
(14, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(2, 6),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(8, 12),
(12, 12),
(13, 13),
(14, 14),
(1, 15),
(15, 15);

-- --------------------------------------------------------

--
-- Structure for view `1_antal_insjukna_i_olika_sjukdomar`
--
DROP TABLE IF EXISTS `1_antal_insjukna_i_olika_sjukdomar`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `1_antal_insjukna_i_olika_sjukdomar`  AS  select `patient`.`Patient_name` AS `Patient_name`,`patient`.`Patient_lastname` AS `Patient_lastname`,`diagnose`.`Diagnose_ID` AS `Diagnose_ID`,`diagnose`.`Diagnose_name` AS `Diagnose_name` from ((`patient_diagnose` left join `diagnose` on((`patient_diagnose`.`Diagnose_ID` = `diagnose`.`Diagnose_ID`))) left join `patient` on((`patient_diagnose`.`Patient_ID` = `patient`.`Patient_ID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `2_antal_sjuka_patienter`
--
DROP TABLE IF EXISTS `2_antal_sjuka_patienter`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `2_antal_sjuka_patienter`  AS  select count(`patient_diagnose`.`Diagnose_ID`) AS `COUNT(Patient_Diagnose.Diagnose_ID)` from ((`patient_diagnose` left join `diagnose` on((`patient_diagnose`.`Diagnose_ID` = `diagnose`.`Diagnose_ID`))) left join `patient` on((`patient_diagnose`.`Patient_ID` = `patient`.`Patient_ID`))) ;

-- --------------------------------------------------------

--
-- Structure for view `3_visa_olika_mediciner_och_dosering_f\'f6r_en_viss_sjukdom`
--
DROP TABLE IF EXISTS `3_visa_olika_mediciner_och_dosering_f\'f6r_en_viss_sjukdom`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `3_visa_olika_mediciner_och_dosering_f\'f6r_en_viss_sjukdom`  AS  select `diagnose`.`Diagnose_name` AS `Diagnose_name`,`medicine`.`Medicine_name` AS `Medicine_name`,`medicine`.`Medicine_dose` AS `Medicine_dose` from (`diagnose` left join `medicine` on((`diagnose`.`Diagnose_ID` = `medicine`.`FK_Diagnose`))) where (`diagnose`.`Diagnose_ID` = 3) ;

-- --------------------------------------------------------

--
-- Structure for view `4_sjuksk\'f6terskor_som_behandlar_en_viss_patient.`
--
DROP TABLE IF EXISTS `4_sjuksk\'f6terskor_som_behandlar_en_viss_patient.`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `4_sjuksk\'f6terskor_som_behandlar_en_viss_patient.`  AS  select `nurse`.`Nurse_ID` AS `Nurse_ID`,`nurse`.`Nurse_name` AS `Nurse_name`,`nurse`.`Nurse_lastname` AS `Nurse_lastname`,`patient`.`Patient_ID` AS `Patient_ID`,`patient`.`Patient_name` AS `Patient_name`,`patient`.`Patient_lastname` AS `Patient_lastname` from ((`nurse_patient` join `nurse` on((`nurse_patient`.`Nurse_ID` = `nurse`.`Nurse_ID`))) join `patient` on((`nurse_patient`.`Patient_ID` = `patient`.`Patient_ID`))) where (`patient`.`Patient_ID` = 4) ;

-- --------------------------------------------------------

--
-- Structure for view `5_visa_vilka_patienter_behandlas_av_en_l\'e4kare`
--
DROP TABLE IF EXISTS `5_visa_vilka_patienter_behandlas_av_en_l\'e4kare`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `5_visa_vilka_patienter_behandlas_av_en_l\'e4kare`  AS  select `doctor`.`Doctor_name` AS `Doctor_name`,`doctor`.`Doctor_lastname` AS `Doctor_lastname`,`patient`.`Patient_name` AS `Patient_name`,`patient`.`Patient_lastname` AS `Patient_lastname` from (`patient` join `doctor` on((`patient`.`FK_Doct_ID` = `doctor`.`Doctor_ID`))) where (`doctor`.`Doctor_ID` = 1) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Diagnose`
--
ALTER TABLE `Diagnose`
  ADD PRIMARY KEY (`Diagnose_ID`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`Doctor_ID`);

--
-- Indexes for table `Medicine`
--
ALTER TABLE `Medicine`
  ADD PRIMARY KEY (`Medecine_ID`),
  ADD KEY `FK_Diagnose` (`FK_Diagnose`);

--
-- Indexes for table `Nurse`
--
ALTER TABLE `Nurse`
  ADD PRIMARY KEY (`Nurse_ID`);

--
-- Indexes for table `Nurse_Patient`
--
ALTER TABLE `Nurse_Patient`
  ADD PRIMARY KEY (`Patient_ID`,`Nurse_ID`),
  ADD KEY `Nurse_ID` (`Nurse_ID`);

--
-- Indexes for table `Patient`
--
ALTER TABLE `Patient`
  ADD PRIMARY KEY (`Patient_ID`),
  ADD KEY `FK_Doct_ID` (`FK_Doct_ID`);

--
-- Indexes for table `Patient_Diagnose`
--
ALTER TABLE `Patient_Diagnose`
  ADD PRIMARY KEY (`Patient_ID`,`Diagnose_ID`),
  ADD KEY `Diagnose_ID` (`Diagnose_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Diagnose`
--
ALTER TABLE `Diagnose`
  MODIFY `Diagnose_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `Doctor_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `Medicine`
--
ALTER TABLE `Medicine`
  MODIFY `Medecine_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `Nurse`
--
ALTER TABLE `Nurse`
  MODIFY `Nurse_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `Patient`
--
ALTER TABLE `Patient`
  MODIFY `Patient_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Medicine`
--
ALTER TABLE `Medicine`
  ADD CONSTRAINT `medicine_ibfk_1` FOREIGN KEY (`FK_Diagnose`) REFERENCES `Diagnose` (`Diagnose_ID`);

--
-- Constraints for table `Nurse_Patient`
--
ALTER TABLE `Nurse_Patient`
  ADD CONSTRAINT `nurse_patient_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`),
  ADD CONSTRAINT `nurse_patient_ibfk_2` FOREIGN KEY (`Nurse_ID`) REFERENCES `Nurse` (`Nurse_ID`);

--
-- Constraints for table `Patient`
--
ALTER TABLE `Patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`FK_Doct_ID`) REFERENCES `doctor` (`Doctor_ID`);

--
-- Constraints for table `Patient_Diagnose`
--
ALTER TABLE `Patient_Diagnose`
  ADD CONSTRAINT `patient_diagnose_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`),
  ADD CONSTRAINT `patient_diagnose_ibfk_2` FOREIGN KEY (`Diagnose_ID`) REFERENCES `Diagnose` (`Diagnose_ID`);

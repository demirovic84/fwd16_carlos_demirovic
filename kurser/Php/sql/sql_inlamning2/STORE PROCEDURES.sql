/*STORE PROCEDURES*//*STORE PROCEDURES*//*STORE PROCEDURES*/
/*STORE PROCEDURES*//*STORE PROCEDURES*//*STORE PROCEDURES*/
/*STORE PROCEDURES*//*STORE PROCEDURES*//*STORE PROCEDURES*/




DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q1. Search for any patient, show all patients`(IN `Nr_patients` VARCHAR(255))
BEGIN
SELECT Patient.Patient_name, Patient.Patient_lastname, Diagnose.Diagnose_ID, Diagnose.Diagnose_name 
AS Diagnose
FROM Patient_Diagnose LEFT JOIN Diagnose 
ON Patient_Diagnose.Diagnose_ID = Diagnose.Diagnose_ID
LEFT JOIN Patient ON Patient_Diagnose.Patient_ID = Patient.Patient_ID;
END$$
DELIMITER ;

/*STORE PROCEDURES*//*STORE PROCEDURES*//*STORE PROCEDURES*/


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q2. Search number of patients`(IN `Nr_of_patients` INT(11))
    NO SQL
SELECT COUNT(*)
AS Amount_of_patients
FROM Patient_Diagnose$$
DELIMITER ;


/*STORE PROCEDURES*//*STORE PROCEDURES*//*STORE PROCEDURES*/

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q3. Search for medicines, show dose for a diagnose`(IN `Medicine` VARCHAR(255))
BEGIN
SELECT Diagnose.Diagnose_name, Medicine.Medicine_name, Medicine.Medicine_dose
AS Dose
FROM Diagnose 
LEFT JOIN Medicine ON Diagnose.Diagnose_ID = Medicine.FK_Diagnose
WHERE Medicine_name = Medicine;
END$$
DELIMITER ;

/*STORE PROCEDURES*//*STORE PROCEDURES*//*STORE PROCEDURES*/


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q4. Search for nurses and show patients`(IN `Nurses` VARCHAR(255))
BEGIN
SELECT Nurse.Nurse_ID, Nurse.Nurse_name, Nurse.Nurse_lastname, Patient.Patient_ID, Patient.Patient_name, Patient.Patient_lastname 
FROM Nurse_Patient
INNER JOIN Nurse ON Nurse_Patient.Nurse_ID = Nurse.Nurse_ID
INNER JOIN Patient ON Nurse_Patient.Patient_ID = Patient.Patient_ID
WHERE Nurse.Nurse_name = Nurses;
END$$
DELIMITER ;

/*STORE PROCEDURES*//*STORE PROCEDURES*//*STORE PROCEDURES*/


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q6. Search for diagnose`(IN `Diagnose` VARCHAR(255))
BEGIN
SELECT Patient.Patient_name, Patient.Patient_lastname, Diagnose.Diagnose_ID, Diagnose.Diagnose_name 
AS Diagnose
FROM Patient_Diagnose LEFT JOIN Diagnose ON Patient_Diagnose.Diagnose_ID = Diagnose.Diagnose_ID
LEFT JOIN Patient ON Patient_Diagnose.Patient_ID = Patient.Patient_ID
WHERE Diagnose_name = Diagnose;
END$$
DELIMITER ;

/*STORE PROCEDURES*//*STORE PROCEDURES*//*STORE PROCEDURES*/


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Q5. Search for doctors and show patients)`(IN `Doctor` VARCHAR(255))
BEGIN
SELECT doctor.Doctor_name,doctor.Doctor_lastname, Patient.Patient_name, Patient.Patient_lastname
AS Patient_lasname
FROM Patient
INNER JOIN doctor ON Patient.FK_Doct_ID = doctor.Doctor_ID
WHERE doctor.Doctor_name = Doctor;
END$$
DELIMITER ;

/*STORE PROCEDURES*//*STORE PROCEDURES*//*STORE PROCEDURES*/






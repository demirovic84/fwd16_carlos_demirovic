/*sql_inlamning1 Carlos Demirovic*/


/*Listar alla som är döda*/

/* Namn + StatusID
SELECT Status, First_name FROM Crew WHERE Status=2;*/


/*Namn + Efternamn + Döda*/
SELECT First_name, Last_name, Status FROM Crew, Status WHERE Status=2;
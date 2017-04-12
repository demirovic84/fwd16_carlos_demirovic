<?php

echo "<p><b>Required base - Success!!! :)</b></p>";
        // Inloggning uppgifter
        $servername = '83.168.227.23';
        $username = 'u1164707_CarlosD';
        $password = 'i5kT4T-1p@';
        $dbname = 'db1164707_CarlosD';
        // Hantering av databas uppgifter
try {
    // skapar en connection till db
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully!"."<br>----------------------------<br>"; 
    }
    // error hanterings
catch(PDOException $e)
    {
    echo "Connection failed: " . $e->getMessage();
    }
?>

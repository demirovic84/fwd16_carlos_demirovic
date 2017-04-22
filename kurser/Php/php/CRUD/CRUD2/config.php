<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);
ini_set('log_errors', 1);


try {
    
        
    $pdo = new PDO('mysql:host=83.168.227.23; dbname=db1164707_CarlosD', 'u1164707_CarlosD', 'i5kT4T-1p@');//Constructor
    $pdo->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE,PDO::FETCH_ASSOC);
    $pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES,false);//Viktig i produktionsmiljö
    
} catch (PDOException $e) {
    
    echo 'Connection failed: ' . $e->getMessage();
    
    die();
    
}

?>
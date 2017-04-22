<?php
//including the database connection file
include_once("config.php");
//include_once("config_local.php");
 
//getting id of the data from url
$rhymes_id = $_GET['rhymes_id'];
 
//deleting the row from table
$sql = "DELETE FROM Rhymes WHERE rhymes_id=:rhymes_id";
$query = $pdo->prepare($sql);
$query->execute(array(':rhymes_id' => $rhymes_id));
 
//redirecting to the display page (index.php in our case)
header("Location:index.php");
?>



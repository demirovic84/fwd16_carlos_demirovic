<!DOCTYPE html>

<?php
//including the database connection file
//include_once("config_local.php");
include_once("config.php");

 
$result = $pdo->query("call sp_rh");



?>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Rhymes</title>
          <link rel="stylesheet" href="style.css" media="screen">

    </head>
    <body>
<!--Länk till lägga till nya skämt och även gömma underline -->        
<button class="button1"><a href="add_form.php" style="text-decoration:none;">Add New Rhyme</a></button><br/><br/>
 
   <table class="mytable">
    <tr bgcolor='black'>
        <td bgcolor=''>Rhymes</td>
        <td bgcolor=''>Author Name</td>
        <td bgcolor=''>Update</td>
        
    </tr>
    <?php
    
    
    while($row = $result->fetch()) {         
        echo "<tr>";
        echo "<td>".$row['rhymetext']."</td>";
        echo "<td>".$row['name']."</td>";
        echo "<td><a href=\"edit.php?rhymes_id=$row[rhymes_id]\">Edit</a> | <a href=\"delete.php?rhymes_id=$row[rhymes_id]\" onClick=\"return confirm('Are you sure you want to delete?')\">Delete</a></td>";        
    }
    
    ?>
    </table>
    </body>
</html>

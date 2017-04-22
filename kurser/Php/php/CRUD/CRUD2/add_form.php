<?php

//include_once("config_local.php");
include_once("config.php");


if(isset($_POST['Submit'])) {    
    $rhymetext = $_POST['rhymetext'];
    $authorid = $_POST['author_id'];
        
    // Checking empty fields
    if(empty($rhymetext) || empty($authorid)) {
                
        if(empty($rhymetext)) {
            echo "<font color='red'>Name field is empty.</font><br/>";
        }
        
        if(empty($authorid)) {
            echo "<font color='red'>Email field is empty.</font><br/>";
        }
        
        //Go back
        echo "<br/><a href='javascript:self.history.back();'>Go Back</a>";
    } else { 
        // if all the fields are filled (not empty) 
            
        //insert data to database        
        $sql = "INSERT INTO Rhymes(rhymetext, author_id) VALUES(:rhymetext, :author_id)";
        $query = $pdo->prepare($sql);
                
        $query->bindparam(':rhymetext', $rhymetext);
        $query->bindparam(':author_id', $authorid);
        $query->execute();
                
        //display success message
        echo "<font color='green'>Rhyme added successfully.";
        echo "<br/><a href='index.php'>View Result</a>";
    }
}

$authorSql = "SELECT * FROM Author"; 
$authorQuery = $pdo->prepare($authorSql); 
$authorQuery->execute(); 
        
?>

<!DOCTYPE html>

<html>
    <head>
        <title>Rhymes</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

    </head>
    <body bgcolor="deepskyblue">
        <button class="button1"><a href="index.php" style="text-decoration:none;">Home</a></button><br/><br/>

    <br/><br/>

    <form action="add_form.php" method="post" name="form1">
        <table width="0%" border="0">
            <tr> 
                <td class="add">Add your rhyme</td>
<!-- Här lägger vi till det nya skämtet -->                
                <td><td><textarea name="rhymetext" rows="6" cols="40" ></textarea></td>
            </tr>
            
            <tr> 
<td>Author</td> 
<td>

<!-- Dropdown som laddas med författare från databasen.-->    
<select name="author_id"> 
<?php

$authorid="";
while($author = $authorQuery->fetch()) { 
if ($author['author_id'] == $authorid) { 
//The author is currently associated to the joke, select it by default 
echo "<option value=\"{$author['author_id']}\" selected>{$author['name']}</option>"; 
} else { 
//The author is not currently associated to the joke 
echo "<option value=\"{$author['author_id']}\">{$author['name']}</option>"; 
} 
} 
?> 
</select> 
</td> 
</tr> 
    <tr> 
        <td></td>
            <td><input type="submit" name="Submit" value="Add"></td>
            </tr>
        </table>
    </form>
    </body>
</html>



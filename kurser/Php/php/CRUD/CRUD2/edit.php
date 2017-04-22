<?php 
// including the database connection file 
include_once("config.php");
//include_once("config_local.php");

/*
 * Vi organiserar sidan på sån sätt att vi har all processkod här i toppen av
 * sidan. All information som vi behöver processa hämtas från den nedre delen
 * av sidan där html formuläret finns.
 * Där finns namnen på formulärfälten som vi använder i php koden här upp för 
 * att processas.
*/

/*
 * Vi vill ta emot resultatet från föregående sida och med $_GET ta emot id för
 * den raden vi ska redigera
*/
$rhymes_id = $_GET['rhymes_id'];

/*
 * vi använder värdet på id från föregående sida som vi fick från get och 
 * skriver en sql fråga där vi anvnder :id för vara basis för en where fråga.
 * Vi vill alltså bara presentera ett enskild skämt baserat på den id vi
 * sprarade från raden från förra sidan.
 */
$sql = "SELECT * FROM Rhymes WHERE rhymes_id=:rhymes_id"; 
$query = $pdo->prepare($sql); 
$query->execute(array(':rhymes_id' => $rhymes_id)); 
/*
 * Resultatet av nedanstående kod kommer vi fylla ut i en html forumlär längre
 * ner på sidan. 
*/
while($row = $query->fetch()) 
{ 
$rhymetext = $row['rhymetext']; 
$authorid = $row['author_id']; 
}

/*
 * På redigerings sidan så kommer vi en textruta för att en enskild skämt.
 * Vi vill däremot inte att användaren ska behöva skriva en authorid för
 * skämtet. Förutom att möjligheten till misstförstånd blir större att hålla 
 * koll pa en siffra så försämrar det avsevärt användarupplevelsen.
 * Vi skapar en seperat fråga som kommer vara basis för en dropdown senare i 
 * html formuläret
*/
$authorSql = "SELECT * FROM Author"; 
$authorQuery = $pdo->prepare($authorSql); 
$authorQuery->execute();


?> 
<?php 

/*
 * vi kontrollerar om vi har tryckt på uppdatera knappen som har namnet update
 * i formuläret, i så fall så lagrar vi id och fälten joketext och authorid i 
 * respektive variabel, som ska finnas i vår db tabell.
*/
if(isset($_POST['update'])) 
{ 
$rhymes_id = $_POST['rhymes_id']; 

$rhymetext=$_POST['rhymetext']; 
$authorid=$_POST['author_id']; 


// checking empty fields

if(empty($rhymetext) || empty($authorid)) { 

if(empty($rhymetext)) { 
echo "<font color='red'>Name field is empty.</font><br/>"; 
} 

if(empty($authorid)) { 
echo "<font color='red'>Author field is empty.</font><br/>"; 
} 


} else { 
/*
 * vi använder sql syntaxen för uppdateringar och skickar med id för raden.
 * OBS att man i PDO använder platshållare (joketext=:joketext) där :joketext är
 * namnet på platshållaren för att para ihop det som finns i  formuläret till
 *  databasen. Detta läggs till i variablen $sql
*/

$sql = "UPDATE Rhymes SET rhymetext=:rhymetext, author_id=:author_id WHERE rhymes_id=:rhymes_id";

/*
 * vi använder pdo objektets prepare metod som tar $sql som argument och sparar
 * resultaet i variabeln $query
*/
$query = $pdo->prepare($sql); 
/*Sedan binder vi det som finns i platshållaren till variabeln*/
$query->bindparam(':rhymes_id', $rhymes_id); 
$query->bindparam(':rhymetext', $rhymetext); 
$query->bindparam(':author_id', $authorid);
//vi använder det som nu finns i $query för att köra sql frågan 
$query->execute(); 

// Alternative to above bindparam and execute 
// $query->execute(array(':id' => $id, ':joketext' => $joketext)); 

//header används för att skicka tillbaka efter proccesn är klart till en sida
header("Location: index.php"); 
} 
}  
?> 
<!DOCTYPE html> 
<!-- 
To change this license header, choose License Headers in Project Properties. 
To change this template file, choose Tools | Templates 
and open the template in the editor. 
--> 
<html> 
<head> 
<meta charset="UTF-8"> 
<link rel="stylesheet" href="style.css" media="screen">

<title></title> 
</head> 
<body> 
    
<a href="index.php">Home</a> 
<br/><br/> 

<form name="form1" method="post" action="edit.php"> 
<table border="0"> 
<tr> 
<td>Rhymes</td> 
<!-- Resultatet av vår sql fråga från rad34 lägger vi en textarea, man kan alltid
blanda html och php som ni ser, genom att flika in php taggar som start och slut-->
<td><textarea name="rhymetext" rows="6" cols="40" ><?php echo $rhymetext;?></textarea></td>
</tr> 
<tr> 
<td>Author</td> 
<td>
<!-- För att användare ine ska behöva stoppa in siffror för en authorid så skapar
vi en dropdown, där resultatet av sql frågan från rad 47 $authorQuery stoppar in
i $author-->    
<select name="author_id"> 
<?php 
while($author = $authorQuery->fetch()) { 
if ($author['author_id'] == $authorid) { 
/*
 * Vi använder id som vi har för att, som defualt visa den författaren som var
 * kopplat till ett viss skämt vald från föregående sida.
*/ 
echo "<option value=\"{$author['author_id']}\" selected>{$author['name']}</option>"; 
} else { 
/*
 * Skulle vi däremot vilj ändra författaren till nåt annat det som vi fick från
 * förra sidan, så väljer vi det nu och också fångar upp id:et för den
 * författaren
*/ 
echo "<option value=\"{$author['author_id']}\">{$author['name']}</option>"; 
} 
} 
?> 
</select> 
</td> 
</tr> 

<tr>
<!-- Vi visar inte id för den skämtet vi vill redigera -->    
<td><input type="hidden" name="rhymes_id" value=<?php echo $_GET['rhymes_id'];?></td> 
<td><input type="submit" name="update" value="Update"></td> 
</tr> 
</table> 
</form>
    </body>
</html>

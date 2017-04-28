<!DOCTYPE html>


<html>
    <head>
        <meta charset="UTF-8">
        <title>aircraft</title>
    </head>
    <body>
        <?php 
            require_once ("subClasses.php");
            
            //anropa statiska metoden som är i abstrakta klassen (innan vi använder konstruktorn)
            /*För att komma åt konstanter, statiska egenskaper och metoder i en instans
             * så använder man sig av instansnamnet:: efter följd av konstanten eller den statiska egenskapen eller metoden
            */
            aircraft::stat();
            
            
            //skapa objekt av klassen KitchenKnife
            //Det är viktigt att paratmetrarna i instansen skrivs i exakt samma ordningsföljd som konstrutorn i klassen.
            //$owner, $length, $material
            $missile1 = new Interceptor(6, "Viggen", 2000, 3500, 6000);
           
            print_r($missile1->refuel()."<br>");
           
            //skapa objekt av klassen CuttingKnife
            //$restaurantName, $length, $material
            $bomb1 = new Bomber(40, "B52", 900, 15000, 20000);
            


            //Visa våra objekt
            // TRUE som argument här formaterar vår print output
            echo "<pre>".print_r($missile1, TRUE)."</pre>";
                        print_r($bomb1->refuel()."<br>");

            echo "<pre>".print_r($bomb1, TRUE)."</pre>";
            
         ?>
    </body>
</html>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bladi</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<?php
        

        if(isset($_POST["btn"]))
        {
            
            if ($_POST ["email"]!=""&& $_POST["password"]!="") 
            {   $error="";
                # code...
                $login=$_REQUEST["email"];
                $password=$_REQUEST["password"];
                $con=mysqli_connect("localhost","root","");
                if(!$con){ echo "impossible de se connecter a localhost";exit;}
                if(!mysqli_select_db($con,"bladi")){echo "impossible de se connecter a la base de données";exit;}
                //requete pour selectionner l'user qui a pour mail et mot de passe les identifiants qui ont ete entrées 
                $resultat=mysqli_query($con,"select * from authentification where email='$login'and password='$password';");
                if($resultat)
                    {
                    $num_ligne=mysqli_num_rows($resultat);//compter le nombre de ligne ayant rapport a la requete sql
                    if($num_ligne>=1)
                    {
                        
                        //nous allons demarrer la session avant toute chose
                        session_start();
                        //crrer la variable session qui va contenir l'email de l'utilisateur
                        $_SESSION["login"]=$login;
                        header("location:./accueil/hotels/hotels.php");//hadi khassha tkoun mor la creation de session
                    }
                    else
                    {
                        //echo "mot de passe ou email incorrect";
                        $error="Email et / ou mot de passe incorrect";
                    }
                }
                else 
				{ 
					echo "Erreur dans l'exécution de la requête. ";
					mysqli_error($con); 
				} 
				mysqli_close($con);
                
            }
            else
            {   
                $error="veuillez entrer les valeurs des champs";
            }
        }
    ?>
    <div class="container">
        <div class="formwraper">
            <div class="welcomDiv">
                <h2> BLADI<span>.com</span></h2>
                <div class="textContainer">
                    <p class="text"> Votre compagnon ultime pour explorer les trésors du Maroc </p>
                </div>
                
            </div>
            <div class="formDiv">
               
                <p class="title">SE CONNECTER</p>
                <!--<p class="text">
                    Sign up with social media
                </p>
                <hr>
                <div class="orDiv"> Or</div>
                    <p class="text">
                        Sign up with email address
                    </p>-->
                    <?php
                    if(isset($error))//si la variable erreurs existe, on affiche le contenu;
                    {
                        echo "<p  style='color: red;
                        font-size: 10px; width:110%'>".$error."</p>";
                    }
                ?>
                    <form action="" method="post" name="login_form" onsubmit="return verify()">
                        <div class="input-box">
                            <label for="email">Email</label>
                            <input type="text" autocomplete="off" name="email" id="email" placeholder="Email">
                        </div>
                        <div id="emailerror">Email invalid</div>
                        <div class="input-box">
                            <label for="password">Mot de passe</label> 
                            <input type="password" name="password" id="password" placeholder="Mot de passe">
                        </div>
                        <div id="passerror">Mot de passe  erroné</div>
                        <button class="btn" name="btn"> Se connecter</button>
                    </form>
                </div>
            
        </div>
    </div>
    <script src="script.js"></script>
</body>
</html>
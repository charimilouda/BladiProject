<?php
$id=$_REQUEST['id'];
$con=mysqli_connect("localhost","root","");
if(!$con){ echo "impossible de se connecter a localhost";exit;}
if(!mysqli_select_db($con,"bladi")){echo "impossible de se connecter a la base de données";exit;}
$resultat=mysqli_query($con,"DELETE FROM shopping WHERE ID='$id'");
if($resultat)
{
    
    ?>
    <meta http-equiv='refresh' content="0, url=shopping.php">
    <?php
    echo "<script>alert ('Boutique supprimée avec succès')</script>";

}
else{
    echo "Erreur dans l'exécution de la requête. ";
            exit;
}
?>
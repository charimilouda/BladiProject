<?php
	session_start(); 
	$_SESSION = array();// on doit supprimer les données de session
	setcookie(session_name(), ' ', time()-1); //on supprime le cookie de session 
	session_destroy();
	
	header('location: ../index.php'); //rediriger l’user vers la page de login
?>	

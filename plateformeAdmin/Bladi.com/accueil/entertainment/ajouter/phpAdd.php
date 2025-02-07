<?php
        $nom=$_POST["name"];
        $adresse=$_POST["adresse"];
        $website=$_POST["website"];
        $tel=$_POST["tel"];
        $description1=$_POST["desc"];
        $description=addslashes($description1);
        $services=$_POST["services"];
        $att=$_POST["lat"];
        $long=$_POST["long"];
        $rating=2;
        //recuperer les images insérées 
        $image1= $_FILES["photo1"]["tmp_name"];/*est ce que c'est comme ça ou bien je dois faire file_get_contents($_FILES["photo1"]["tmp_name"]); nssewel zakaria*/
        $image2= $_FILES["photo2"]["tmp_name"];
        $image3= $_FILES["photo3"]["tmp_name"];

        $image1name=$_FILES["photo1"]["name"];
        $image2name=$_FILES["photo2"]["name"];
        $image3name=$_FILES["photo3"]["name"];

        $con=mysqli_connect("localhost","root","");
        if(!$con){ echo "impossible de se connecter a localhost";exit;}
        if(!mysqli_select_db($con,"bladi")){echo "impossible de se connecter a la base de données";exit;}
        $res=mysqli_query($con,"SELECT * FROM divertissement ORDER BY id DESC LIMIT 1;");
        if(!$res)
        {
            echo "Erreur dans l'exécution de la requête. ";
                exit;
        }
        else{
            while($ligne = mysqli_fetch_object($res)) {
                $id=$ligne->id;
                $id++;
                }
            $query=mysqli_query($con,"insert into divertissement values('$id','$nom','$description','$tel','$website','$services','$adresse','$att','$long','$rating','$image1','$image2','$image3','$image1name','$image2name','$image3name');");//attention ici c'est tres important d'ajouter '' je dois pas mettre les variables tous seul , comme je peux pas utilise ""
            move_uploaded_file($image1,'../images/'.$image1name);
            move_uploaded_file($image2,'../images/'.$image2name);
            move_uploaded_file($image3,'../images/'.$image3name);
            if(!$query)
            {   
                echo "Erreur dans l'exécution de la requête. ";
                exit;
            } 
            else{
                
                header('location:../entertainment.php');
            }
        }

        
        mysqli_close($con);       

    
?>
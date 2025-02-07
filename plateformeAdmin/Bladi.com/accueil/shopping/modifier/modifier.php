<?php
        $con=mysqli_connect("localhost","root","");
        if(!$con){ echo "impossible de se connecter a localhost";exit;}
        if(!mysqli_select_db($con,"bladi")){echo "impossible de se connecter a la base de données";exit;}
        $id= $_REQUEST['id'];
        $query=mysqli_query($con,"SELECT * FROM shopping WHERE ID='$id';");
        ?>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>bladi</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="modifier.css">
</head>
<body>
    <div class="container">
        <nav class="navbar">
            
            <div class="table-header" >
                <div class="nav-icon" onclick="toggleSideBar()">
                <i class="fa fa-bars"></i>
                </div>
                    <p> Modifier boutique </p>
                    
                </div>
           
        </nav>
        <main>
            <div class="subcontainer">
                <form action="phpEdit.php?id=<?php echo $id?>" method="post" ENCTYPE="multipart/form-data" onsubmit="return verify()">
                <div class="upload"><!--data:image;base64,'.base64_encode($ligne->nomphoto1).'-->
                <?php 
                                
                                if(!$query)
                                {   
                                    echo "Erreur dans l'exécution de la requête. ";
                                    exit;
                                } 
                                else{
                                    while($ligne = mysqli_fetch_assoc($query)) {
                                        $photo1=$ligne["nomphoto1"];
                                        $photo2=$ligne["nomphoto2"];
                                        $photo3=$ligne["nomphoto3"];
                                        if(!empty ($photo1) && !empty ($photo2) && !empty ($photo3)){

                                        ?>
                                        <div class="img_">
                                            <img src="../images/<?php echo $photo1 ?>" alt="" style="width: 150px;
                                          height: 150px;border-right: .5rem;border: 8px solid #584b21;border-radius: 0;vertical-align: middle;">
                                          
                                        </div>
                                        <div class="img_">
                                            <img src="../images/<?php echo $photo2 ?>" alt="" style="width: 150px;
                                          height: 150px;border-right: .5rem;border: 8px solid #584b21;border-radius: 0;vertical-align: middle;">
                                        </div>
                                        <div class="img_">
                                            <img src="../images/<?php echo $photo3 ?>" alt="" style="width: 150px;
                                          height: 150px;border-right: .5rem;border: 8px solid #584b21;border-radius: 0;vertical-align: middle;">
                                        </div>
                                        <?php
                                        }
                                        else{
                                            if(!empty ($photo1)&& !empty($photo2) && empty ($photo3))
                                            {
                                                ?>
                                                    <div class="img_">
                                                        <img src="../images/<?php echo $photo1 ?>" alt="" style="width: 150px;
                                          height: 150px;border-right: .5rem;border: 8px solid #584b21;border-radius: 0;vertical-align: middle;">
                                                    </div>
                                                    <div class="img_">
                                                        <img src="../images/<?php echo $photo2 ?>" alt="" style="width: 150px;
                                          height: 150px;border-right: .5rem;border: 8px solid #584b21;border-radius: 0;vertical-align: middle;">
                                                    </div>
                                                    <div class="img_">
                                                        <img src="../images/<?php echo $photo3 ?>" alt="" style="width: 150px; display:none;
                                          height: 150px;border-right: .5rem;border: 8px solid #584b21;border-radius: 0;vertical-align: middle;">
                                                    </div>
                                                <?php
                                            }
                                            else{
                                                if(!empty ($photo1) && empty ($photo2) && !empty ($photo3))/*cest a dire 1 et 3 */{
                                                    ?>
                                                        <div class="img_">
                                                            <img src="../images/<?php echo $photo1 ?>" alt="" style="width: 150px;
                                          height: 150px;border-right: .5rem;border: 8px solid #584b21;border-radius: 0;vertical-align: middle;">
                                                        </div>
                                                        <div class="img_">
                                                            <img src="../images/<?php echo $photo2 ?>" alt="" style="width: 150px;display:none;
                                          height: 150px;border-right: .5rem;border: 8px solid #584b21;border-radius: 0;vertical-align: middle;">
                                                        </div>
                                                        <div class="img_">
                                                            <img src="../images/<?php echo $photo3 ?>" alt="" style="width: 150px;
                                          height: 150px;border-right: .5rem;border: 8px solid #584b21;border-radius: 0;vertical-align: middle;">
                                                        </div>
                                        
                                                    <?php

                                                }else{
                                                    ?>
                                                        <div class="img_">
                                                        <img src="../images/<?php echo $photo1 ?>" alt="" style="width: 150px;
                                          height: 150px;border-right: .5rem;border: 8px solid #584b21;border-radius: 0;vertical-align: middle;">
                                                        </div>
                                                        <div class="img_">
                                                            <img src="../images/<?php echo $photo2 ?>" alt="" style="width: 150px;display:none;
                                          height: 150px;border-right: .5rem;border: 8px solid #584b21;border-radius: 0;vertical-align: middle;">
                                                        </div>
                                                        <div class="img_">
                                                            <img src="../images/<?php echo $photo3 ?>" alt="" style="width: 150px;display:none;
                                          height: 150px;border-right: .5rem;border: 8px solid #584b21;border-radius: 0;vertical-align: middle;">
                                                        </div>
                                                    <?php
                                                }
                                            }
                                        }
                                        }
                                }
                            ?>
            </div>
            <div class="form-first">
                <div class="details hotel">
                    <div class="inputs"><!--fields-->
                        <div class="input-field">
                            <label for="name"><span class="required">*</span> Nom </label>
                            <input type="text" id="name" name="name" placeholder="entrer le nom de la boutique" required value="<?php 
                           $query=mysqli_query($con,"SELECT * FROM shopping WHERE ID='$id';");
                                if(!$query)
                                {   
                                    echo "Erreur dans l'exécution de la requête. ";
                                    exit;
                                } 
                                else{
                                    while($ligne = mysqli_fetch_object($query)){
                                        echo $ligne->nom;
                                        }
                                    
                                }
                                 
                            ?>">
                        </div>

                        <div class="input-field">
                            <label for="name"> <span class="required">*</span> Adresse </label>
                            <input type="text" id="adresse" name="adresse" placeholder="entrer l'adresse de la boutique" required value="<?php 
                                $query=mysqli_query($con,"SELECT * FROM shopping WHERE ID='$id';");
                                if(!$query)
                                {   
                                    echo "Erreur dans l'exécution de la requête. ";
                                    exit;
                                } 
                                else{
                                    while($ligne = mysqli_fetch_object($query)) {
                                        echo $ligne->adresse;
                                        }
                                    
                                }
                                 
                            ?>">
                        </div>

                        <div class="input-field">
                            <label for="website"> Site web  </label>
                            <input type="text" id="website" name="website" placeholder="entrer le site web de la boutique"value="<?php 
                                $query=mysqli_query($con,"SELECT * FROM shopping WHERE ID='$id';");
                                if(!$query)
                                {   
                                    echo "Erreur dans l'exécution de la requête. ";
                                    exit;
                                } 
                                else{
                                    while($ligne = mysqli_fetch_object($query)) {
                                        echo $ligne->website;
                                        }
                                    
                                }
                                 
                            ?>" >
                        </div>

                        <div class="input-field">
                            <label for="tel"> Téléphone </label>
                            <input type="text" id="tel" name="tel" placeholder="entrer le téléphone de la boutique" value="<?php 
                                $query=mysqli_query($con,"SELECT * FROM shopping WHERE ID='$id';");
                                if(!$query)
                                {   
                                    echo "Erreur dans l'exécution de la requête. ";
                                    exit;
                                } 
                                else{
                                    while($ligne = mysqli_fetch_object($query)) {
                                        echo $ligne->tel;
                                        }
                                    
                                }
                                 
                            ?>">
                            <div id="errorPhone"> Numéro de téléphone invalid </div>
                        </div>
                        <div class="input-field">
                            <label for="lat"> <span class="required">*</span> Latitude </label>
                            <input type="text" id="lat" name="lat" placeholder="entrer latitude de la boutique"  required value="<?php 
                                $query=mysqli_query($con,"SELECT * FROM shopping WHERE ID='$id';");
                                if(!$query)
                                {   
                                    echo "Erreur dans l'exécution de la requête. ";
                                    exit;
                                } 
                                else{
                                    while($ligne = mysqli_fetch_object($query)) {
                                        echo $ligne->atitude;
                                        }
                                    
                                }
                                 
                            ?>">
                            
                        </div>
                        <div class="input-field">
                        <label for="long"> <span class="required">*</span> Longitude </label>
                                <input type="text" id="long" name="long" placeholder="entrer longitude de la boutique"  required value="<?php 
                                    $query=mysqli_query($con,"SELECT * FROM shopping WHERE ID='$id';");
                                    if(!$query)
                                    {   
                                        echo "Erreur dans l'exécution de la requête. ";
                                        exit;
                                    } 
                                    else{
                                        while($ligne = mysqli_fetch_object($query)) {
                                            echo $ligne->longe;
                                            }
                                        
                                    }
                                ?>">
                        
                    </div>
                        <div class="input-field">
                            <label for="desc"> Description </label>
                            <textarea  id="desc" name="desc" ><?php 
                                $query=mysqli_query($con,"SELECT * FROM shopping WHERE ID='$id';");
                                if(!$query)
                                {   
                                    echo "Erreur dans l'exécution de la requête. ";
                                    exit;
                                } 
                                else{
                                    while($ligne = mysqli_fetch_object($query)) {
                                        echo $ligne->description;
                                        }
                                    
                                }
                                 
                            ?></textarea>
                        </div>
                        <div class="input-field">
                            <label for="services"> Services  </label>
                            <textarea  id="services" name="services" ><?php 
                                $query=mysqli_query($con,"SELECT * FROM shopping WHERE ID='$id';");
                                if(!$query)
                                {   
                                    echo "Erreur dans l'exécution de la requête. ";
                                    exit;
                                } 
                                else{
                                    while($ligne = mysqli_fetch_object($query)) {
                                        echo $ligne->services;
                                        }
                                    
                                }
                                 
                            ?></textarea>
                        </div>
                        

                        
                        <div class="input-file">
                        
                            
                            <label for="photo1" > <span class="required"></span> Photo 1 </label>
                            <input type="file" class="upload-box" id="photo1" name="photo1"required value="<?php 
                                $query=mysqli_query($con,"SELECT * FROM shopping WHERE ID='$id';");
                                if(!$query)
                                {   
                                    echo "Erreur dans l'exécution de la requête. ";
                                    exit;
                                } 
                                else{
                                    while($ligne = mysqli_fetch_object($query)) {
                                        echo $ligne->nomphoto1;
                                        }
                                    
                                }
                                 
                            ?>"  accept="image/*">
                            <span>
                            
                            </span>
                        </div>
                        <div class="input-file">
                            <label for="photo2" > Photo 2 </label>
                            <input type="file" class="upload-box" id="photo2" name="photo2"  value="" accept="image/*" >
                        </div>
                        <div class="input-file">
                            <label for="photo3" >  Photo 3 </label>
                            <input type="file" class="upload-box" id="photo3" name="photo3" value="" accept="image/*">
                        </div>
                    </div>
                    <div class="buttons">
                        <button class="Annuler" type="reset" onclick="window.location.href='../bureaux_change.php';"> 
                            <i class="fa fa-angle-left" aria-hidden="true"></i>
                            <span class="btn-text"> Annuler </span>
                           
                        </button>
                        <button class="Save" type="submit" id="submit">
                            <span class="btn-text"> Enregistrer </span>
                            <i class="fa fa-bookmark-o" aria-hidden="true"></i>
                        </button>
                    </div>
                </div>
            </div>
           </form>
            </div>
            
        </main>

        <div id="sidebar">
            <div class="sidebar__title" style="display:  flex;
                justify-content: space-between;
                align-items: center;
                color: White;
                margin-bottom: 25px;">
                <h1 style="font-size: 18px;
                display: inline;
                color: white; text-align: center;"> Bladi </h1>
                <i class="fa fa-times"  id="sidebarIcon" onclick="closeSidebar()"></i>
                
            </div>
            <div class="sidebar__menu">
                <!--<div class="sidebar__link ">
                    <i class="fa fa-home"></i>
                     <a href="../../accueil.html"> Tableau de board</a>
                </div>-->
                <h2> SERVICES </h2>
                <div class="sidebar__link ">
                    <i class="fa fa-bed" aria-hidden="true"></i>
                    <a href="../../hotels/hotels.php"> Hotels </a>
                </div>

                <div class="sidebar__link ">
                    <i class="fa fa-user-md" aria-hidden="true"></i>
                    <a href="../../pharmacies/pharmacies.php"> Pharmacies </a>
                </div>


                <div class="sidebar__link ">
                    <i class="fa fa-cutlery" aria-hidden="true"></i>
                    <a href="../../restaurants/restaurants.php"> Restaurants </a>
                </div>
                <div class="sidebar__link ">
                    <i class="fa fa-university" aria-hidden="true"></i>
                    <a href="../../banques/banques.php"> Banques </a>
                </div>
                
                <div class="sidebar__link ">
                    <i class="fa fa-exchange" aria-hidden="true"></i>
                    <a href="../../bureaux_change/bureaux_change.php"> Bureaux de change </a>
                </div>

                <div class="sidebar__link active_menu_link">
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                    <a href="../../shopping/shopping.php"> Boutiques </a>
                </div>

                <div class="sidebar__link">
                    <i class="fa fa-university" aria-hidden="true"></i>
                    <a href="../../public_services/public_services.php"> Services publics </a>
                </div>

                
                <div class="sidebar__link">
                    <i class="fa fa-smile-o" aria-hidden="true"></i>
                    <a href="../../entertainment/entertainment.php"> Divertissement </a>
                </div>

                <div class="sidebar__link">
                    <i class="fa fa-futbol-o" aria-hidden="true"></i>
                    <a href="../../sports/sports.php"> Sports </a>
                </div>
                
                <div class="sidebar__link">
                    <i class="fa fa-car" aria-hidden="true"></i>
                    <a href="../../transportation/transportation.php"> Transportation </a>
                </div>
                
                

                <h2> NOUS </h2>
                <div class="sidebar__link ">
                    <i class="fa fa-newspaper-o" aria-hidden="true"></i>
                    <a href="../../news/news.php"> Nouveautés </a>
                </div>

                <div class="sidebar__link ">
                    <i class="fa fa-info" aria-hidden="true"></i>
                    <a href="../../about/about.php"> A propos de nous </a>
                </div>

                <div class="sidebar__link">
                    <i class="fa fa-user-secret"></i>
                    <a href="../../settings/settings.php"> Paramètres </a>
                </div>

                <div class="sidebar__logout">
                    <i class="fa fa-power-off"></i>
                    <a href="../../deconnexion/deconnexion.php" onclick="javascript:return confirm('Vous confirmez votre action ?') ;"> déconnexion </a>
                </div>
            </div>
        </div>
    </div>


    <script src="modifier.js"></script>
</body>
</html>
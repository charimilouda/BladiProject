<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bladi</title>
    <link rel="stylesheet" href="banques.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <div class="container">
        <nav class="navbar">
            
            <div class="table-header" >
                <div class="nav-icon" onclick="toggleSideBar()">
                <i class="fa fa-bars"></i>
            </div>
                <p> Liste des banques </p>
                <div id="search_add">
                    <form action="" method="get" style="display:inline">
                        <input placeholder="Banque"   name="chercher" value="<?php if(isset($_GET['chercher'])){echo $_GET['chercher'];}?>">
                       <button class="add-new"> Chercher </button>
                    </form>
                    <a href="./ajouter/ajouter.html"><button class="add-new"  > Ajouter banque </button></a>
                </div>
            </div>
            
        </nav>
        <main>
            <div class="table">
                
                <section class="table-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th> Id</th>
                                <th> Nom</th>
                                <th> Téléphone</th>
                                <th> Site web</th>
                                <th> Latitude </th>
                                <th> Longitude </th>
                                <th> Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                $connexion = mysqli_connect("localhost","root","");
                                if( !$connexion) { echo "Desolé, connexion à localhost impossible"; exit; }//vérification
                                if( !mysqli_select_db($connexion,'bladi')) { echo "Désolé, accès à la base superMarche 
                                impossible"; exit; } 
                                if(isset($_GET ['chercher']))
                                {
                                    $filteredValues=$_GET['chercher'];
                                    $resultat = mysqli_query($connexion ,"SELECT * FROM banques WHERE concat(nom,description,services,website,tel,atitude) Like '%$filteredValues%'"); 
                                    if(mysqli_num_rows($resultat)>0 ) 
                                    {
                                        while($ligne = mysqli_fetch_object($resultat)) {
                                        echo '<tr><td>'. $ligne->id. ' </td><td>'.$ligne->nom.'</td><td>'.$ligne->tel.'</td><td>'.$ligne->website.'</td><td>'.$ligne->atitude.'</td><td>'.$ligne->longe.'</td><td>'."<a href='./modifier/modifier.php?id= $ligne->id;'><button> <i class='fa fa-pencil' aria-hidden='true'></i></button></a>
                                        <a href='delete.php?id=$ligne->id;' onclick=\"javascript:return confirm('Êtes-vous sûr de vouloir supprimer cette banque ? Cette action est irréversible et toutes les données associées à cette banque seront définitivement perdues. Veuillez prendre note que cette action ne peut pas être annulée. Êtes-vous certain de vouloir continuer ?');\"><button><i style='color:red' class='fa fa-trash' aria-hidden='true'  id='btn_' ></i></button>".'</td></tr>';
                                        }
                                    } 
                                    else {
                                        ?>
                                            <tr>
                                                <td colspan="7"> <strong> Aucun résultat </strong> </td>
                                            </tr>
                                        <?php
                                         /*echo "Erreur dans l'exécution de la requête. ". mysqli_error($connexion); */} mysqli_close($connexion);
                                }
                                else{
                                    $resultat = mysqli_query($connexion ,"SELECT * FROM banques "); 
                                    if(mysqli_num_rows($resultat)>0 ) 
                                    {
                                        while($ligne = mysqli_fetch_object($resultat)) {
                                        echo '<tr><td>'. $ligne->id. ' </td><td>'.$ligne->nom.'</td><td>'.$ligne->tel.'</td><td>'.$ligne->website.'</td><td>'.$ligne->atitude.'</td><td>'.$ligne->longe.'</td><td>'."<a href='./modifier/modifier.php?id=$ligne->id'><button> <i class='fa fa-pencil' aria-hidden='true'></i></button></a>
                                        <a href='delete.php?id=$ligne->id;' onclick=\"javascript:return confirm('Êtes-vous sûr de vouloir supprimer cette banque ? Cette action est irréversible et toutes les données associées à cette banque seront définitivement perdues. Veuillez prendre note que cette action ne peut pas être annulée. Êtes-vous certain de vouloir continuer ?');\"><button  ><i style='color:red'class='fa fa-trash' aria-hidden='true' class='btn' id='btn_' ></i></button>".'</td></tr>';
                                        }

                                    } 
                                    else {
                                        ?>
                                            <tr>
                                                <td colspan="7"> <strong> Aucun résultat </strong> </td>
                                            </tr>
                                        <?php
                                        mysqli_close($connexion);
                                    }
                                }
                            ?>           
                        </tbody>
                    </table>
                </section>
                <!--<section class="table-footer">
                    <div class="pagination">
                        <div><i class="fa fa-angle-double-left" aria-hidden="true"></i></div>
                        <div> <i class="fa fa-chevron-left" aria-hidden="true"></i> </div>
                        <div>1</div>
                        <div>2</div>
                        <div> <i class="fa fa-chevron-right" aria-hidden="true"></i></div>
                        <div><i class="fa fa-angle-double-right" aria-hidden="true"></i></div>
                    </div>
                </section>-->
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
                    <a href="../hotels/hotels.php"> Hotels </a>
                </div>
                    
                <div class="sidebar__link ">
                    <i class="fa fa-user-md" aria-hidden="true"></i>
                    <a href="../pharmacies/pharmacies.php"> Pharmacies </a>
                </div> 
                
                <div class="sidebar__link ">
                    <i class="fa fa-cutlery" aria-hidden="true"></i>
                    <a href="../restaurants/restaurants.php"> Restaurants </a>
                </div>

                <div class="sidebar__link active_menu_link">
                    <i class="fa fa-university" aria-hidden="true"></i>
                    <a href="banques.php"> Banques </a>
                </div>
                <div class="sidebar__link">
                    <i class="fa fa-exchange" aria-hidden="true"></i>
                    <a href="../bureaux_change/bureaux_change.php"> Bureaux de change </a>
                </div>

                <div class="sidebar__link">
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                    <a href="../shopping/shopping.php"> Boutiques </a>
                </div>

                <div class="sidebar__link">
                    <i class="fa fa-university" aria-hidden="true"></i>
                    <a href="../public_services/public_services.php"> Services publics </a>
                </div>

                
                <div class="sidebar__link">
                    <i class="fa fa-smile-o" aria-hidden="true"></i>
                    <a href="../entertainment/entertainment.php"> Divertissement </a>
                </div>

                <div class="sidebar__link">
                    <i class="fa fa-futbol-o" aria-hidden="true"></i>
                    <a href="../sports/sports.php"> Sports </a>
                </div>
                
                <div class="sidebar__link">
                    <i class="fa fa-car" aria-hidden="true"></i>
                    <a href="../transportation/transportation.php"> Transportation </a>
                </div>
                
                

                

                <h2> NOUS </h2>
                <div class="sidebar__link ">
                    <i class="fa fa-newspaper-o" aria-hidden="true"></i>
                    <a href="../news/news.php"> Nouveautés </a>
                </div>

                <div class="sidebar__link ">
                    <i class="fa fa-info" aria-hidden="true"></i>
                    <a href="../about/about.php"> A propos de nous </a>
                </div>

                <div class="sidebar__link">
                    <i class="fa fa-user-secret"></i>
                    <a href="../settings/settings.php"> Paramètres </a>
                </div>

                <div class="sidebar__logout">
                    <i class="fa fa-power-off"></i>
                    <a href="../../deconnexion/deconnexion.php" onclick="javascript:return confirm('Vous confirmez votre action ?') ;"> Déconnexion </a>
                </div>
            </div>
        </div>
    </div>
    <script src="banques.js"></script>
</body>
</html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bladi</title>
    <link rel="stylesheet" href="settings.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <div class="container">
        <nav class="navbar">
            
            <div class="table-header" >
                <div class="nav-icon" onclick="toggleSideBar()">
                    <i class="fa fa-bars"></i>
                </div>
                <p> Paramètres </p>
                
            </div>
            
        </nav>
        <main>
            
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
                     <a href="../accueil.html"> Tableau de board</a>
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

                <div class="sidebar__link ">
                    <i class="fa fa-university" aria-hidden="true"></i>
                    <a href="../banques/banques.php"> Banques </a>
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

                <div class="sidebar__link active_menu_link">
                    <i class="fa fa-user-secret"></i>
                    <a href="../settings/settings.php"> Paramètres </a>
                </div>

                <div class="sidebar__logout">
                    <i class="fa fa-power-off"></i>
                    <a href="../../deconnexion/deconnexion.php" onclick="javascript:return confirm('Vous confirmez votre action ?') ;"> déconnexion </a>
                </div>
            </div>
        </div>
    </div>
    <script src="settings.js"></script>
</body>
</html>
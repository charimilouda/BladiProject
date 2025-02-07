import 'package:mysql1/mysql1.dart';

class MySQl{
  static String host="localhost",
  user="root",
  password="",
  db="bladi";
  static int port =3306;
  MySQl();
  Future<MySqlConnection> getConnection()async{
    var settings=new ConnectionSettings(
      host: host,
      port: port,
      user: user,
      password: password,
      db: db,
    );
    return await MySqlConnection.connect(settings);
  }
}
//je pense que je dois creer une list de type map, et la remplir vec les informations de la base de données ; je dois faire une
//boucle sur les lignes de la base de données , et après à l'interieur de la boucle je dois ajouter les elements dans la list de type map

List<Map> Hotels= [
  {
    'nom': "Ibis OUjda",
    'adress' : "OUjda",
    'webSite': "www.youtube.com",
    'rating' : 2,
    'latitude':34.6818490,
    'longitude' : -1.9223191,
    'description' : " Lorem ipsum dolor sit amet. Et accusantium unde sit iusto tempore et fugit sunt cum ipsum numquam est sint numquam qui dolores autem. Ea illum asperiores et incidunt consequatur aut dicta dolores ea libero velit ad voluptatibus maiores et quia numquam. Quo eius consectetur sit nisi nostrum ut distinctio reiciendis in quidem deserunt id nemo facilis ut corporis rerum aut pariatur voluptas. Est incidunt magnam id labore accusamus At voluptas officiis ut repellat modi aut aspernatur possimus.",
    'image1' : "assets/1.jpg",
    'image2' : "assets/2.jpg",
    'image3' : "assets/3.jpg",
  },
  {
    'nom': "Hotel  OUjda",
    'adress' : "Bd yousseb ben tachfin , OUjda",
    'webSite': "www.HotelOujda.com",
    'latitude':34,
    'longitude' : -1.9,
    'rating' : 3,
    'description' : " Sed ipsa odit ut fugiat fugiat qui doloribus sequi et unde ipsam id corrupti tenetur et odit internos. Ad galisum ipsa ex rerum placeat vel reprehenderit autem aut voluptatem quis et provident porro non dolores odio et quas dolorum.  ",
    'image1' : "assets/1.jpg",
    'image2' : "assets/2.jpg",
    'image3' : "assets/3.jpg",
  },
  {
    'nom': "Hotel al  fajr oujda al fajr al fajr",
    'adress' : "OUjda",
    'webSite': "www.alfajr.com",
    'rating' : 5,
    'latitude':34,
    'longitude' : -1.9,
    'description' : " Sed ipsa odit ut fugiat fugiat qui doloribus sequi et unde ipsam id corrupti tenetur et odit internos. Ad galisum ipsa ex rerum placeat vel reprehenderit autem aut voluptatem quis et provident porro non dolores odio et quas dolorum. ",
    'image1' : "assets/1.jpg",
    'image2' : "assets/2.jpg",
    'image3' : "assets/3.jpg",
  },
  {
    'nom': "Ibis OUjda",
    'adress' : "OUjda",
    'webSite': "www.ibis.com",
    'rating' : 2,
    'latitude':34,
    'longitude' : -1.9,
    'description' : " description de l'hotel ",
    'image1' : "assets/1.jpg",
    'image2' : "assets/2.jpg",
    'image3' : "assets/3.jpg",
  },
  {
    'nom': "Hotel  OUjda",
    'adress' : "Boulvard yousseb ben tachfin , OUjda",
    'webSite': "www.HotelOujda.com",
    'rating' : 3,
    'latitude':34,
    'longitude' : -1.9,
    'description' : " description de l'hotel ",
    'image1' : "assets/1.jpg",
    'image2' : "assets/2.jpg",
    'image3' : "assets/3.jpg",
  },
  {
    'nom': "Hotel al fajr oujda al fajr al fajr",
    'adress' : "OUjda",
    'webSite': "www.alfajr.com",
    'rating' : 5,
    'latitude':34,
    'longitude' : -1.9,
    'description' : " description de l'hotel ",
    'image1' : "assets/1.jpg",
    'image2' : "assets/2.jpg",
    'image3' : "assets/3.jpg",
  },

];
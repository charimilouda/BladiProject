import 'package:bladi/home/Pharmacies/Details.dart';
import 'package:bladi/utils/ColorBladi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Pharmacies_screen extends StatefulWidget {
  const Pharmacies_screen({Key? key}) : super(key: key);

  @override
  State<Pharmacies_screen> createState() => _Pharmacies_screenState();
}

class _Pharmacies_screenState extends State<Pharmacies_screen> {
  String urllimages="http://192.168.1.116/1stage/Bladi.com/accueil/pharmacies/images/";
  List list=[];
  Future GetData() async {
    var url ="http://192.168.1.116/1stage/Bladi.com/accueil/pharmacies/getData.php";
    var res = await http.get(Uri.parse(url));
    if(res.statusCode==200){//si reussi
      var red=json.decode(res.body);

      setState(() {
        list.addAll(red);
      });print(list);
    }
  }
  @override
  void initState() {//c'est comme initialisable
    // TODO: implement initState
    super.initState();
    GetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        toolbarHeight: 60,
        title: Text(
          'Pharmacie',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            gradient: LinearGradient(
              colors: [ColorBladi.main3Color, ColorBladi.mainColor],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView.builder(
          padding: EdgeInsets.only(top: 150),
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            final pharmacie = list[index];

            return Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(
                          nom: pharmacie['nom'],
                          adress: pharmacie['adresse'],
                          webSite: pharmacie['website'],
                          rating:int.parse(pharmacie["rating"]),
                          description: pharmacie['description'],
                          image3: urllimages+pharmacie["nomphoto3"],
                          image2: urllimages+pharmacie["nomphoto2"],
                          image1:urllimages+pharmacie["nomphoto1"],
                          lat: double.parse(pharmacie['atitude']),
                          long: double.parse(pharmacie['longe']),
                          tel: pharmacie['tel'],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                    height: 200.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(100, 20, 20, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 120,
                                child: Text(
                                  pharmacie["nom"],
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Details(
                                        nom: pharmacie['nom'],
                                        adress: pharmacie['adresse'],
                                        webSite: pharmacie['website'],
                                        rating: int.parse(pharmacie["rating"]),
                                        description: pharmacie['description'],
                                        image3: urllimages+pharmacie["nomphoto3"],
                                        image2: urllimages+pharmacie["nomphoto2"],
                                        image1:urllimages+pharmacie["nomphoto1"],
                                        lat: double.parse(pharmacie['atitude']),
                                        long: double.parse(pharmacie['longe']),
                                        tel: pharmacie['tel'],
                                      ),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.navigate_next),
                                color: ColorBladi.mainColor,
                              )
                            ],
                          ),
                          Text(
                            pharmacie['adresse'],
                            style: TextStyle(color: Colors.grey),
                          ),
                          _buildRatingStars( int.parse(pharmacie["rating"])),
                          SizedBox(height: 6.0),
                          pharmacie["website"]==""?Text(""):Row(
                            children: [
                              Container(
                                width: 180,
                                padding: EdgeInsets.only(left : 10,right:10),
                                decoration: BoxDecoration(
                                  color: ColorBladi.mainColor.withOpacity(.3),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  pharmacie['website'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 15,
                  bottom: 15,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),

                    child: Image.network(urllimages+pharmacie["nomphoto1"]
                      ,fit: BoxFit.cover,
                      width: 110.0,
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐'; // Utilise le caractère étoile (U+2B50) au lieu de '¤'

    }
    return Text(stars);
  }

}

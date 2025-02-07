
import 'package:bladi/home/Shopping/Details.dart';
import 'package:bladi/utils/ColorBladi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Shopping_screen extends StatefulWidget {
  const Shopping_screen({Key? key}) : super(key: key);

  @override
  State<Shopping_screen> createState() => _Shopping_screenState();
}

class _Shopping_screenState extends State<Shopping_screen> {
  String urllimages="http://192.168.1.116/1stage/Bladi.com/accueil/shopping/images/";
  List list=[];
  Future GetData() async {
    var url ="http://192.168.1.116/1stage/Bladi.com/accueil/shopping/getData.php";
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
          'Boutique',
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
            final shopping = list[index];

            return Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(
                          nom: shopping['nom'],
                          adress: shopping['adresse'],
                          webSite: shopping['website'],
                          rating:int.parse(shopping["rating"]),
                          description: shopping['description'],
                          image3: urllimages+shopping["nomphoto3"],
                          image2: urllimages+shopping["nomphoto2"],
                          image1:urllimages+shopping["nomphoto1"],
                          lat: double.parse(shopping['atitude']),
                          long: double.parse(shopping['longe']),
                          tel: shopping['tel'],
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
                                  shopping["nom"],
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
                                        nom: shopping['nom'],
                                        adress: shopping['adresse'],
                                        webSite: shopping['website'],
                                        rating: int.parse(shopping["rating"]),
                                        description: shopping['description'],
                                        image3: urllimages+shopping["nomphoto3"],
                                        image2: urllimages+shopping["nomphoto2"],
                                        image1:urllimages+shopping["nomphoto1"],
                                        lat: double.parse(shopping['atitude']),
                                        long: double.parse(shopping['longe']),
                                        tel: shopping['tel'],
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
                            shopping['adresse'],
                            style: TextStyle(color: Colors.grey),
                          ),
                          _buildRatingStars( int.parse(shopping["rating"])),
                          SizedBox(height: 6.0),
                          Row(
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
                                  shopping['website'],
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

                    child: Image.network(urllimages+shopping["nomphoto1"]
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

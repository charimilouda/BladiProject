import 'package:bladi/home/Hotels/Details.dart';
import 'package:bladi/utils/ColorBladi.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Hotels_screen extends StatefulWidget {
  const Hotels_screen({Key? key}) : super(key: key);

  @override
  State<Hotels_screen> createState() => _Hotels_screenState();
}

class _Hotels_screenState extends State<Hotels_screen> {
  String urllimages="http://192.168.1.116/1stage/Bladi.com/accueil/hotels/images/";
  List list=[];
  Future GetData() async {
    var url ="http://192.168.1.116/1stage/Bladi.com/accueil/hotels/getData.php";
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
          'Hotel',
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
            final hotel = list[index];

            return Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(
                          nom: hotel['nom'],
                          adress: hotel['adresse'],
                          webSite: hotel['website'],
                          rating:int.parse(hotel["rating"]),
                          description: hotel['description'],
                          image3: urllimages+hotel["nomphoto3"],
                          image2: urllimages+hotel["nomphoto2"],
                          image1:urllimages+hotel["nomphoto1"],
                          lat: double.parse(hotel['atitude']),
                          long: double.parse(hotel['longe']),
                          tel: hotel['tel'],
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
                                  hotel["nom"],
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
                                        nom: hotel['nom'],
                                        adress: hotel['adresse'],
                                        webSite: hotel['website'],
                                        rating: int.parse(hotel["rating"]),
                                        description: hotel['description'],
                                        image3: urllimages+hotel["nomphoto3"],
                                        image2: urllimages+hotel["nomphoto2"],
                                        image1:urllimages+hotel["nomphoto1"],
                                        lat: double.parse(hotel['atitude']),
                                        long: double.parse(hotel['longe']),
                                        tel: hotel['tel'],
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
                            hotel['adresse'],
                            style: TextStyle(color: Colors.grey),
                          ),
                          _buildRatingStars( int.parse(hotel["rating"])),
                          SizedBox(height: 6.0),
                          hotel["website"]==""?Text(""):Row(
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
                                  hotel['website'],
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

                    child: Image.network(urllimages+hotel["nomphoto1"]
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


import 'package:bladi/home/ServicesPublics/Details.dart';
import 'package:bladi/utils/ColorBladi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServicesPublics_screen extends StatefulWidget {
  const ServicesPublics_screen({Key? key}) : super(key: key);

  @override
  State<ServicesPublics_screen> createState() => _ServicesPublics_screenState();
}

class _ServicesPublics_screenState extends State<ServicesPublics_screen> {
  String urllimages="http://192.168.1.116/1stage/Bladi.com/accueil/public_services/images/";
  List list=[];
  Future GetData() async {
    var url ="http://192.168.1.116/1stage/Bladi.com/accueil/public_services/getData.php";
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
          'Service Public',
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
            final Service = list[index];

            return Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(
                          nom: Service['nom'],
                          adress: Service['adresse'],
                          webSite: Service['website'],
                          rating:int.parse(Service["rating"]),
                          description: Service['description'],
                          image3: urllimages+Service["nomphoto3"],
                          image2: urllimages+Service["nomphoto2"],
                          image1:urllimages+Service["nomphoto1"],
                          lat: double.parse(Service['atitude']),
                          long: double.parse(Service['longe']),
                          tel: Service['tel'],
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
                                  Service["nom"],
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
                                        nom: Service['nom'],
                                        adress: Service['adresse'],
                                        webSite: Service['website'],
                                        rating: int.parse(Service["rating"]),
                                        description: Service['description'],
                                        image3: urllimages+Service["nomphoto3"],
                                        image2: urllimages+Service["nomphoto2"],
                                        image1:urllimages+Service["nomphoto1"],
                                        lat: double.parse(Service['atitude']),
                                        long: double.parse(Service['longe']),
                                        tel: Service['tel'],
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
                            Service['adresse'],
                            style: TextStyle(color: Colors.grey),
                          ),
                          _buildRatingStars( int.parse(Service["rating"])),
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
                                  Service['website'],
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

                    child: Image.network(urllimages+Service["nomphoto1"]
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

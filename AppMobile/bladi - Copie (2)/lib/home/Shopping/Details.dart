import 'package:bladi/home/Shopping/adressMap.dart';
import 'package:bladi/home/Shopping/Shopping.dart';
import 'package:bladi/utils/ColorBladi.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatelessWidget {
  const Details({Key? key, required this.nom, required this.adress, required this.webSite,required this.rating, required this.description, required this.image1, required this.image2, required this.image3, required this.lat, required this.long, required this.tel}) : super(key: key);
  final String nom,adress,tel,webSite,description,image1,image2,image3;
  final int rating;
  final  double lat,long;
  Future< void> _launchURL(String url) async
  {
    final Uri uri =Uri(scheme: "https", host: url);
    if(!await launchUrl(
        uri,
        mode: LaunchMode.externalApplication))
      {
        throw " can no launch url";
      };
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
  backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                    Image.network(image1,
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    ),
                  Container(
                    color: Colors.black12,
                    height: 350,
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 24,right: 24),
                          child: IconButton(

                            icon : Icon(Icons.arrow_back,
                            color: Colors.white,),
                            //size:24,
                            onPressed: () {
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Shopping_screen()),
                              );
                  },
                          ),
                        ),

                        Spacer(),

                        Container(
                          padding: EdgeInsets.only(
                              left:24,
                          right: 24),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(nom,
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                ),),



                        SizedBox(
                          height: 12,
                        ),
                              Row(
                                children: [
                                  Icon(Icons.location_on, color: Colors.white70),
                                  SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      adress,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white70,
                                      ),
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),


                              SizedBox(height: 12,),
                        //rating
                        Rating(rating),
                            ], ),),


                        SizedBox(
                          height: 18,
                        ),


                      ],
                    ),
                  )

                ],
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FeaturesTile(
                    icon: Icon(Icons.wifi,color: ColorBladi.main2Color,),
                    label: 'Wifi gratuit',),
                  FeaturesTile(
                    icon: Icon(Icons.local_parking,color: ColorBladi.main2Color,),
                    label: 'Parking gratuit',),
                  FeaturesTile(
                    icon: Icon(Icons.restaurant,color: ColorBladi.main2Color,),
                    label: 'réstaurant',),
                  FeaturesTile(
                    icon: Icon(Icons.room_service,color: ColorBladi.main2Color,),
                    label: 'Service d\'étage',),

                ],
              ),

              SizedBox(height: 16,),Text("Description",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: ColorBladi.main2Color,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 12,),
              Container(
                padding:EdgeInsets.symmetric(horizontal: 24),
                child: Text(


                  textAlign: TextAlign.start,
                  description,
                  style: TextStyle(
                      height: 1.5,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                ),

              ),
              SizedBox(height: 12,),
              Text("Site Web ",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: ColorBladi.main2Color,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 12,),
              Container(
                padding:EdgeInsets.symmetric(horizontal: 24,vertical : 14),
                width: 350,
                decoration: BoxDecoration(
                  color: ColorBladi.mainColor.withOpacity(.3),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: ()  {
                    _launchURL(webSite);
                  },
                  child: Text(
                    textAlign: TextAlign.start,
                    webSite,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),

              ),
              SizedBox(height: 12,),
              Text("Téléphone",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: ColorBladi.main2Color,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 12,),
              Container(
                padding:EdgeInsets.symmetric(horizontal: 24,vertical : 14),
                width: 350,

                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.start,
                  tel,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                ),

              ),
              SizedBox(height: 12,),

              Text("Autres photos",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: ColorBladi.main2Color,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 12,),
              Container(
                height: 240,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  itemCount: 3,//par ce que moi dans le site web j'ai donné à l'admin le droit d'ajouter juste 3 images ; mais je dois faire un filtrage ici avec une ccndition : si y'a pas image 3 je fais la taille est 2...
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                    String images="image"+(index+1).toString();
                  return index==0?ListTileShopping(image: image1,):(index==1?ListTileShopping(image: image2,):ListTileShopping(image: image3,));
                }),
              ),
              SizedBox(height: 12,),
              Text("Adresse",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: ColorBladi.main2Color,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 12,),
              Container(

                padding: EdgeInsets.all(15),
                child : GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>Adress(latitude: lat, longitude: long, nom:nom )));

                    },
                    child: AdressCard(adresse: adress,)),
              ),


            ],
          ),
        ),
      ),
    );
  }



}

class Rating extends StatelessWidget {
   Rating(this.rating) ;
  final int rating;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row
        (
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.star,color: rating>=1?Colors.yellow:Colors.white24,),
          SizedBox(width: 3,),
          Icon(Icons.star,color: rating>=2?Colors.yellow:Colors.white24,),
          SizedBox(width: 3,),
          Icon(Icons.star,color: rating>=3?Colors.yellow:Colors.white24,),
          SizedBox(width: 3,),
          Icon(Icons.star,color: rating>=4?Colors.yellow:Colors.white24,),
          SizedBox(width: 3,),
          Icon(Icons.star,color: rating>=5?Colors.yellow:Colors.white24,),
          SizedBox(width: 3,),
        ],
      ),
    );
  }
}

class FeaturesTile extends StatelessWidget {
  const FeaturesTile({Key? key, required this.icon, required this.label}) : super(key: key);
  final Icon icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
              decoration:BoxDecoration(
          border: Border.all(color: ColorBladi.main2Color),
                borderRadius: BorderRadius.circular(40),

      ),
      child: icon
          ),
          SizedBox(height: 8),
          Container(
            width: 50,
            child: Text(label,
            style: TextStyle(
              color: ColorBladi.main2Color
            ),
            textAlign: TextAlign.center,),

          )
        ],
      ),
    );
  }
}


class ListTileShopping extends StatelessWidget {
  const ListTileShopping({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(image,
              fit: BoxFit.cover,
              height: 220,
              width: 250,

            ),

          ),

        ],
      ),
    );
  }
}
class AdressCard extends StatelessWidget {
  const AdressCard({Key? key, required this.adresse}) : super(key: key);
  final String adresse;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorBladi.mainColor,
      elevation: 0.4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),

      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage("assets/img_5.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage("assets/right-turn.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Adresse",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: ColorBladi.mapColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      adresse,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



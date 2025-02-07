
import 'package:bladi/home/Hotels/CurrentLocationScreen.dart';
import 'package:bladi/home/Hotels/ListOfHotels.dart';
import 'package:bladi/home/map_page.dart';
import 'package:bladi/utils/ColorBladi.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  double xOffset=0;
  double yOffset=0;
  double scaleFactor=1;
  bool isDrawerOpen=false;
  late TabController tabController;

  @override
  void initState() {
    tabController=TabController(vsync: this,length: 3);
    super.initState();
  }
  int selected=0;
  int index=0;
//the function that will filter our list of places
  List <Map> display_list =List.from(Hotels);
  void updateList(String value){
    
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(

      transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor)..rotateY(isDrawerOpen?-0.5:0),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color:Colors.grey[200],
        borderRadius:BorderRadius.circular(
            isDrawerOpen? 40:0),
      ),

      child: Column(

        children: [
          SizedBox(height:50),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isDrawerOpen?IconButton(
                  icon:Icon(Icons.arrow_back_ios,color: ColorBladi.mainColor,),
                  onPressed: () {
                    setState((){
                      xOffset=0;
                      yOffset=0;
                      scaleFactor=1;
                      isDrawerOpen=false;
                    });
                  },)
                    : IconButton (icon:Icon(Icons.menu,color: ColorBladi.mainColor,), onPressed: () {
                  setState((){
                    xOffset=250;
                    yOffset=120;
                    scaleFactor=0.7;
                    isDrawerOpen=true;
                  });
                },
                ),
                Column(
                  children: [
                  Text('Emplacement',
                  style: TextStyle(fontFamily: "Poppins",color: ColorBladi.main2Color),
                  ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.location_on,color: ColorBladi.mainColor,),
                        Text('Oujda',
                        style: TextStyle(
                          color: ColorBladi.main2Color
                        ),
                        ),

                      ],
                    ),

                  ],
                ),
                IconButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CurrentLocationScreen()),
                  );
                    //redirection a la map
                }, icon: Icon(Icons.map_outlined,color: ColorBladi.mainColor),
                  )

              ],
            ),

          ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top:30,bottom:20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Découvrons tout \n le Maroc.",
                  style:TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Icon(Icons.near_me_sharp,color: ColorBladi.main2Color,),
                  )
                ],
              ),
            ),

          /*Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            margin: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.search),
                Text('Chercher un endroit'),
                Icon(Icons.settings,),

              ],
            ),
          ),*/
          Padding(
            padding :EdgeInsets.all(16),
          child :
          TextField(
            style: TextStyle(color: ColorBladi.mainColor),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none
              ),
              hintText: "Chercher un endroit",
              prefixIcon: Icon(Icons.search),
              prefixIconColor: ColorBladi.mainColor,

            ),
          ),),

          TabBar(
              controller: tabController,
              indicatorColor: Colors.transparent,
              labelColor: ColorBladi.main2Color,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              onTap: (value){
                setState(() {

                  selected=value;
                });
              },
              tabs: <Container>[

            Container(
              padding: EdgeInsets.only(left:15,right:15),
              decoration: BoxDecoration(
                color: selected ==0? ColorBladi.mainColor:null,
                borderRadius: BorderRadius.circular(25)
              ),
              child: Tab(
                text: "Populaire",),
            ),
                Container(
                  padding: EdgeInsets.only(left:15,right:15),
                  decoration: BoxDecoration(
                      color:selected ==1? ColorBladi.mainColor:null,
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Tab(
                    text: "A proximité",),
                ),
                Container(
                  padding: EdgeInsets.only(left:15,right:15),
                  decoration: BoxDecoration(
                      color: selected ==2? ColorBladi.mainColor:null,
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Tab(
                    text: "Recommandé",),
                ),
                /*Container(
                  padding: EdgeInsets.only(left:15,right:15),
                  decoration: BoxDecoration(
                      color:selected ==3? ColorBladi.mainColor:null,
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Tab(
                    text: "Populaire",),
                ),*/

          ]
          ),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.only(top: 20,left: 20),
            height: 300,
            width: double.infinity,
            child: TabBarView(
                controller: tabController,
                children: [
                  _tabbarItem("assets/img_4.png","assets/img_1.png","ATLAS TERMINUS & SPA","Hotel Ibis"),
                  _tabbarItem("assets/img_2.png","assets/img_3.png","AL Fajr Hotel","Hotel Aswan",),
                  _tabbarItem("assets/img_1.png","assets/img_2.png","Hotel Ibis","AL Fajr Hotel",),
                  //_tabbarItem("assets/1.jpg","assets/2.jpg"),
                ]),
          ),
         /* Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,

                itemBuilder: (context,index){
              return Container(
                child: Column(
                  children: [
                    Container(
                      padding:EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Image.asset('assets/background.png'),
                      height: 80,
                      width: 80,
                    ),
                    Text('yes'),
                  ],
                ),
              );
          },
          ) )*/
        ],
      ),

    );

  }
  _tabbarItem(String images,String images2,String nom,String  nom2){
    return Container(
      height: 300,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 300,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(images),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding:EdgeInsets.all(20),
                  margin: EdgeInsets.only(bottom: 15,right: 15,left: 15),
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(nom,
                      style: TextStyle(
                        fontSize: 20
                      ),),

                    ],
                  ),
                ),
              ],
            ),
          ),





          Container(

            margin: EdgeInsets.only(left: 20),
            width: 300,
            height: 250,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(images2),
                    fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding:EdgeInsets.all(20),
                  margin: EdgeInsets.only(bottom: 15,right: 15,left: 15),
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(nom2,
                        style: TextStyle(
                            fontSize: 20
                        ),),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

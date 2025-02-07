
import 'package:bladi/home/Home.dart';
import 'package:bladi/home/menu.dart';
import 'package:bladi/utils/ColorBladi.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  int _selectedIndex = -1;


  @override
  Widget build(BuildContext context) {
    return
      Container(
      //color: ColorBladi.main2Color,//background color for the drawer
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgimage.png'), // Remplacez par le chemin de votre image
            fit: BoxFit.cover,
          ),
        ),
      padding: EdgeInsets.only(top:50,bottom: 7,left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children :[
          //your location
          Card(),/*smawha carditem*/
          //menu
        Column(

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                color: ColorBladi.main3Color,
                height: 1,
              ),
            ),
            ...DrawerItems.map(
                  (e) =>SideMenu(title:e['title'], Icone: e['icon'], isActive: false,press: e['press'],),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                color: ColorBladi.main3Color,
                height: 1,
              ),
            ),
          ],
        ),
          //settings
          Card2(isActive: false,),
        ]
      ),
    );
  }
}





class Card extends StatelessWidget {
  const Card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(

      leading: Icon(Icons.location_on,color: ColorBladi.mainColor,),
      title: Text("Votre emplacement",
        style: TextStyle(color: Colors.white),),
      subtitle:  Text("Oujda",
        style: TextStyle(color: Colors.white),),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));

      },
    );
  }
}






class SideMenu extends StatelessWidget {
  const SideMenu({Key? key,required this.title,required this.isActive, this.Icone, this.press}) : super(key: key);

  final title,Icone,press;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return
      ListTile(
        onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>press));
      },
        leading:
        SizedBox(
          height: 34,
          width: 34,
          child: Icon(Icone,color: ColorBladi.mainColor,size: 30,

          ),
        ),
        title: Text(title,
          style: TextStyle(color: Colors.white),),
      );
  }
}






class Card2 extends StatelessWidget {
  const Card2({Key? key,  required this.isActive}) : super(key: key);
  final bool isActive;

  @override

  Widget build(BuildContext context) {
    return Stack(
      children:[
        isActive?Positioned(
          height: 56,
          width: 370,
          child: Container(
          decoration: BoxDecoration(
              color: ColorBladi.mainColor,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
        ),
        ):SizedBox(),

        ListTile(

        leading: Icon(Icons.settings,color: ColorBladi.mainColor,size: 25,),


        title: Text("Paramètres",
          style: TextStyle(color: Colors.white),),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));

        },

      ),]
    );
  }
}
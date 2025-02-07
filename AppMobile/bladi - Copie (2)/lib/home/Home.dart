import 'package:bladi/home/DrawerScreen.dart';
import 'package:bladi/home/HomeScreen.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Stack(
        children:[
          DrawerScreen(),
          HomeScreen(),
        ]
      )

    );
  }
}

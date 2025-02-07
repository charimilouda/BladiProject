import 'package:bladi/SplashScreen.dart';
import 'package:bladi/home/Banques/Banques.dart';
import 'package:bladi/home/BureauxChange/BureauxChange.dart';
import 'package:bladi/home/Divertissement/Divertissement.dart';
import 'package:bladi/home/Home.dart';
import 'package:bladi/home/Hotels/hotels.dart';
import 'package:bladi/home/Pharmacies/Pharmacies.dart';
import 'package:bladi/home/Restaurants/Restaurants.dart';
import 'package:bladi/home/ServicesPublics/ServicesPublics.dart';
import 'package:bladi/home/Shopping/Shopping.dart';
import 'package:bladi/home/Sport/Sport.dart';
import 'package:bladi/home/Transportation/Transportation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
List <Map> DrawerItems=[
  {
    'icon' :FontAwesomeIcons.home,
    'title':'Accueil',
    'press':Home(),
  },
  {
    'icon' :FontAwesomeIcons.hotel,
    'title':'Hotels',
    'press':Hotels_screen(),
  },
  {
    'icon' :FontAwesomeIcons.userDoctor,
    'title':'Pharmacies',
    'press':Pharmacies_screen(),
  },
  {
    'icon' :FontAwesomeIcons.bowlFood,
    'title':'Restaurants',
    'press':Restaurants_screen()
  },
  {
    'icon' :FontAwesomeIcons.bank,
    'title':'Banques',
    'press':Banques_screen(),
  },
  {
    'icon' :FontAwesomeIcons.car,
    'title':'Transportation',
    'press':Transportation_screen(),
  },
  {
    'icon' :FontAwesomeIcons.exchange,
    'title':'Bureaux de change',
    'press':BureauxChange_screen(),
  },
  {
    'icon' :FontAwesomeIcons.bagShopping,
    'title':'Boutiques',
    'press':Shopping_screen()
  },
  /*{
    'icon' :FontAwesomeIcons.servicestack,
    'title':'Services Publics',
    'press':ServicesPublics_screen(),
  },*/
  {
    'icon' :FontAwesomeIcons.faceSmile,
    'title':'Divertissement',
    'press':Divertissement_screen(),
  },
  {
    'icon' :FontAwesomeIcons.football,
    'title':'Sport',
    'press':Sport_screen(),
  },


];
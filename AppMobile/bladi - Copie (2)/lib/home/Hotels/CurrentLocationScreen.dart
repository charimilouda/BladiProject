

import 'package:bladi/utils/ColorBladi.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({Key? key}) : super(key: key);

  @override
  State<CurrentLocationScreen> createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  late GoogleMapController googleMapController;
  static const  CameraPosition initialCameraPosition=CameraPosition(target: LatLng(34.6648348, -1.8906272),zoom: 14);
  Set<Marker> markers ={};
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.white
          ),
          backgroundColor: ColorBladi.mainColor,
          toolbarHeight: 60,
          title: Text("Emplacement",
            style: TextStyle(
                color: Colors.white
            ),),
          centerTitle: true,

        ),
          body : GoogleMap(
            initialCameraPosition: initialCameraPosition,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            markers: markers,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller){
              googleMapController =controller;
            }
            ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            Position position = await _determinatePosition();
            googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position.latitude,position.longitude),zoom: 14)));
          markers.clear();
          markers.add( Marker(markerId: const MarkerId("Emplacement actuel "),
              position: LatLng(position.latitude,position.longitude)));
            setState(() {

            });
            },
          label:const  Text(" Emplacement actuel",style: TextStyle(
            color: Colors.white
          ),),
          icon: Icon(Icons.location_history,color: Colors.white,),
          backgroundColor: ColorBladi.mainColor,

        ),
      ),
    );

  }
    Future<Position>_determinatePosition()async{
        bool serviceEnabled;
        LocationPermission permission;
        serviceEnabled =await Geolocator.isLocationServiceEnabled();
        if(!serviceEnabled){
          return Future.error("Location services are disabled");
        }
        permission=await Geolocator.checkPermission();
        if(permission==LocationPermission.denied){
          permission = await Geolocator.requestPermission();
          if(permission==LocationPermission){
            return Future.error("Location permission denied");
          }
        }
        if(permission==LocationPermission.deniedForever){
           return Future.error("Location permissions are permanetly denied ");
        }
        //if every thig is ok
        Position position =await Geolocator.getCurrentPosition();
        return position;
    }
}


import 'package:bladi/utils/ColorBladi.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Adress extends StatefulWidget {
  late double latitude, longitude;
  late String nom;

  Adress({Key? key, required this.latitude, required this.longitude,required this.nom})
      : super(key: key);

  @override
  State<Adress> createState() =>
      _AdressState(latitude: latitude, longitude: longitude, nom: nom);
}

class _AdressState extends State<Adress> {
  late double latitude, longitude;
  late String nom;
  late GoogleMapController googleMapController;
  late CameraPosition initialCameraPosition;
  Set<Marker> markers = {};

  _AdressState({required this.latitude, required this.longitude,required this.nom});

  @override
  void initState() {
    super.initState();
    initialCameraPosition = CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 14,
    );

    // Add marker
    final marker = Marker(
      markerId: MarkerId('selected_location'),
      position: LatLng(latitude, longitude),
    );
    setState(() {
      markers.add(marker);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: ColorBladi.mainColor,
          toolbarHeight: 60,
          title: Text(
            nom
            ,
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          markers: markers,
          zoomControlsEnabled: false,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            googleMapController = controller;
          },
        ),
      ),
    );
  }
}

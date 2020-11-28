import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget{
  final _markers = {
    Marker(
      markerId: MarkerId('id'),
      position: LatLng(47.92145455759996, 106.91452048400859),
      infoWindow: InfoWindow(
        title: 'ТТАХНЭ',
      ),
    ),
  };

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(47.92145455759996, 106.91452048400859),
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          colors: [
            Theme.of(context).primaryColor,
            Colors.white,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 220,
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 5),
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
          ),
          Container(
            width: double.infinity,
            height: 200,
            child: Image.network(
                "https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg", fit: BoxFit.cover,),
          ),
          SizedBox(height: 10),
          Expanded(
            child: GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: _markers.toSet(),
            ),
          ),
        ],
      ),
    );
  }
}

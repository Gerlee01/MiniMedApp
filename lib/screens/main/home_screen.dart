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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {},
        ),
        Image.network(
            "https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg"),
        Container(
          width: double.infinity,
          height: 500,
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
    );
  }
}

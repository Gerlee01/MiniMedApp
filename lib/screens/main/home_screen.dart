import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mini_med_front/widgets/carousel_slider_widget.dart';

class HomeScreen extends StatelessWidget {
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
            height: 100,
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 5),
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
          ),
          CarouselSliderWidget(),
          SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: _markers.toSet(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

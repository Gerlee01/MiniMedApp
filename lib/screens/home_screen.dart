import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {},
        ),
        Column(
          children: <Widget>[
            Image.network(
                "https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg"),
            Image.network(
                "https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg"),
          ],
        ),
      ],
    );
  }
}

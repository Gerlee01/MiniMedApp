
import 'package:flutter/material.dart';
import 'package:mini_med_front/util/PdfViewer.dart';
class HistoryDetail extends StatelessWidget {
  static const routeName = 'history_detail';

  @override
  Widget build(BuildContext context) {
    //final url = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Дэлгэрэнгүй'),
      ),
      body: Container(
        color: Colors.white,
        child: PdfViewer(),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_med_front/entity/Prescription.dart';

class PillDetail extends StatelessWidget {
  static const routeName = 'pill_detail';

  @override
  Widget build(BuildContext context) {
    final pill = ModalRoute.of(context).settings.arguments as Prescription;

    return Scaffold(
      appBar: AppBar(
        title: Text(pill.pillName),
      ),
      body: Column(
        children: <Widget>[
          _chooseText(pill.type),
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Text(
                'Жор бичсэн: ${pill.doctorWorkPlace} - ${pill.doctorFullName}',
              ),
            ),
          ),
          Container(

            width: double.infinity,
            child: Text(
              'Жор:\n ${pill.guide}',
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _chooseText(Type type) {
    String title = '';
    Color color = Colors.white;

    switch (type) {
      case Type.normal:
        title = 'Энгийн эм';
        color =Colors.green;
        break;
      case Type.setgets:
        title = 'Сэтгэцэд нөлөөт эм';
        color =Colors.blueAccent;
        break;
      case Type.mansuuruulah:
        title = 'Мансууруулах эм';
        color =Colors.red;
        break;
      default:
        title = 'Тодорхойгүй';
        color =Colors.black12;
        break;
    }

    return Container(
      width: double.infinity,
      color: color,
      padding: EdgeInsets.all(10),
      child: Text(
        'Төрөл: $title',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

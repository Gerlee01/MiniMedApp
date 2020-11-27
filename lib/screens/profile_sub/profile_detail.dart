import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_med_front/entity/Patient.dart';

class ProfileDetail extends StatelessWidget {
  static const routeName = '/profile_detail';

  @override
  Widget build(BuildContext context) {
    var  _patient = ModalRoute.of(context).settings.arguments as Patient;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Хувийн мэдээлэл'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                child: Icon(Icons.account_circle),
                radius: 30,
              ),
            ),
          ),
          _buildRow('Овог: ', _patient.lastName),
          _buildRow('Нэр: ', _patient.firstName),
          _buildRow('Регистрын №: ', _patient.regNum),
          _buildRow('Утас: ', _patient.phone.toString()),
          _buildRow('Имэйл: ', _patient.mail),
          _buildRow('Аймаг/Хот: ', _patient.city),
          _buildRow('Сум/Дүүрэг: ', _patient.district),
          _buildRow('Баг/Хороо: ', _patient.khoroo),
        ],
      ),
    );
  }

  Widget _buildRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: 120,
          alignment: Alignment.centerRight,
          child: Text(title),
        ),
        Expanded(
          child: Text(value),
        ),
      ],
    );
  }
}

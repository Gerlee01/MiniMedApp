import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_med_front/entity/Patient.dart';

class ProfileDetail extends StatelessWidget {
  final _patient = Patient(
    id: BigInt.one,
    firstName: 'gerlee',
    lastName: 'batzorig',
    regNum: 'ЕЮ00222501',
    cardNo: 'cardno',
    mail: 'gerleebatzorig25@gmail.com',
    phone: '9703634',
    created: DateTime.now(),
  );

  static const routeName = '/profile_detail';

  @override
  Widget build(BuildContext context) {
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

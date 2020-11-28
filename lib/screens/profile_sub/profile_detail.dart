import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_med_front/entity/Patient.dart';

class ProfileDetail extends StatelessWidget {
  static const routeName = '/profile_detail';

  @override
  Widget build(BuildContext context) {
    var _patient = ModalRoute.of(context).settings.arguments as Patient;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Хувийн мэдээлэл'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColorLight,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              alignment: Alignment.center,
              height: 150,
              child: CircleAvatar(
                child: Icon(
                  Icons.account_circle,
                  size: 70,
                ),
                radius: 41,
              ),
            ),
            SizedBox(height: 20),
            _buildRow('Овог: ', _patient.lastName, context),
            SizedBox(height: 10),
            _buildRow('Нэр: ', _patient.firstName, context),
            SizedBox(height: 10),
            _buildRow('Регистрын №: ', _patient.regNum, context),
            SizedBox(height: 10),
            _buildRow('Утас: ', _patient.phone.toString(), context),
            SizedBox(height: 10),
            _buildRow('Имэйл: ', _patient.mail, context),
            SizedBox(height: 10),
            _buildRow('Аймаг/Хот: ', _patient.city, context),
            SizedBox(height: 10),
            _buildRow('Сум/Дүүрэг: ', _patient.district, context),
            SizedBox(height: 10),
            _buildRow('Баг/Хороо: ', _patient.khoroo, context),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String title, String value, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: 120,
          alignment: Alignment.centerRight,
          child: Text(title),
        ),
        SizedBox(width: 10,),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.black12,
                width: 1,
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Text(value, style: Theme.of(context).textTheme.bodyText2,),
          ),
        ),
      ],
    );
  }
}

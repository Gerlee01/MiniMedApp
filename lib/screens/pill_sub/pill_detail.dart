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
      body: Container(
        color: _chooseColor(pill.type).withOpacity(0.1),
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: _chooseColor(pill.type),
                    width: 1,
                  ),
                  color: _chooseColor(pill.type),
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Text(
                  'Төрөл: ${_chooseText(pill.type)} \n Жор бичсэн: ${pill.doctorWorkPlace} - ${pill.doctorFullName}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              SizedBox(height: 10),
              _buildText('Тайлбар', pill.note, context),
              SizedBox(height: 10),
              _buildText('Хэрэглэх тун', pill.usedtun , context),
              SizedBox(height: 10),
              _buildText('Тун хэтэрсэн үед илрэх шинж, авах арга хэмжээ', pill.usedtunMax , context),
              SizedBox(height: 10),
              _buildText('Хэрэглэх заалт', pill.zaalt , context),
              SizedBox(height: 10),
              _buildText('Хэрэглэх арга', pill.arga , context),
              SizedBox(height: 10),
              _buildText('Жирэмсэн ба хөхүүл үеийн хэрэглээ', pill.pregnantZaalt , context),
              SizedBox(height: 10),
              _buildText('Гаж нөлөө', pill.nuloo , context),
              SizedBox(height: 10),
              _buildText('Цээрлэлт', pill.tseerlelt , context),
              SizedBox(height: 10),
              _buildText('Үйлчлэл', pill.uilchlel , context),
              SizedBox(height: 10),
              _buildText('Нэмэлт мэдлэг', pill.nemelt , context),
              SizedBox(height: 10),
              _buildText('Олгох нөхцөл', pill.olgoh , context),
              SizedBox(height: 10),
              _buildText('Хадгалах нөхцөл', pill.hadgalah , context),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText(String title, String value, BuildContext context){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black12,
          width: 1,
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Text(title +':\n\n' + value, style: Theme.of(context).textTheme.bodyText2,),
    );
  }

  Color _chooseColor(Type type) {
    switch (type) {
      case Type.normal:
        return Colors.green;
      case Type.setgets:
        return Colors.blueAccent;
      case Type.mansuuruulah:
        return Colors.red;
      default:
        return Colors.black12;
    }
  }

  String _chooseText(Type type) {
    switch (type) {
      case Type.normal:
        return 'Энгийн эм';
      case Type.setgets:
        return 'Сэтгэцэд нөлөөт эм';
      case Type.mansuuruulah:
        return 'Мансууруулах эм';
      default:
        return 'Тодорхойгүй';
    }
  }
}

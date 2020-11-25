import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../entity/Prescription.dart';
import '../pill_sub/pill_detail.dart';

class PillScreen extends StatelessWidget {
  final List<Prescription> pills = [
    Prescription(
      id: BigInt.one,
      patientID: BigInt.one,
      hospitalID: BigInt.one,
      pillName: 'em',
      guide: 'haha',
      doctorFullName: 'doctor name',
      doctorWorkPlace: 'emch',
      doctorRegNum: 'yu12354678',
      type: Type.normal,
      created: DateTime.now(),
    ),
    Prescription(
      id: BigInt.two,
      patientID: BigInt.two,
      hospitalID: BigInt.two,
      pillName: 'em22',
      guide: 'haha',
      doctorFullName: 'doctor name',
      doctorWorkPlace: 'emch',
      doctorRegNum: 'yu12354678',
      type: Type.setgets,
      created: DateTime.now(),
    ),
    Prescription(
      id: BigInt.from(6),
      patientID: BigInt.from(6),
      hospitalID: BigInt.from(6),
      pillName: 'em3',
      guide: 'haha',
      doctorFullName: 'doctor name',
      doctorWorkPlace: 'emch',
      doctorRegNum: 'yu12354678',
      type: Type.mansuuruulah,
      created: DateTime.now(),
    ),
  ];

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            margin: EdgeInsets.only(
              top: 50,
              right: 10,
              left: 10,
              bottom: 10,
            ),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'эмийн нэрээр хайх'),
                    controller: _searchController,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: pills.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: _chooseLeadingColor(pills[index].type),
                  ),
                  title: Text(pills[index].pillName),
                  subtitle: Text(DateFormat('yyyy оны MM сарын dd')
                      .format(pills[index].created)),
                  trailing: IconButton(
                    icon: Icon(Icons.keyboard_arrow_right),
                    onPressed: () {
                      Navigator.of(context).pushNamed(PillDetail.routeName);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Color _chooseLeadingColor(Type type) {
    switch (type) {
      case Type.normal:
        return Colors.green;
      case Type.setgets:
        return Colors.blueAccent;
      case Type.mansuuruulah:
        return Colors.red;
      default:
        return Colors.white54;
    }
  }
}

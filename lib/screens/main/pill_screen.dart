import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mini_med_front/controller/PillController.dart';

import '../../entity/Prescription.dart';
import '../pill_sub/pill_detail.dart';

class PillScreen extends StatefulWidget {
  @override
  _PillScreenState createState() => _PillScreenState();
}

class _PillScreenState extends State<PillScreen> {
  final _searchController = TextEditingController();
  List<Prescription> _mainPills = [];
  List<Prescription> _pills = [];

  @override
  void initState() {
    PillController controller = PillController();
    controller.findAll().then((pills) {
      if (pills != null) {
        _mainPills = pills;
        setState(() {
          _pills = _mainPills;
        });
      }
    });
    super.initState();
  }

  void search(){
    if(_mainPills.isEmpty) return;
    setState(() {
      if(_searchController.text.isEmpty){
        _pills = _mainPills;
      } else {
        _pills = _mainPills.where((element) => element.pillName.toLowerCase().contains(_searchController.text.toLowerCase())).toList();
      }
    });
  }

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
                  onPressed: search,
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
              itemCount: _pills.length,
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: _chooseLeadingColor(_pills[index].type),
                      title: Text(_pills[index].pillName),
                      subtitle: Text(DateFormat('yyyy оны MM сарын dd')
                          .format(_pills[index].created)),
                      trailing: IconButton(
                        icon: Icon(Icons.keyboard_arrow_right),
                        onPressed: () {
                          Navigator.of(context).pushNamed(PillDetail.routeName,
                              arguments: _pills[index]);
                        },
                      ),
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  CircleAvatar _chooseLeadingColor(Type type) {
    switch (type) {
      case Type.normal:
        return CircleAvatar(
          radius: 20,
          backgroundColor: Colors.green,
          child: Icon(
            Icons.accessibility_sharp,
            color: Colors.white,
          ),
        );
      case Type.setgets:
        return CircleAvatar(
          radius: 20,
          backgroundColor: Colors.blueAccent,
          child: Icon(
            Icons.airline_seat_recline_extra,
            color: Colors.white,
          ),
        );
      case Type.mansuuruulah:
        return CircleAvatar(
          radius: 20,
          backgroundColor: Colors.red,
          child: Icon(
            Icons.airline_seat_individual_suite_rounded,
            color: Colors.white,
          ),
        );
      default:
        return CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white54,
        );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mini_med_front/providers/pill_provider.dart';
import 'package:provider/provider.dart';

import '../../entity/Prescription.dart';
import '../pill_sub/pill_detail.dart';

class PillScreen extends StatelessWidget {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final pills = Provider.of<PillProvider>(context, listen: false).pills;

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
                      Navigator.of(context).pushNamed(PillDetail.routeName, arguments: pills[index]);
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

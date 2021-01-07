import 'dart:core';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mini_med_front/models/filterModel.dart';
import 'package:mini_med_front/screens/history_sub/history_filter_screen.dart';

import '../../controller/HistoryController.dart';
import '../../entity/History.dart';
import '../history_sub/history_detail.dart';

class NewHistoryScreen extends StatefulWidget {
  static const routeName = '/new_history_tab_screen';

  @override
  _NewHistoryScreenState createState() => _NewHistoryScreenState();
}

class _NewHistoryScreenState extends State<NewHistoryScreen> {
  HistoryController controller = HistoryController();
  List<History> _histories = [];

  FilterModel filterModel = new FilterModel(
    startDate: DateTime(DateTime.now().year, DateTime.now().month, 1).toIso8601String(),
    endTDate: DateTime.now().toIso8601String(),
    statuses: ['active', 'inactive'],
    types: ['ambulatory', 'analysis', 'pacs'],
  );

  void _setFilter(FilterModel filter) {
    filterModel = filter;
    controller.findAll(filterModel).then((histories) {
      if (histories != null) {
        setState(() {
          _histories = histories;
        });
      }
    });
  }

  @override
  void initState() {
    controller.findAll(filterModel).then((histories) {
      if (histories != null) {
        setState(() {
          _histories = histories;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Түүх'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.filter_alt_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HistoryFilterScreen(_setFilter, filterModel)),
                );
              })
        ],
      ),
      body: Container(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView.builder(
            itemCount: _histories.length,
            itemBuilder: (ctx, index) => Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: _histories[index].status == Status.active
                        ? Colors.green
                        : Colors.deepOrange,
                    child: FittedBox(
                      child: Text(
                        '${_histories[index].targetTime == null || _histories[index].type == Type.analysis ?
                        _histories[index].targetNumber :
                        '${_histories[index].targetTime.hour}:${_histories[index].targetTime.minute}'}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  title: Text(
                      '${DateFormat('yyyy-MM-dd ').format(_histories[index].targetDate)}'),
                  subtitle: Text(_histories[index].getTypeName()),
                  trailing: IconButton(
                    icon: Icon(Icons.keyboard_arrow_right),
                    onPressed: () {
                      Navigator.of(context).pushNamed(HistoryDetail.routeName,
                          arguments: _histories[index].id);
                    },
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

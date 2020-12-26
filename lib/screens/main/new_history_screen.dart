import 'dart:core';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  List<History> _mainHistories = [];
  List<History> _histories = [];

  Map<String, Object> filters = {
    'startDate': DateTime(DateTime.now().year, DateTime.now().month, 1),
    'endDate': DateTime.now(),
    'isAnalysis': true,
    'isAmbulatory': true,
    'isPacs': true,
    'isCome': true,
    'isNotCome': true,
  };

  void _setFilter(Map<String, Object> filter) {
    setState(() {
      filters = filter;
      _histories = _mainHistories
          .where((el) =>
              el.targetDate.isBefore(filters['endDate']) &&
              el.targetDate.isAfter(filters['startDate']) &&
              (el.type == Type.ambulatory
                  ? filters['isAmbulatory']
                  : el.type == Type.analysis
                      ? filters['isAnalysis']
                      : el.type == Type.pacs ? filters['isPacs'] : false) &&
              (el.status == Status.active
                  ? filters['isCome']
                  : el.status == Status.inactive
                      ? filters['isNotCome']
                      : false))
          .toList();
    });
  }

  @override
  void initState() {
    HistoryController controller = HistoryController();
    controller.findAll().then((histories) {
      if (histories != null) {
        _mainHistories = histories;
        setState(() {
          _histories = _mainHistories;
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
                          HistoryFilterScreen(_setFilter, filters)),
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

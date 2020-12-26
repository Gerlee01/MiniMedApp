import 'dart:core';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryFilterScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, Object> currentFilters;

  const HistoryFilterScreen(this.saveFilters, this.currentFilters);

  @override
  _HistoryFilterScreenState createState() => _HistoryFilterScreenState();
}

class _HistoryFilterScreenState extends State<HistoryFilterScreen> {
  DateTime _startDate = DateTime(DateTime.now().year, DateTime.now().month, 1);
  DateTime _endDate = DateTime.now();
  bool _isAnalysis = true;
  bool _isAmbulatory = true;
  bool _isPacs = true;
  bool _isCome = true;
  bool _isNotCome = true;

  @override
  void initState() {
    _startDate = widget.currentFilters['startDate'];
    _endDate = widget.currentFilters['endDate'];
    _isAnalysis = widget.currentFilters['isAnalysis'];
    _isAmbulatory = widget.currentFilters['isAmbulatory'];
    _isPacs = widget.currentFilters['isPacs'];
    _isCome = widget.currentFilters['isCome'];
    _isNotCome = widget.currentFilters['isNotCome'];
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  Widget _buildDatePiker(int i, String title) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(title),
          ),
          Expanded(
            child: Text(
              i == 0
                  ? '${DateFormat.yMd().format(_startDate)}'
                  : '${DateFormat.yMd().format(_endDate)}',
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_drop_down_circle_outlined),
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2019),
                lastDate: DateTime.now(),
              ).then((pickedDate) {
                if (pickedDate == null) {
                  return;
                }
                setState(() {
                  i == 0 ? _startDate = pickedDate : _endDate = pickedDate;
                });
              });
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Хайлт'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'startDate': _startDate,
                'endDate': _endDate,
                'isAnalysis': _isAnalysis,
                'isAmbulatory': _isAmbulatory,
                'isPacs': _isPacs,
                'isCome': _isCome,
                'isNotCome': _isNotCome,
              };
              widget.saveFilters(selectedFilters);
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            _buildDatePiker(0, 'Эхлэх огноо:'),
            _buildDatePiker(1, 'Дуусах огноо:'),
            Divider(),
            _buildSwitchListTile(
              'Амбулатор',
              'Амбулаторын үзлэгүүдийг харах',
              _isAmbulatory,
              (newValue) {
                setState(() {
                  _isAmbulatory = newValue;
                });
              },
            ),
            _buildSwitchListTile(
              'Шинжилгээ',
              'Шинжилгээнүүдийг харах',
              _isAnalysis,
              (newValue) {
                setState(() {
                  _isAnalysis = newValue;
                });
              },
            ),
            _buildSwitchListTile(
              'Оношилгоо',
              'Оношилгоонуудыг харах',
              _isPacs,
              (newValue) {
                setState(() {
                  _isPacs = newValue;
                });
              },
            ),
            Divider(),
            _buildSwitchListTile(
              'Ирсэн',
              'Цагтаа ирж үзүүлсэн',
              _isCome,
              (newValue) {
                setState(() {
                  _isCome = newValue;
                });
              },
            ),
            _buildSwitchListTile(
              'Ирээгүй',
              'Цагтаа ирж үзүүлээгүй',
              _isNotCome,
              (newValue) {
                setState(() {
                  _isNotCome = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

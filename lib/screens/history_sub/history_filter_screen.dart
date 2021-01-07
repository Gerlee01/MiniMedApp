import 'dart:core';

import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:intl/intl.dart';
import 'package:mini_med_front/entity/History.dart';

import '../../models/filterModel.dart';

class HistoryFilterScreen extends StatefulWidget {
  final Function saveFilters;
  final FilterModel currentModel;

  const HistoryFilterScreen(this.saveFilters, this.currentModel);

  @override
  _HistoryFilterScreenState createState() => _HistoryFilterScreenState();
}

class _HistoryFilterScreenState extends State<HistoryFilterScreen> {
  FilterModel model = new FilterModel();
  List<String> typeString = [];
  List<String> statusString = [];

  @override
  void initState() {
    model = widget.currentModel;
    typeString = model.getTypeString();
    statusString = model.getStatusString();
    super.initState();
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
                  ? '${DateFormat.yMd().format(model.startDate)}'
                  : '${DateFormat.yMd().format(model.endTDate)}',
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
                  i == 0 ? model.startDate = pickedDate : model.endTDate = pickedDate;
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
              model.setTypeString(typeString);
              model.setStatusString(statusString);
              widget.saveFilters(model);
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
            CheckboxGroup(
              orientation: GroupedButtonsOrientation.VERTICAL,
              margin: const EdgeInsets.only(left: 12.0),
              onSelected: (List selected) => setState(() {
                typeString = selected;
              }),
              labels: <String>[
                'Амбулатор',
                'Шинжилгээ',
                'Оношилгоо',
              ],
              checked: typeString,
              itemBuilder: (Checkbox cb, Text txt, int i) {
                return Row(
                  children: <Widget>[
                    cb,
                    txt,
                  ],
                );
              },
            ),
            Divider(),
            CheckboxGroup(
              orientation: GroupedButtonsOrientation.HORIZONTAL,
              margin: const EdgeInsets.only(left: 12.0),
              onSelected: (List selected) => setState(() {
                statusString = selected;
              }),
              labels: <String>[
                'Ирсэн',
                'Ирээгүй',
              ],
              checked: statusString,
              itemBuilder: (Checkbox cb, Text txt, int i) {
                return Row(
                  children: <Widget>[
                    cb,
                    txt,
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

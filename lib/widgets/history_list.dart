import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mini_med_front/entity/History.dart';
import 'package:mini_med_front/providers/history_provider.dart';
import 'package:mini_med_front/screens/history_sub/history_detail.dart';
import 'package:provider/provider.dart';

class HistoryList extends StatelessWidget {
  final Type type;

  HistoryList(this.type);

  @override
  Widget build(BuildContext context) {
    final histories = Provider.of<HistoryProvider>(context, listen: false)
        .findAllByType(type);

    return Container(
      child: ListView.builder(
        itemCount: histories.length,
        itemBuilder: (ctx, index) => Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: histories[index].status == Status.active
                  ? Colors.green
                  : Colors.deepOrange,
              child: FittedBox(
                child: Text(
                  '${histories[index].targetTime == null
                      ? histories[index].targetNumber
                      : '${histories[index].targetTime.hour}:${histories[index].targetTime.minute}'}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            title: Text(
                '${DateFormat('yyyy-MM-dd ').format(histories[index].targetDate)}'),
            trailing: IconButton(
              icon: Icon(Icons.keyboard_arrow_right),
              onPressed: (){
                Navigator.of(context).pushNamed(HistoryDetail.routeName, arguments: histories[index].pdf);
              },
            ),
          ),
        ),
      ),
    );
  }
}

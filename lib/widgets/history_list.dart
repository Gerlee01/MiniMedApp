import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mini_med_front/controller/HistoryController.dart';
import 'package:mini_med_front/entity/History.dart';
import 'package:mini_med_front/screens/history_sub/history_detail.dart';

class HistoryList extends StatefulWidget{
  final Type type;

  HistoryList(this.type);

  @override
  HistoryListState createState() => HistoryListState();

}

class HistoryListState extends State<HistoryList> {
  List<History> _histories = [];
  @override
  void initState() {
    HistoryController controller = HistoryController();
    controller.findAll(widget.type).then((histories) {
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
    return Container(
      child: ListView.builder(
        itemCount: _histories.length,
        itemBuilder: (ctx, index) => Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: _histories[index].status == Status.active
                  ? Colors.green
                  : Colors.deepOrange,
              child: FittedBox(
                child: Text(
                  '${_histories[index].targetTime == null ? _histories[index].targetNumber : '${_histories[index].targetTime.hour}:${_histories[index].targetTime.minute}'}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            title: Text(
                '${DateFormat('yyyy-MM-dd ').format(_histories[index].targetDate)}'),
            trailing: IconButton(
              icon: Icon(Icons.keyboard_arrow_right),
              onPressed: () {
                Navigator.of(context).pushNamed(HistoryDetail.routeName, arguments: _histories[index].pdf);
              },
            ),
          ),
        ),
      ),
    );
  }
}

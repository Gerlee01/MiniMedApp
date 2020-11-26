import 'package:flutter/material.dart';
import 'package:mini_med_front/entity/History.dart';
import 'package:mini_med_front/providers/history_provider.dart';
import 'package:mini_med_front/widgets/history_list.dart';
import 'package:mini_med_front/widgets/histroy_chart.dart';
import 'package:provider/provider.dart';

class HistoryTabScreen extends StatefulWidget {
  static const routeName = '/history_tab_screen';

  @override
  _HistoryTabScreenState createState() => _HistoryTabScreenState();
}

class _HistoryTabScreenState extends State<HistoryTabScreen> {
  List<Map<String, Object>> _pages; //солигдох дэлгэцүүд
  int _selectPageIndex = 0;
  Type type;

  @override
  void didChangeDependencies() {
    type = ModalRoute.of(context).settings.arguments as Type;
    _pages = [
      {
        'page': HistoryList(type),
        'title': 'Жагсаалт',
      },
      {
        'page': HistoryChart(),
        'title': 'График',
      },
    ];
    super.didChangeDependencies();
  }

  Widget _buildButton(int i){
    return Container(
      width: 160,
      child: RaisedButton(
        child: Text(i == 0 ? 'Жагсаалт' : 'График'),
        color: _selectPageIndex ==  i ? Theme.of(context).primaryColor : Colors.white,
        onPressed: () {
          if(_selectPageIndex ==  i) return;
          else {
            setState(() {
              _selectPageIndex = i;
            });
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(type.toString()),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButton(0),
              _buildButton(1),
            ],
          ),
          ChangeNotifierProvider(
            create: (ctx) => HistoryProvider(),
            child: Expanded(
              child: _pages[_selectPageIndex]['page'],
            ),
          ),
        ],
      ),
    );
  }
}

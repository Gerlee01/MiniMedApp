import 'package:flutter/material.dart';
import 'package:mini_med_front/widgets/history_list.dart';
import 'package:mini_med_front/widgets/histroy_chart.dart';

class HistoryTabScreen extends StatefulWidget {
  static const routeName = '/history_tab_screen';

  @override
  _HistoryTabScreenState createState() => _HistoryTabScreenState();
}

class _HistoryTabScreenState extends State<HistoryTabScreen> {
  List<Map<String, Object>> _pages; //нүүр хуудсан дээр солигдох дэлгэцүүд
  int _selectPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': HistoryList(),
        'title': 'Жагсаалт',
      },
      {
        'page': HistoryChart(),
        'title': 'График',
      },
    ];
    super.initState();
  }

  Widget _buildButton(int i){
    return RaisedButton(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                _buildButton(0),
                _buildButton(1),
              ],
            ),
          ),
          Expanded(
            child: _pages[_selectPageIndex]['page'],
          ),
        ],
      ),
    );
  }
}
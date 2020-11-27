import 'package:flutter/material.dart';
import 'package:mini_med_front/controller/PaymentController.dart';
import 'package:mini_med_front/entity/Payment.dart';
import 'package:mini_med_front/widgets/payment_chart.dart';
import 'package:mini_med_front/widgets/payment_list.dart';

class PaymentTabsScreen extends StatefulWidget {
  static const routeName = '/payment_tabs_screen';

  @override
  _PaymentTabsScreenState createState() => _PaymentTabsScreenState();
}

class _PaymentTabsScreenState extends State<PaymentTabsScreen> {
  List<Map<String, Object>> _pages = [
    {
      'page': PaymentList(),
      'title': 'Жагсаалт',
    },
    {
      'page': PaymentChart(),
      'title': 'График',
    },
  ];

  int _selectPageIndex = 0;

  Widget _buildButton(int i) {
    return Container(
      width: 160,
      child: RaisedButton(
        child: Text(i == 0 ? 'Жагсаалт' : 'График'),
        color: _selectPageIndex == i
            ? Theme.of(context).primaryColor
            : Colors.white,
        onPressed: () {
          if (_selectPageIndex == i)
            return;
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
        title: const Text('Төлбөрийн мэдээлэл'),
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
          Expanded(
            child: _pages[_selectPageIndex]['page'],
          ),
        ],
      ),
    );
  }
}

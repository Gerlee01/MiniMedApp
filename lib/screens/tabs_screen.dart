import 'package:flutter/material.dart';

import './history_screen.dart';
import './home_screen.dart';
import './pill_screen.dart';
import './profile_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs_screen';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages; //нүүр хуудсан дээр солигдох дэлгэцүүд
  int _selectPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': HomeScreen(),
        'title': 'Нүүр хуудас',
      },
      {
        'page': PillScreen(),
        'title': 'Эмийн жор',
      },
      {
        'page': HistoryScreen(),
        'title': 'Түүх',
      },
      {
        'page': ProfileScreen(),
        'title': 'Профайл',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Нүүр"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services_outlined),
            title: Text("Эмийн жор"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text("Түүх"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            title: Text("Профайл"),
          ),
        ],
      ),
    );
  }
}

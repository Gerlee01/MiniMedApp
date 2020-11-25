import 'package:flutter/material.dart';
import 'package:mini_med_front/screens/history_sub/history_detail.dart';
import 'package:mini_med_front/screens/history_sub/history_tab_screen.dart';
import 'screens/pill_sub/pill_detail.dart';
import './screens/tabs_screen.dart';
import './screens/login_screen.dart';

///love me too
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      home: LoginScreen(),
      theme: ThemeData(
        primarySwatch: Colors.pink,
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(fontSize: 20),
              ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        TabsScreen.routeName: (ctx) => TabsScreen(),
        PillDetail.routeName: (ctx) => PillDetail(),
        HistoryTabScreen.routeName: (ctx) => HistoryTabScreen(),
        HistoryDetail.routeName: (ctx) => HistoryDetail(),
      },
    );
  }
}

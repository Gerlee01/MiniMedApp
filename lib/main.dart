import 'package:flutter/material.dart';

import 'screens/history_sub/history_detail.dart';
import 'screens/history_sub/history_tab_screen.dart';
import 'screens/login_screen.dart';
import 'screens/pill_sub/pill_detail.dart';
import 'screens/profile_sub/payment_tabs_screen.dart';
import 'screens/profile_sub/profile_detail.dart';
import 'screens/tabs_screen.dart';

///love me too
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Мini Med',
      home: LoginScreen(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.amber,
        canvasColor: Colors.white,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              bodyText2: TextStyle(
                fontSize: 15,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
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
        ProfileDetail.routeName: (ctx) => ProfileDetail(),
        PaymentTabsScreen.routeName: (ctx) => PaymentTabsScreen(),
      },
    );
  }
}

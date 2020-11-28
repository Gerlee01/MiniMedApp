import 'package:flutter/material.dart';
import 'package:mini_med_front/screens/history_sub/history_tab_screen.dart';

import '../entity/History.dart';

class HistoryGridItem extends StatelessWidget {
  final Type type;
  final String title;

  const HistoryGridItem(this.type, this.title);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(HistoryTabScreen.routeName, arguments: type);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColorDark.withOpacity(0.7),
              Theme.of(context).primaryColorLight,
            ],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

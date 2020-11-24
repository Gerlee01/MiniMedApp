import 'package:flutter/material.dart';

import '../entity/History.dart';

class HistoryItem extends StatelessWidget {
  final Type type;
  final String title;

  const HistoryItem(this.type, this.title);

  void selectCategory(BuildContext ctx) {
    // Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName, arguments: {
    //   'id': id,
    //   'title': title,
    // });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
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

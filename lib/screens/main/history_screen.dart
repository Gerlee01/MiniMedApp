import 'package:flutter/material.dart';

import '../../entity/History.dart';
import '../../widgets/history_grid_item.dart';

class HistoryScreen extends StatelessWidget {
  final List<Map<String, Object>> types = [
    {
      'type': Type.ambulatory,
      'title': 'Эмчийн үзлэг',
    },
    {
      'type': Type.analysis,
      'title': 'Шинжилгээ',
    },
    {
      'type': Type.pacs,
      'title': 'Оношилгоо',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        alignment: Alignment.center,
        child: GridView(
          padding: EdgeInsets.all(30),
          children: types.map((e) => HistoryGridItem(e['type'], e['title'])).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
      ),
    );
  }
}

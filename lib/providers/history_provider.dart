import 'package:flutter/foundation.dart';
import 'package:mini_med_front/entity/History.dart';

import '../test_data.dart';

class HistoryProvider with ChangeNotifier {
  List<History> _histories = historyData.cast<History>().toList();

  List<History> get histories {
    return [..._histories];
  }

  List<History> findAllByType(Type type) {
    return [..._histories.where((st) => st.type == type).toList()];
  }

  void addHistory(History history) {
    _histories.add(history);
    notifyListeners();
  }
}

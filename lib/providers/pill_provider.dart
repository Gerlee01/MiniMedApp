import 'package:flutter/foundation.dart';
import 'package:mini_med_front/entity/Prescription.dart';
import 'package:mini_med_front/test_data.dart';

class PillProvider with ChangeNotifier{
  List<Prescription> _pills = pillData.cast<Prescription>().toList();

  List<Prescription> get pills {
    return [..._pills];
  }

  List<Prescription> findAllByType(Type type) {
    return [..._pills.where((st) => st.type == type).toList()];
  }

  void addPill(Prescription pill) {
    _pills.add(pill);
    notifyListeners();
  }
}
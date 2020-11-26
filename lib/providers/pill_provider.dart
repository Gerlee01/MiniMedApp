import 'package:flutter/foundation.dart';
import 'package:mini_med_front/entity/Prescription.dart';

class PillProvider with ChangeNotifier{
  List<Prescription> _pills = [];

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
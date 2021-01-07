import '../entity/History.dart';

class FilterModel {
  DateTime startDate;
  DateTime endTDate;
  List<String> types;
  List<String> statuses;

  FilterModel({this.startDate, this.endTDate, this.statuses, this.types});

  List<String> getTypeString() {
    List<String> list = [];
    types.forEach((f) {
      if (f == 'ambulatory')
        list.add('Амбулатор');
      else if (f == 'analysis')
        list.add('Шинжилгээ');
      else if (f == 'pacs') list.add('Оношилгоо');
    });
    return list;
  }

  void setTypeString(List<String> list) {
    types = [];
    list.forEach((f) {
      if (f == 'Амбулатор')
        types.add('ambulatory');
      else if (f == 'Шинжилгээ')
        types.add('analysis');
      else if (f == 'Оношилгоо')
        types.add('pacs');
    });
  }

  List<String> getStatusString() {
    List<String> list = [];
    statuses.forEach((f) {
      if (f == 'active')
        list.add('Ирсэн');
      else if (f == 'inactive')
        list.add('Ирээгүй');
    });
    return list;
  }

  void setStatusString(List<String> list) {
    statuses = [];
    list.forEach((f) {
      if (f == 'Ирсэн')
        statuses.add('active');
      else if (f == 'Ирээгүй')
        statuses.add('inactive');
    });
  }

  Map<String, dynamic> toJson() => {
    'startdate': startDate.toIso8601String(),
    'enddate': endTDate.toIso8601String(),
    'types': types,
    'statuses': statuses,
  };
}

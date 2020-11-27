class ChartHistoryModel {
  final double irsen;
  final double ireegvi;

  ChartHistoryModel({
    this.irsen = 0,
    this.ireegvi = 0,
  });

  factory ChartHistoryModel.fromJson(Map<String, dynamic> json) {
    return ChartHistoryModel(
      ireegvi : json['ireegvi'] as double,
      irsen : json['irsen'] as double,
    );
  }
}

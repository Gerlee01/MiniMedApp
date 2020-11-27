import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mini_med_front/controller/PaymentController.dart';
import 'package:mini_med_front/models/chartPaymentModel.dart';

import 'indicator.dart';

class PaymentChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaymentChartState();
}

class _PaymentChartState extends State<PaymentChart> {
  int touchedIndex;
  int touchedIndexFirst;
  ChartPaymentModel _model = null;

  @override
  void initState() {
    PaymentController controller = PaymentController();
    controller.findChartValues().then((model) {
      if (model != null) {
        setState(() {
          _model = model;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        color: Colors.white,
        child: _model == null
            ? Text('Мэдээлэл олдсонгүй')
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 1,
                        child: PieChart(
                          PieChartData(
                              pieTouchData: PieTouchData(
                                  touchCallback: (pieTouchResponse) {
                                setState(() {
                                  if (pieTouchResponse.touchInput
                                          is FlLongPressEnd ||
                                      pieTouchResponse.touchInput is FlPanEnd) {
                                    touchedIndexFirst = -1;
                                  } else {
                                    touchedIndexFirst =
                                        pieTouchResponse.touchedSectionIndex;
                                  }
                                });
                              }),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              sectionsSpace: 0,
                              centerSpaceRadius: 40,
                              sections: _showingSectionsFirst()),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _buildSection(Colors.blue, 'Иргэн төлсөн'),
                          const SizedBox(height: 4),
                          _buildSection(Colors.amber, 'Хөнгөлөлт'),
                          const SizedBox(height: 18),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      AspectRatio(
                        aspectRatio: 1,
                        child: PieChart(
                          PieChartData(
                              pieTouchData: PieTouchData(
                                  touchCallback: (pieTouchResponse) {
                                setState(() {
                                  if (pieTouchResponse.touchInput
                                          is FlLongPressEnd ||
                                      pieTouchResponse.touchInput is FlPanEnd) {
                                    touchedIndex = -1;
                                  } else {
                                    touchedIndex =
                                        pieTouchResponse.touchedSectionIndex;
                                  }
                                });
                              }),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              sectionsSpace: 0,
                              centerSpaceRadius: 40,
                              sections: _showingSections()),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _buildSection(Colors.deepPurple, 'Багцын хөнгөлөлт'),
                          const SizedBox(height: 4),
                          _buildSection(Colors.amber, 'Эрхийн хөнгөлөлт'),
                          const SizedBox(height: 4),
                          _buildSection(
                              Colors.pink, 'Яаралтай цагийн төрлийн хөнгөлөлт'),
                          const SizedBox(height: 4),
                          _buildSection(Colors.yellow, 'Тасгийн хөнгөлөлт'),
                          const SizedBox(height: 4),
                          _buildSection(
                              Colors.lightBlue, 'A B C Z оношийн хөнгөлөлт'),
                          const SizedBox(height: 4),
                          _buildSection(Colors.brown, 'Даатгалын хөнгөлөлт'),
                          const SizedBox(height: 4),
                          _buildSection(
                              Colors.green, 'Давтан үзлэгийн хөнгөлөлт'),
                          const SizedBox(height: 4),
                          _buildSection(Colors.red, 'Гэр бүлийн хөнгөлөлт'),
                          const SizedBox(height: 4),
                          _buildSection(Colors.grey,
                              'Хувьчилсан буюу гараараа хөнгөлсөн'),
                          const SizedBox(height: 18),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildSection(Color color, String title) {
    return Indicator(
      color: color,
      text: title,
      isSquare: true,
    );
  }

  List<PieChartSectionData> _showingSectionsFirst() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndexFirst;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 120 : 100;
      switch (i) {
        case 0:
          return _buildPie(Colors.blue, _model.price, radius, fontSize);
        case 1:
          return _buildPie(
              Colors.amber, _model.mainPriceDis, radius, fontSize);
        default:
          return null;
      }
    });
  }

  List<PieChartSectionData> _showingSections() {
    return List.generate(9, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 120 : 100;
      switch (i) {
        case 0:
          return _buildPie(
              Colors.deepPurple, _model.discountPack, radius, fontSize);
        case 1:
          return _buildPie(Colors.amber, _model.discountVip, radius , fontSize);
        case 2:
          return _buildPie(Colors.pink, _model.discountEmergency, radius , fontSize);
        case 3:
          return _buildPie(
              Colors.yellow, _model.discountOutPatient, radius , fontSize);
        case 4:
          return _buildPie(
              Colors.lightBlue, _model.discountDiagnosis, radius , fontSize);
        case 5:
          return _buildPie(
              Colors.brown, _model.discountInsurance, radius , fontSize);
        case 6:
          return _buildPie(Colors.green, _model.discountRepeat, radius , fontSize);
        case 7:
          return _buildPie(Colors.red, _model.discountFamily, radius , fontSize);
        case 8:
          return _buildPie(Colors.grey, _model.discountPercent, radius , fontSize);
        default:
          return null;
      }
    });
  }

  PieChartSectionData _buildPie(
      Color color, double value, double radius, double fontSize) {
    return PieChartSectionData(
      color: color,
      value: value,
      title: '${value.ceil()}%',
      radius: radius,
      titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff)),
    );
  }
}

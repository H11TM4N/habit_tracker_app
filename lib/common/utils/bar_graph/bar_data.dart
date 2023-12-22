import 'package:habit_tracker_app/common/utils/bar_graph/bar.dart';

class BarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.friAmount,
    required this.satAmount,
  });

  List<Bar> barData = [];

  void initBarData() {
    Bar(x: 0, y: sunAmount);
    Bar(x: 0, y: monAmount);
    Bar(x: 0, y: tueAmount);
    Bar(x: 0, y: wedAmount);
    Bar(x: 0, y: thurAmount);
    Bar(x: 0, y: friAmount);
    Bar(x: 0, y: satAmount);
  }
}

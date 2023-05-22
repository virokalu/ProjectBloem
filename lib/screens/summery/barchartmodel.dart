import 'package:charts_flutter/flutter.dart' as charts;

class BarChartModel{

  String day;
  int sum;
  final charts.Color color;

  BarChartModel({required this.day,required this.sum,required this.color});
  
}
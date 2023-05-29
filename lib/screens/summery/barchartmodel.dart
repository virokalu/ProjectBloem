import 'package:charts_flutter/flutter.dart' as charts;

class BarChartModel{

  String category;
  int itemprice;
  final charts.Color color;

  BarChartModel({required this.category,required this.itemprice,required this.color});
  
}
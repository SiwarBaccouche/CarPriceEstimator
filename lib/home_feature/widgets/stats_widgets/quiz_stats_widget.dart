import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class QuizStats extends StatefulWidget {
  const QuizStats({Key? key}) : super(key: key);

  @override
  State<QuizStats> createState() => _QuizStatsState();
}

class _QuizStatsState extends State<QuizStats> {
  @override
  Widget build(BuildContext context) {

    final List<_PieData> pieData = [
      _PieData('Simple', 64.5, 'Simple'),
      _PieData('Detailed', 35.5, 'Detailed'),
    ];

    return Center(
      child: SfCircularChart(

        legend: Legend(isVisible: true),
        series: <PieSeries<_PieData, String>>[
          PieSeries<_PieData, String>(
            explode: true,
            explodeIndex: 0,
            dataSource: pieData, // Use the defined pieData list
            xValueMapper: (_PieData data, _) => data.xData,
            yValueMapper: (_PieData data, _) => data.yData,
            dataLabelMapper: (_PieData data, _) => data.text,
            dataLabelSettings: DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }
}

class _PieData {
  _PieData(this.xData, this.yData, this.text);
  final String xData;
  final num yData;
  final String text;
}

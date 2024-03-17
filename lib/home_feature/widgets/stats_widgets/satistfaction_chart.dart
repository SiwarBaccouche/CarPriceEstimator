import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SatisfactionChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    return Center(
      child: Container(height: size.height*0.3,
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(
            majorGridLines: MajorGridLines(width: 0),
            minorGridLines: MinorGridLines(width: 0),
          ),
          primaryYAxis: NumericAxis(
            minimum: 0,
            maximum: 100,
            interval: 10,
            majorGridLines: MajorGridLines(width: 0),
            minorGridLines: MinorGridLines(width: 0),
          ),
          tooltipBehavior: TooltipBehavior(enable: true),
          isTransposed: true,
          series: <ChartSeries<_ChartData, String>>[
            BarSeries<_ChartData, String>(
              dataSource: _chartData,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y,
              pointColorMapper: (_ChartData data, _) => data.color,
              name: 'Satistfaction rate',
            ),
          ],
        ),
      ),
    );
  }
}

class _ChartData {
  final String x;
  final double y;
  final Color color;

  _ChartData(this.x, this.y, this.color);
}

final List<_ChartData> _chartData = [
  _ChartData('Very satisfied', 10, Color(0xFFA683FA)),
  _ChartData('Somewhat satisfied', 30, Color(0xFFFA878A)),
  _ChartData('neutral', 40, Color(0xFF8CDC8C)),
  _ChartData('Somewhat dissatisfied', 25, Color(0xFFEAA685)),
  _ChartData('Very dissatisfied', 25, Color(0xFFFA8E5F)),

];

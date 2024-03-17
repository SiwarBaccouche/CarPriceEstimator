 import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PriceChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final Size size = mediaQuery.size;
    return Container(
      color: Colors.black12,
      height: size.height*0.3,
      width: size.width*0.8,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
          minorGridLines: MinorGridLines(width: 0),
        ),
        primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 70,
          interval: 5,
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
            name: 'Price',
          ),
        ],
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
  _ChartData('min', 50, Colors.green.withOpacity(0.7),),
  _ChartData('median', 57, Colors.orange.withOpacity(0.7)),
  _ChartData('max', 65, Colors.red.withOpacity(0.7)),
];

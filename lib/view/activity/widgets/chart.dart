import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final List<ChartData> chartData = <ChartData>[
      ChartData('Jan', 21, 12),
      ChartData('Feb', 24, 42),
      ChartData('Mar', 35, 53),
      ChartData('Apr', 38, 83),
      ChartData('May', 54, 45),
      ChartData('Jun', 21, 12),
      ChartData('Jul', 24, 42),
      ChartData('Aug', 35, 53),
      ChartData('Sep', 38, 83),
      ChartData('Oct', 54, 45),
      ChartData('Nov', 38, 83),
      ChartData('Dec', 54, 45)
    ];
    return SfCartesianChart(
      borderWidth: 0,
      plotAreaBorderWidth: 0,
      borderColor: colorScheme.background,
      primaryXAxis: CategoryAxis(),
      series: <ChartSeries>[
        SplineSeries<ChartData, String>(
          color: colorScheme.error,
          width: 3,
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          enableTooltip: true,
        ),
        SplineSeries<ChartData, String>(
          color: colorScheme.secondary,
          width: 3,
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y2,
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.y2);
  final String x;
  final double? y;
  final double? y2;
}

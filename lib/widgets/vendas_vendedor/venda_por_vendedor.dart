import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class VendaPorVendedor extends StatefulWidget {
  const VendaPorVendedor({super.key});

  @override
  State<VendaPorVendedor> createState() => _VendaPorVendedorState();
}

class _VendaPorVendedorState extends State<VendaPorVendedor> {
  final List<ChartData> chartData = [
    ChartData(
      'Marcela',
      10,
    ),
    ChartData(
      'João',
      20,
    ),
    ChartData(
      'Carlos',
      30,
    ),
    ChartData(
      'Bia',
      20,
    ),
    ChartData(
      'Pedro',
      15,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _buildDataLabelTemplateChart();
  }

  SfCartesianChart _buildDataLabelTemplateChart() {
    return SfCartesianChart(
      title: ChartTitle(text: ''),
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
      ),
      primaryYAxis: NumericAxis(maximum: 100, labelFormat: 'R\${value} Mil'),
      series: _getMarkeSeries(),
    );
  }

  List<ColumnSeries<ChartData, String>> _getMarkeSeries() {
    return <ColumnSeries<ChartData, String>>[
      ColumnSeries<ChartData, String>(
        animationDuration: 2500,
        dataSource: chartData,
        xValueMapper: (ChartData sales, _) => sales.x,
        yValueMapper: (ChartData sales, _) => sales.y,
        gradient: const LinearGradient(colors: <Color>[
          Color.fromRGBO(93, 80, 202, 1),
          Color.fromRGBO(183, 45, 145, 1),
          Color.fromRGBO(250, 203, 118, 1)
        ], stops: <double>[
          0.0,
          0.5,
          1.0
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        dataLabelSettings: DataLabelSettings(
            isVisible: true,
            builder: (dynamic data, dynamic point, dynamic series,
                int pointIndex, int seriesIndex) {
              return Container(
                  transform: Matrix4.translationValues(0, 8, 0),
                  height: 50,
                  width: 50,
                  child: Column(children: <Widget>[
                    SizedBox(
                      height: 35,
                      child: Image.asset(
                        _getImageTemplate(pointIndex),
                        height: 45,
                        width: 30,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                      child: Text(
                        "R\$ ${data.y} Mil",
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    )
                  ]));
            }),
      ),
    ];
  }

  String _getImageTemplate(int pointIndex) {
    final String path = pointIndex == 0
        ? 'assets/img/p1.png'
        : (pointIndex == 1
            ? 'assets/img/p2.png'
            : (pointIndex == 2
                ? 'assets/img/p3.png'
                : (pointIndex == 3
                    ? 'assets/img/p4.png'
                    : 'assets/img/p5.png')));
    return path;
  }
}

class ChartData {
  final String x;
  final int y;

  ChartData(
    this.x,
    this.y,
  );
}

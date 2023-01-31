import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class VendasGeral extends StatefulWidget {
  const VendasGeral({Key? key}) : super(key: key);

  @override
  VendasGeralState createState() => VendasGeralState();
}

class VendasGeralState extends State<VendasGeral> {
  List<_VendasMes> data = [
    _VendasMes('Jan', 35),
    _VendasMes('Fev', 28),
    _VendasMes('Mar', 34),
    _VendasMes('Abr', 32),
    _VendasMes('Mai', 50),
    _VendasMes('Jun', 47),
    _VendasMes('Jul', 80),
    _VendasMes('Ago', 20),
    _VendasMes('Set', 37),
    _VendasMes('Out', 24),
    _VendasMes('Nov', 16),
    _VendasMes('Dez', 80),
  ];

  List<_VendasAno> sparkChartData = [
    _VendasAno("R\$ 300 M", 2018),
    _VendasAno("R\$ 200 M", 2019),
    _VendasAno("R\$ 250 M", 2020),
    _VendasAno("R\$ 230 M", 2021),
    _VendasAno("R\$ 1 Bi", 2022),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black87,
      child: Column(children: [
        SfCartesianChart(
          title: ChartTitle(text: "Vendas Gerais", textStyle: const TextStyle(color: Colors.white)),
          backgroundColor: Colors.transparent,
          primaryXAxis: CategoryAxis(
            labelStyle: const TextStyle(color: Colors.white),
          ),
          primaryYAxis: NumericAxis(
            labelStyle: const TextStyle(color: Colors.white),
            labelFormat: 'R\$ {value} M',
          ),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<_VendasMes, String>>[
            LineSeries<_VendasMes, String>(
              color: Colors.deepPurple,
              dataSource: data,
              xValueMapper: (_VendasMes vendas, _) => vendas.meses,
              yValueMapper: (_VendasMes vendas, _) => vendas.vendas,
              name: 'Vendas',
              dataLabelSettings:
                  const DataLabelSettings(isVisible: true, color: Colors.white),
              markerSettings: const MarkerSettings(isVisible: true),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SfSparkLineChart.custom(
              labelStyle: const TextStyle(color: Colors.white),
              color: Colors.deepPurple,
              trackball: const SparkChartTrackball(
                  color: Colors.deepPurple,
                  activationMode: SparkChartActivationMode.tap),
              marker: const SparkChartMarker(
                  size: 10, displayMode: SparkChartMarkerDisplayMode.all),
              labelDisplayMode: SparkChartLabelDisplayMode.all,
              xValueMapper: (int index) => sparkChartData [index].vendas_ano,
              yValueMapper: (int index) => sparkChartData [index].ano,
              dataCount: 5,
            ),
          ),
        )
      ]),
    ));
  }
}

class _VendasMes {
  _VendasMes(this.meses, this.vendas);
  final String meses;
  final double vendas;
}

class _VendasAno {
  _VendasAno(this.vendas_ano, this.ano);
  final String vendas_ano;
  final int ano;
}

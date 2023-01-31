import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Meta_vendas extends StatefulWidget {
  const Meta_vendas({
    Key? key,
  }) : super(key: key);

  @override
  _Meta_vendasState createState() => _Meta_vendasState();
}

class _Meta_vendasState extends State<Meta_vendas> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      color: Colors.black87,
      child: SfCircularChart(
        title: ChartTitle(
          text: 'Metas de vendas Anuais',
          textStyle: const TextStyle(color: Colors.white),
        ),
        legend: Legend(
            isVisible: true,
            overflowMode: LegendItemOverflowMode.wrap,
            textStyle: const TextStyle(
              color: Colors.white,
            )),
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
          RadialBarSeries<GDPData, String>(
            radius: '90%',
            innerRadius: '40%',
            gap: '2%',
            dataSource: _chartData,
            xValueMapper: (GDPData data, _) => data.vendedor,
            yValueMapper: (GDPData data, _) => data.gdp,
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
            ),
            enableTooltip: true,
            maximumValue: 100,
          ),
        ],
      ),
    )));
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData(
        'Carlos 10%',
        10,
      ),
      GDPData(
        'Pedro 50%',
        50,
      ),
      GDPData(
        'João 30%',
        30,
      ),
      GDPData(
        'Caio 80%',
        80,
      ),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(
    this.vendedor,
    this.gdp,
  );
  final String vendedor;
  final int gdp;
}

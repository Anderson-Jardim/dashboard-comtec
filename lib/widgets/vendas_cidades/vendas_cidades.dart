import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Vendas_cidades extends StatefulWidget {
  const Vendas_cidades({super.key});

  @override
  State<Vendas_cidades> createState() => _Vendas_cidadesState();
}

class _Vendas_cidadesState extends State<Vendas_cidades> {
  late List<ExpenseData> chartData;
  late TooltipBehavior tooltipBehavior;
  @override
  void initState() {
    chartData = getChartData();
    tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(
            labelFormat: 'R\$ {value} Mil',
          ),
          title: ChartTitle(text: "Vendas Por Cidade"),
          legend: Legend(isVisible: true),
          tooltipBehavior: tooltipBehavior,
          series: <ChartSeries>[
            AreaSeries<ExpenseData, String>(
              dataSource: chartData,
              xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
              yValueMapper: (ExpenseData exp, _) => exp.father,
              name: "Castanhal",
              markerSettings: const MarkerSettings(isVisible: true),
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                color:Colors.deepPurple
              )

            ),
            AreaSeries<ExpenseData, String>(
              dataSource: chartData,
              xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
              yValueMapper: (ExpenseData exp, _) => exp.mother,
              name: "Belém",
              markerSettings: const MarkerSettings(isVisible: true),
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                color:Colors.deepPurple
              ),
            ),
            AreaSeries<ExpenseData, String>(
              dataSource: chartData,
              xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
              yValueMapper: (ExpenseData exp, _) => exp.son,
              name: "Ananindeua",
              markerSettings: const MarkerSettings(isVisible: true),
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                color:Colors.deepPurple
              ),
            ),
            AreaSeries<ExpenseData, String>(
              dataSource: chartData,
              xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
              yValueMapper: (ExpenseData exp, _) => exp.daughter,
              name: "Inhangapi",
              markerSettings: const MarkerSettings(isVisible: true),
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                color:Colors.deepPurple
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<ExpenseData> getChartData() { 
    final List<ExpenseData> chartData = [
      ExpenseData('Jan', 350, 300, 290, 250),
      ExpenseData('Fev', 330, 280, 300, 296),
      ExpenseData('Mar', 280, 250, 230, 260),
      ExpenseData('Abr', 297, 287, 310, 298),
      ExpenseData('Mai', 150, 180, 200, 220),
      ExpenseData('Jun', 200, 240, 145, 198),
      ExpenseData('Jul', 100, 160, 149, 190),
      ExpenseData('Ago', 110, 138, 210, 134 ),
      ExpenseData('Set', 200, 230, 240, 210),
      ExpenseData('Out', 150, 110, 115, 100),
      ExpenseData('Nov', 180, 150, 183, 111),
      ExpenseData('Dez', 143, 187, 132, 123),
    ];
    return chartData;
  }
}

class ExpenseData {
  ExpenseData(
      this.expenseCategory, this.father, this.mother, this.son, this.daughter);
  final String expenseCategory;
  final num father;
  final num mother;
  final num son;
  final num daughter;
}

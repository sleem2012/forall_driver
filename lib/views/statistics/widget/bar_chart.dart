import 'package:flutter/material.dart';
import 'package:forall_driver/data/models/commission/commission_model.dart';
import 'package:forall_driver/shared/theme/text_theme.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';



class BarChartApp extends StatelessWidget {
  const BarChartApp({Key? key, required this.dataList, required this.title, this.onPointTap, this.currency = 'USD', this.onChangePer}) : super(key: key);
  final List<MyBarChartData> dataList;
  final String title;
  final Function(ChartPointDetails)? onPointTap;
  final void Function(int?)? onChangePer;
  final String currency;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: KTextStyle.of(context).title),
        SizedBox(
          height: (dataList.length * 22) + 50,
          child: SfCartesianChart(
            series: <ChartSeries>[
              BarSeries<MyBarChartData, dynamic>(
                animationDuration: 1000,
                dataSource: dataList,
                borderRadius: const BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
                xValueMapper: (MyBarChartData gdp, _) => gdp.slug,
                yValueMapper: (MyBarChartData gdp, _) => gdp.value,
                onPointTap: onPointTap,
                trackColor: Colors.yellowAccent,
                dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                  textStyle: KTextStyle.of(context).body3,
                ),
              ),
            ],
            primaryXAxis: CategoryAxis(
              labelStyle: KTextStyle.of(context).body3,
            ),
            primaryYAxis: NumericAxis(
              edgeLabelPlacement: EdgeLabelPlacement.shift,
              numberFormat: NumberFormat.currency(decimalDigits: 0, symbol: '$currency '),
              labelStyle: KTextStyle.of(context).body3,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartDemo extends StatelessWidget {
  const BarChartDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        alignment: BarChartAlignment.spaceAround,
        maxY: 25,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
    enabled: false,
    touchTooltipData: BarTouchTooltipData(
      tooltipBgColor: Colors.transparent,
      tooltipPadding: const EdgeInsets.all(0),
      tooltipMargin: 8,
      getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex,
          ) {
        return BarTooltipItem(
          rod.y.round().toString(),
          TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    ),
  );

  FlTitlesData get titlesData => FlTitlesData(
    show: true,
    bottomTitles: SideTitles(
      showTitles: true,
      getTextStyles: (context, value) => const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      margin: 20,
      getTitles: (double value) {
        switch (value.toInt()) {
          case 0:
            return 'Jan';
          case 1:
            return 'Feb';
          case 2:
            return 'Mar';
          case 3:
            return 'Apr';
          case 4:
            return 'May';
          case 5:
            return 'Jun';
          case 6:
            return 'July';
          case 7:
            return 'Aug';
          default:
            return '';
        }
      },
    ),
    leftTitles: SideTitles(showTitles: true),
    topTitles: SideTitles(showTitles: false),
    rightTitles: SideTitles(showTitles: false),
  );

  FlBorderData get borderData => FlBorderData(
    show: false,
  );

  List<BarChartGroupData> get barGroups => [
    BarChartGroupData(
      x: 0,
      barRods: [
        BarChartRodData(y: 8, colors: [Colors.lightBlueAccent, Colors.greenAccent])
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 1,
      barRods: [
        BarChartRodData(y: 10, colors: [Colors.lightBlueAccent, Colors.greenAccent])
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 2,
      barRods: [
        BarChartRodData(y: 14, colors: [Colors.lightBlueAccent, Colors.greenAccent])
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 3,
      barRods: [
        BarChartRodData(y: 15, colors: [Colors.lightBlueAccent, Colors.greenAccent])
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 4,
      barRods: [
        BarChartRodData(y: 13, colors: [Colors.lightBlueAccent, Colors.greenAccent])
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 5,
      barRods: [
        BarChartRodData(y: 10, colors: [Colors.lightBlueAccent, Colors.greenAccent])
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 6,
      barRods: [
        BarChartRodData(y: 10, colors: [Colors.lightBlueAccent, Colors.greenAccent])
      ],
      showingTooltipIndicators: [0],
    ),
    BarChartGroupData(
      x: 7,
      barRods: [
        BarChartRodData(y: 10, colors: [Colors.lightBlueAccent, Colors.greenAccent])
      ],
      showingTooltipIndicators: [0],
    ),
  ];
}

class BarChartSample3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChartSample3State();
}

class BarChartSample3State extends State<BarChartSample3> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: const Color(0xff2c4260),
        child: const BarChartDemo(),
      ),
    );
  }
}
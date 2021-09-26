import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:resolvers/Constants/Fonts&Themes.dart';

import '../../Routes.dart';
import 'BarChart.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({Key key}) : super(key: key);

  @override
  _AnalyticsPageState createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  int touchedIndex=-1;
  List<Color> gradientColors = [
    const Color(0xff8438FF),
    const Color(0xffffffff),
  ];
  List<Color> grad = [
    Colors.lightBlueAccent , Colors.greenAccent,
  ];
  bool showAvg = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        extendBody: false,
        body: Padding(
          padding: EdgeInsets.only(
              left: 0.06* width, right: 0.04 * width, top: 0.06 * height),
          child: Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Analytics", style: paraText.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      color: Colors.black),),
                  SizedBox(height: 0.07 * height,),
                  Text("Expense Breakdown", style: paraText.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.black),),
                  SizedBox(height: 0.02 * height,),
                  AspectRatio(
                    aspectRatio: 1.70,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                          color: Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
                        child: LineChart(
                          mainData()
                        ),
                      ),
                    ),
                  ),
                  Text("Net Worth", style: paraText.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.black),),
                  SizedBox(height: 0.02 * height,),
                  AspectRatio(
                    aspectRatio: 1.70,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                          color: Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
                        child: LineChart(
                            mainData2()
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 0.07 * height,),
                  Text("Monthly Expenses", style: paraText.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.black),),
                  SizedBox(height: 0.02 * height,),
                  AspectRatio(
                    aspectRatio: 1.70,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                          color: Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
                        child: BarChartDemo()
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Color(0xff7165e3),
          backgroundColor: Colors.white,
          currentIndex: currIndex,
          elevation: 20,
          onTap: (val) {
            setState(() {
              if(val!=currIndex)
              {
                currIndex=val;
                if(val==0)
                {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/HomePage', (Route<dynamic> route) => false);
                }
                else if(val==1)
                {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/analyticsPage', (Route<dynamic> route) => false);
                }
                else if(val==2)
                {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/BudgetScorePage', (Route<dynamic> route) => false);
                }
                else if(val==4)
                {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/MyProfilePage', (Route<dynamic> route) => false);
                }
              }
            });
          },
          items: [
            BottomNavigationBarItem(
                label: " ",
                icon: Icon(Icons.account_balance_wallet_outlined)),
            BottomNavigationBarItem(
                label: " ",
                icon: Icon(Icons.bar_chart)),
            BottomNavigationBarItem(
                label: " ",
                icon: Stack(
                  children: [
                    Image.asset("assets/purplenavy.png", height: 50,),
                    Positioned(
                        top: 13,
                        left: 13,
                        child: Image.asset("assets/wand.png", height: 25,))
                  ],
                )),
            BottomNavigationBarItem(
                label: " ",
                icon: Icon(Icons.sticky_note_2_rounded)),
            BottomNavigationBarItem(
                label: " ",
                icon: Icon(Icons.person)),
          ],
        )
    );
  }
  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        drawVerticalLine: false,
        drawHorizontalLine: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) =>
          const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return DateTime.now().day.toString()+'/'+DateTime.now().month.toString();
              case 3:
                return ((DateTime.now().day+2)%30).toString()+'/'+DateTime.now().month.toString();
              case 5:
                return ((DateTime.now().day+5)%30).toString()+'/'+DateTime.now().month.toString();
              case 7:
                return ((DateTime.now().day+7)%30).toString()+'/'+(DateTime.now().month+1).toString();
              case 9:
                return ((DateTime.now().day+9)%30).toString()+'/'+(DateTime.now().month+1).toString();
              case 11:
                return ((DateTime.now().day+11)%30).toString()+'/'+(DateTime.now().month+1).toString();
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1k';
              case 3:
                return '2k';
              case 5:
                return '3k';
              case 7:
                return '4k';
              case 9:
                return '5k';
            }
            return '';
          },
          reservedSize: 32,
          margin: 12,
        ),
      ),
      borderData:
      FlBorderData(show: false, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 1.602),
            FlSpot(2, 1.579),
            FlSpot(4, 1.692),
            FlSpot(6, 1.694),
            FlSpot(8, 1.461),
            FlSpot(11, 1.461),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.6)).toList(),
          ),
        ),
      ],
    );
  }
  LineChartData mainData2() {
    return LineChartData(
      gridData: FlGridData(
        drawVerticalLine: false,
        drawHorizontalLine: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) =>
          const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'Jan';
              case 3:
                return 'Feb';
              case 5:
                return 'Mar';
              case 7:
                return 'Apr';
              case 9:
                return 'May';
              case 11:
                return 'June';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '100k';
              case 3:
                return '200k';
              case 5:
                return '300k';
              case 7:
                return '400k';
              case 9:
                return '500k';
            }
            return '';
          },
          reservedSize: 40,
          margin: 12,
        ),
      ),
      borderData:
      FlBorderData(show: false, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 1.602),
            FlSpot(2, 2.179),
            FlSpot(4, 2.692),
            FlSpot(6, 2.894),
            FlSpot(8, 1.961),
            FlSpot(11, 2.461),
          ],
          isCurved: true,
          colors: grad,
          barWidth: 6,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: grad.map((color) => color.withOpacity(0.6)).toList(),
          ),
        ),
      ],
    );
  }
  }

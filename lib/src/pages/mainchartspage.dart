import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/controler/SectionController.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:characters/characters.dart';
import 'package:pie_chart/pie_chart.dart';

import 'Pagemain.dart';
import 'SectionPage.dart';
import 'TestPage.dart';
//import 'package:charts_flutter/flutter.dart' as charts;

class MainchartsWidget extends StatefulWidget {
  @override
  _MainchartsWidgetState createState() => _MainchartsWidgetState();
}

class _MainchartsWidgetState extends StateMVC<MainchartsWidget> {
  PageMainController _con;

  _MainchartsWidgetState() : super(PageMainController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    List<_SalesData> data = [
      for (int i = 0; i < _con.map.length; i++)
        _SalesData(_con.map[i]["name section"], _con.map[i]["number market"]),
    ];
    Map<String, double> dataMap;
    if (_con.map2.isNotEmpty) {
      String g1 = _con.map2[0]["name section"];
      String g2 = _con.map2[1]["name section"];
      String g3 = _con.map2[2]["name section"];
      double g11 = _con.map2[0]["number market"];
      double g22 = _con.map2[1]["number market"];
      double g33 = _con.map2[2]["number market"];

      dataMap = {
        g1.toString(): g11,
        g2.toString(): g22,
        g3.toString(): g33,
      };
    }

    return Scaffold(
        drawer: Drawer(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue[900],
            ),
            child: ListView(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  color: Colors.black12,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainchartsWidget(),
                        ),
                      );
                    },
                    minWidth: MediaQuery.of(context).size.width / 4.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "الصفحة الرئيسية",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.5,
                ),
                Divider(
                  color: Colors.white,
                ),
                SizedBox(
                  height: 12.5,
                ),
                Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  color: Colors.black12,
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width / 4.5,
                    //color: Colors.black12,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PageMain(),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.storefront,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "إدارة المتاجر",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.5,
                ),
                Divider(
                  color: Colors.white,
                ),
                SizedBox(
                  height: 12.5,
                ),
                Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  color: Colors.black12,
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width / 4.5,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => pagemain(),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.face,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "قائمة المستخدمين",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.5,
                ),
                Divider(
                  color: Colors.white,
                ),
                SizedBox(
                  height: 12.5,
                ),
                Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  color: Colors.black12,
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width / 4.5,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TestPage(),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.book,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "التقارير ",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Image.asset("assets/img/photo1.png"),
                ),
                //SizedBox(height: 10,),
              ],
            ),
          ),
        ),
        body:((_con.map2.isNotEmpty)&&(_con.map.isNotEmpty))? ListView(children: [
      Column(children: [
        //Initialize the chart widget
        SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // Chart title
            title: ChartTitle(text: 'Half yearly sales analysis'),
            // Enable legend
            legend: Legend(isVisible: true),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<_SalesData, String>>[
              LineSeries<_SalesData, String>(
                  dataSource: data,
                  xValueMapper: (_SalesData sales, _) => sales.year,
                  yValueMapper: (_SalesData sales, _) => sales.sales,
                  name: 'المحلات',
                  // Enable data label
                  dataLabelSettings: DataLabelSettings(isVisible: true))
            ]),
        Container(
          height: 450,
          width: 450,
          child: PieChart(dataMap: dataMap),
        )
      ])
    ]):Container());
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

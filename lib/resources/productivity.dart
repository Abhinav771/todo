import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class productivity extends StatefulWidget {
  const productivity({super.key});

  @override
  State<productivity> createState() => _productivityState();
}

class _productivityState extends State<productivity> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        actions: [
        TextButton(onPressed: (){
      Navigator.of(context).pop();
    }
    , child: Text('Close'))
    ],
      title: Text('Productivity',style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w800,
      ),

      ),
      content: Center(
          child:Text('This feature release in upcomming version.')),

      // Container(
      //   // color: Colors.red,
      //
      //   child: Column(children: [
      //     SizedBox(
      //       height: 200,
      //       width: 300,
      //       child: BarChart(
      //         BarChartData(
      //           barGroups: [
      //             BarChartGroupData(
      //                 x: 10,
      //               barRods: [
      //                 BarChartRodData(toY: 10),
      //               ]
      //             ),
      //             BarChartGroupData(
      //                 x: 10,
      //                 barRods: [
      //                   BarChartRodData(toY: 16),
      //                 ]
      //             ),
      //             BarChartGroupData(
      //                 x: 10,
      //                 barRods: [
      //                   BarChartRodData(toY: 8),
      //                 ]
      //             ),
      //           ]
      //         ),
      //       ),
      //     ),
      //   ],),
      // ),

    );
  }
}

// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>  with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  String user_name='Yash';
  double p=0.0;
  // int percent_value=(percent*100).toInt();
  final EasyInfiniteDateTimelineController _controller =
  EasyInfiniteDateTimelineController();
  DateTime _focusDate = DateTime.now();
  var days={1:'Mon',2:'Tue',3:'Wed',4:'Thr',5:'Fri',6:'Sat',7:'Sun'};
  @override

  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500), // Animation duration
    );
  }
  void _updatePercent(double newPercent) {
    setState(() {
      p += newPercent;
    });
    _animationController.forward(from: p); // Start the animation from the beginning
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(children: [
            SizedBox(height: 30,),
            Container(
              child:
              Text('Hello $user_name',
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 30,
                  // fontFamily: 'NotoSans',
                  fontWeight: FontWeight.w900,
                ),

              ),

            ),
            SizedBox(height: 30,),
            SizedBox(
              // height: 420,
              child: Container(

                color: const Color(0XFFEEFFF9),
                margin: EdgeInsets.all(16),
                child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Column(children: [
                      Text('Task Completed!',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                      Container(
                          child: Text('3/5',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900),)),

                                      ],),
                    CircularPercentIndicator(

                      radius: 60.0,
                      lineWidth: 10.0,
                      animation: true,
                      animationDuration:500,
                      percent:p,
                      center: Text('${(p * 100).toInt()}%',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      backgroundColor: Color(0XFFC6FEF1),
                      progressColor: Color(0XFF0BC682),

                      circularStrokeCap: CircularStrokeCap.round, // This makes the ends rounded
                    ),




                  ],

                ),
              ),
              ),
            EasyInfiniteDateTimeLine(

              controller: _controller,
              firstDate: DateTime(2024),
              focusDate: _focusDate,
              lastDate: DateTime(2024, 12, 31),
              // activeColor: Color(0XFF0BC682),
              itemBuilder: (BuildContext context, DateTime date,
              bool isHighlighted, void Function() onDayPressed) {
                bool isSelected =
                    date.year == _focusDate.year &&
                        date.month == _focusDate.month &&
                        date.day == _focusDate.day;
                Color textColor = isSelected ? Colors.white : Colors.black;
                return InkWell(
                    onTap: () {
                  onDayPressed();
                                },
                  child: Container(

                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.green : Colors.transparent,
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(
                        color: Colors.green, // Border color
                        width: 2.0, // Border width
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '${date.day}',
                          style: TextStyle(
                            color: textColor,
                            fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        Text(
                          '${days[date.weekday]}',
                          style: TextStyle(
                            color: textColor,
                            fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ],

                    ),

                  ),
                );
              },
              onDateChange: (selectedDate) {
                setState(() {
                  _focusDate = selectedDate;
                });
              },
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                _updatePercent(0.2);
              });
            },
              // tooltip: 'Animate',
              child: Icon(Icons.play_arrow),
            )
          ],),

        ),
      ),
    );
  }
}


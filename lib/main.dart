// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:todo/resources/taskCard.dart';
import 'package:todo/resources/addTask.dart';
import 'package:todo/resources/productivity.dart';
import 'package:todo/resources/percentage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override

  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>  with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  String user_name='Yash';

  
  // int percent_value=(percent*100).toInt();
  final EasyInfiniteDateTimelineController _controller =
  EasyInfiniteDateTimelineController();
  DateTime _focusDate = DateTime.now();
  var days={1:'Mon',2:'Tue',3:'Wed',4:'Thr',5:'Fri',6:'Sat',7:'Sun'};


  List<TaskCard> tasks=[
    TaskCard(
      backgroundColor: const Color(0XFF9BC3FF),
      highlightedColor: const Color(0XFF458CFF),
      imgSrc: 'images/swimming.png',
      taskName: 'Swimming',
    ),
    TaskCard(
      backgroundColor: const Color(0XFF65DCB2),
      highlightedColor: const Color(0XFF0EC075),
      imgSrc: 'images/running.png',
      taskName: 'Running',
    ),
    TaskCard(
      backgroundColor: const Color(0XFFFFE29C),
      highlightedColor: const Color(0XFFFFC536),
      imgSrc: 'images/yoga.png',
      taskName: 'Yoga',
    ),
    TaskCard(
      backgroundColor: const Color(0XFF4FD7F4),
      highlightedColor: const Color(0XFF126B7E),
      imgSrc: 'images/work.png',
      taskName: 'Work',
    ),
    TaskCard(
      backgroundColor: const Color(0XFFFBCEE2),
      highlightedColor: const Color(0XFFF69FC2),
      imgSrc: 'images/shopping.png',
      taskName: 'Shopping',
    ),
    TaskCard(
      backgroundColor: const Color(0XFFFFAD5E),
      highlightedColor: const Color(0XFFFE810A),
      imgSrc: 'images/other.png',
      taskName: 'Other',
    ),
  ];





  void _updatePercent() {
    setState(() {

      _animationController.forward(from: 0);
    });
    // Start the animation from the beginning
  }
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider<Percentage>(create: (_) => Percentage()),
      ],
      child: Scaffold(

          body:
          SafeArea(
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
                      Consumer<Percentage>(builder: (context,per,child){
                        return  Column(children: [
                          Text('Task Completed!',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),

                          Container(
                              child: Row(children: [

                                Text('${per.taskCompleted}',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Color(0XFF0BC682),
                                      fontWeight: FontWeight.w900),),
                                Text('/${per.totalTasks}',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900),)
                              ],)

                          ),

                        ],);
                      }),
                      Consumer<Percentage>(builder: (context,per,child){
                        return CircularPercentIndicator(

                          radius: 60.0,
                          lineWidth: 10.0,
                          animation: true,
                          animationDuration:500,
                          percent:per.percentage,
                          center: Text('${(per.percentage * 100).toInt()}%',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          backgroundColor: Color(0XFFC6FEF1),
                          progressColor: Color(0XFF0BC682),

                          circularStrokeCap: CircularStrokeCap.round, // This makes the ends rounded
                        );
                      }),





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
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Colors.green, // Border color
                          width: 1.0, // Border width
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
              Consumer<Percentage>(builder: (context,per,child){
                return ElevatedButton(onPressed: (){
                  per.incTaskComp();
                },
                  // tooltip: 'Animate',
                  child: Icon(Icons.play_arrow),
                );
              }),

              Text('Tasks'),
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return tasks[index];
                  },
                ),
              ),




            ],),

          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          // Places the FloatingActionButton at the bottom end corner, docked to the Scaffold

          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8,bottom: 8),
                child: FloatingActionButton(


                  onPressed: () {
                    // Add your onPressed logic here
                    showDialog(context: context, builder: (context)=>productivity(),);
                  },
                  child: Icon(Icons.bar_chart,

                  color: Colors.white,),
                  backgroundColor: Colors.blue,
                ),
              ),
              Consumer<Percentage>(builder: (context,per,child){
                return FloatingActionButton(

                  onPressed: () {

                    showDialog(context: context, builder: (context)=>addTask(), );
                    per.incTotalTask();



                  },
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.add, color: Colors.white,),
                );
              }),

            ],

          ),



      ),
    );
  }
}


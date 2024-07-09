// import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:todo/resources/checkBox.dart';
import 'package:todo/resources/data.dart';
import 'package:todo/resources/taskCard.dart';
import 'package:todo/resources/addTask.dart';
import 'package:todo/resources/productivity.dart';
import 'package:todo/resources/percentage.dart';
import 'package:provider/provider.dart';
import 'package:todo/resources/taskList.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/screens/home.dart';
import 'package:todo/screens/landing_screen.dart';
import 'package:todo/screens/wrapper.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<Percentage>(create: (_) => Percentage()),
        ChangeNotifierProvider<Data>(create: (_) => Data()),
        ChangeNotifierProvider<TaskList>(create: (_) => TaskList()),
        // ChangeNotifierProvider<CheckboxExample>(create: (_) => CheckboxExample()),
      ],
      child:MaterialApp(home: LandingScreen(),),),);
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//
//   @override
//
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp>  with SingleTickerProviderStateMixin{
//   late AnimationController _animationController;
//   late final AnimationController confetti_controller;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     confetti_controller=AnimationController(vsync: this,duration: Duration(seconds: 3));
//   }
//
//   @override
//   void dispose() {
//     confetti_controller.dispose();
//     // TODO: implement dispose
//     super.dispose();
//   }
//
//
//
//   String user_name='Abhinav';
//   String wish="Good Morning";
//
//
//
//   // int percent_value=(percent*100).toInt();
//   final EasyInfiniteDateTimelineController _controller =
//   EasyInfiniteDateTimelineController();
//   DateTime _focusDate = DateTime.now();
//   var days={1:'Mon',2:'Tue',3:'Wed',4:'Thr',5:'Fri',6:'Sat',7:'Sun'};
//
//
//
//
//
//
//   void _updatePercent() {
//     setState(() {
//
//       _animationController.forward(from: 0);
//     });
//     // Start the animation from the beginning
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Scaffold(
//           // appBar: AppBar(title: Text('ToDo App'),),
//           body:
//           SafeArea(
//
//             child:
//             Stack(
//               children: [
//
//                 Column(
//                   // mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 15,),
//                     Container(
//                       child:
//                       Padding(
//                         padding: const EdgeInsets.only(left: 16),
//                         child: RichText(
//                           text: TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: 'Hello ',
//                                 style: TextStyle(fontSize: 24.0, color: Colors.black,fontWeight: FontWeight.w900,fontFamily: "OpenSans"),
//                               ),
//                               TextSpan(
//                                 text: '$user_name'+'!',
//                                 style: TextStyle(fontSize: 32.0, color: Colors.blue, fontWeight: FontWeight.w900,fontFamily: "OpenSans"),
//                               ),
//
//                             ],
//                           ),
//                         ),
//
//                       ),
//
//                     ),
//                     Consumer<TaskList>(builder: (context,taskList,child){
//                       return Padding(
//                         padding: const EdgeInsets.only(left: 16),
//                         child: Text('${taskList.wish}',style: TextStyle(color: Color(0XFF777777),fontFamily: "OpenSans"),),
//                       );
//                     }),
//
//                     SizedBox(height: 16,),
//                     SizedBox(
//                       // height: 420,
//                       child: Container(
//
//                         color: const Color(0XFFEEFFF9),
//                         margin: EdgeInsets.all(16),
//                         child:Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Consumer<Percentage>(builder: (context,per,child){
//                               return  Column(children: [
//                                 Text('Task Completed!',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,fontFamily: "OpenSans"),),
//
//                                 Container(
//                                     child: Row(children: [
//
//                                       Text('${per.taskCompleted}',
//                                         style: TextStyle(
//                                             fontSize: 30,
//                                             color: Color(0XFF0BC682),
//                                             fontWeight: FontWeight.w900,
//                                             fontFamily: "OpenSans"
//                                         ),),
//                                       Text('/${per.totalTasks}',
//                                         style: TextStyle(
//                                             fontSize: 30,
//                                             fontWeight: FontWeight.w900,
//                                             fontFamily: "OpenSans"
//                                         ),)
//                                     ],)
//
//                                 ),
//
//                               ],);
//                             }),
//
//                             Consumer<Percentage>(builder: (context,per,child){
//                               return CircularPercentIndicator(
//
//                                 radius: 60.0,
//                                 lineWidth: 10.0,
//                                 animation: true,
//                                 animationDuration:500,
//                                 percent:per.percentage,
//                                 center: Text('${(per.percentage * 100).toInt()}%',
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w900,
//                                       fontFamily: "OpenSans"
//                                   ),
//                                 ),
//                                 backgroundColor: Color(0XFFC6FEF1),
//                                 progressColor: Color(0XFF0BC682),
//
//                                 circularStrokeCap: CircularStrokeCap.round, // This makes the ends rounded
//                               );
//                             }),
//
//
//
//
//
//                           ],
//
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 16,),
//                     Consumer<TaskList>(builder: (context,taskList,child){
//                       return  EasyInfiniteDateTimeLine(
//                         controller: _controller,
//                         firstDate: DateTime(2024),
//                         focusDate: _focusDate,
//                         lastDate: DateTime(2024, 12, 31),
//
//                       );
//                     }),
//
//                     // Consumer<Percentage>(builder: (context,per,child){
//                     //   return ElevatedButton(onPressed: (){
//                     //     per.incTaskComp();
//                     //   },
//                     //     // tooltip: 'Animate',
//                     //     child: Icon(Icons.play_arrow),
//                     //   );
//                     // }),
//
//                     // Consumer<Data>(builder: (context,data,child){
//                     //     return Column(children: [
//                     //         Text('${data.addTaskDetails[data.lastIndex][0]}'),
//                     //         Text('${data.addTaskDetails[data.lastIndex][1]}'),
//                     //         Text('${data.addTaskDetails[data.lastIndex][2]?.format(context)}'),
//                     //     ],);
//                     // }),
//
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text('Tasks',style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.w800,
//                         fontFamily: "OpenSans",
//
//                       ),),
//                     ),
//                     Consumer<TaskList>(builder: (context,taskList,child){
//                       return Expanded(
//                         child: ListView.builder(
//                           itemCount: taskList.map[taskList.focusDate]?.length,//tasks.length,
//                           itemBuilder: (context, index) {
//                             return taskList.map[taskList.focusDate]?[index];//tasks[index];
//
//                           },
//                         ),
//                       );
//                     }),
//
//
//
//
//
//                   ],),
//                 Lottie.asset('animations/confet.json',
//                 repeat: false,
//                 controller: confetti_controller,
//                 // width:MediaQuery.sizeOf(context).height,
//                 //   height:MediaQuery.sizeOf(context).width,
//                 //   fit:BoxFit.cover,
//                 //   width: 500,
//                 //   height: 1000,
//                 ),
//               ],
//
//             ),
//
//           ),
//           floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//           // Places the FloatingActionButton at the bottom end corner, docked to the Scaffold
//
//           floatingActionButton: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 8,bottom: 8),
//                 child: FloatingActionButton(
//
//
//                   onPressed: () {
//                     // Add your onPressed logic here
//                     showDialog(context: context, builder: (context)=>productivity(),);
//                   },
//                   child: Icon(MdiIcons.chartBar,color: Colors.white,),
//                   backgroundColor: Colors.blue,
//                 ),
//               ),
//               Consumer<Percentage>(builder: (context,per,child){
//                 return FloatingActionButton(
//
//                   onPressed: () {
//
//                     showDialog(context: context, builder: (context)=>addTask(), );
//                     // var ticker=confetti_controller.forward();
//                     // ticker.whenComplete(() {
//                     //   confetti_controller.reset();
//                     // });
//                     // per.incTotalTask();
//
//
//
//                   },
//                   backgroundColor: Colors.blue,
//                   child: Icon(MdiIcons.plus,color: Colors.white,),//Icon(Icons.add, color: Colors.white,),
//                 );
//               }),
//
//             ],
//
//           ),
//
//
//
//       );
//
//   }
// }
//

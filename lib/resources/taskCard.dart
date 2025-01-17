// import 'dart:html';

// import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:todo/resources/percentage.dart';

// import 'checkBox.dart';
import 'data.dart';





class TaskCard extends StatefulWidget {
  final Color backgroundColor;
  final Color highlightedColor;
  final String imgSrc;
  final String taskName;
  final TimeOfDay? time;
  // final AnimationController confittiController;

  TaskCard({
    required this.backgroundColor,
    required this.highlightedColor,
    required this.imgSrc,
    required this.taskName,
    required this.time,
    // required this.confittiController,
  }); 

  // get confetti_controller => null;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  // bool? isChecked = false;
  final Percentage percentage = Percentage();
  // bool isChecked = false;
  //
  // // Updated function definition
  // Function(bool?)? updateTaskCompletion;
  //
  //
  // void initState() {
  //   super.initState();
  //   // Assign your function to updateTaskCompletion
  //   updateTaskCompletion = (newValue) {
  //     setState(() {
  //       isChecked = newValue ?? false; // Handle null case or set default value
  //       // You can call any other logic you need here
  //     });
  //     // You can call other functions or update state as needed
  //   };
  // }
  bool isChecked=false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };

    if (states.contains(MaterialState.selected)) {
      // Checked state
      return widget.highlightedColor; // Use widget.bgColor for checked state color
    } else if (states.any(interactiveStates.contains)) {
      // States like pressed, hovered, focused (unchecked)
      return Colors.yellow; // Background color when interactive (unchecked)
    } else {
      return Colors.white; // Default background color when unchecked and not interactive
    }
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        setState(() {
          if(isChecked==true){
            isChecked=false;
          }
          else{
            isChecked=true;
          }
        });


      },
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){

                },
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.backgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 60,
                          width: 60,
                          child: Image.asset(widget.imgSrc,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width:140,
                              child: SingleChildScrollView(
                                scrollDirection:Axis.horizontal,
                                child: Text(
                                  widget.taskName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 30,
                                    color: widget.highlightedColor,
                                      fontFamily: "OpenSans",
                                  ),
                                ),
                              ),
                            ),
                            Consumer<Data>(builder: (context,data,child){
                              return Text(
                                '      ${widget.time?.format(context)}      ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15,
                                  color: widget.highlightedColor,
                                ),
                              );
                            }),

                          ],
                        ),
                      ),
                      // Consumer<Percentage>(
                      // builder: (context,per,child){
                      //   return RoundCheckBox(
                      //
                      //
                      //     size: 45,
                      //     uncheckedColor: Colors.white,
                      //     checkedColor: widget.highlightedColor,
                      //     borderColor: widget.backgroundColor,
                      //     animationDuration: Duration(milliseconds: 250),
                      //     onTap: (selected){
                      //       setState(() {
                      //         // per.incTaskComp();
                      //       });
                      //     },
                      //   );
                      //
                      // }),
                Consumer<Percentage>(builder: (context,per,child){
                  return
                  Transform.scale(
                    scale: 2.5,
                    child: Checkbox(
                      activeColor: widget.highlightedColor, // Use widget.bgColor for active color (when checked)
                      checkColor: Colors.white, // Color of the check mark
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      shape: CircleBorder(),
                      side: BorderSide(color: Colors.transparent),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {

                          isChecked = value ?? false;
                          if(isChecked==true){
                            per.incTaskComp();
                          }
                          else{
                            per.decTaskComp();
                          }

                          // if(per.percentage==1){
                          //   var ticker=widget.confetti_controller.forward();
                          //   ticker.whenComplete(() {
                          //     widget.confetti_controller.reset();
                          //   });
                          // }

                        });

                      },
                    ),
                  );
                }),

                    ],
                  ),
                ),
              ),
            ),
            // Container(
            //
            // )

          ],
        ),
      ),
    );
  }
}

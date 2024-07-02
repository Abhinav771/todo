// import 'dart:html';

// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:todo/resources/percentage.dart';

import 'checkBox.dart';





class TaskCard extends StatefulWidget {
  final Color backgroundColor;
  final Color highlightedColor;
  final String imgSrc;
  final String taskName;

  TaskCard({
    required this.backgroundColor,
    required this.highlightedColor,
    required this.imgSrc,
    required this.taskName,
  });

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

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){

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
                            Text(
                              widget.taskName,
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 30,
                                color: widget.highlightedColor,
                              ),
                            ),
                            Text(
                              '3:00 - 4:00',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                                color: widget.highlightedColor,
                              ),
                            ),
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
                         CheckboxExample(),
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
class CheckboxExample extends StatefulWidget {
  const CheckboxExample({Key? key}) : super(key: key);

  @override
  _CheckboxExampleState createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.yellow;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 2.5,
      child: Checkbox(
        activeColor: Color(0xFF126B7E),
        checkColor: Colors.white,
        focusColor: Colors.red,
        side: BorderSide(color:Colors.transparent,width: 10),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        // fillColor: MaterialStateProperty.resolveWith(getColor),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value ?? false;
          });
        },
      ),
    );
  }
}




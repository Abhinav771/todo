// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:todo/resources/percentage.dart';




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

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    Consumer<Percentage>(
                    builder: (context,per,child){
                      return RoundCheckBox(


                        size: 45,
                        uncheckedColor: Colors.white,
                        checkedColor: widget.highlightedColor,
                        borderColor: widget.backgroundColor,
                        animationDuration: Duration(milliseconds: 250),
                        onTap: (selected) {

                          per.incTaskComp();
                        },
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
    );
  }
}
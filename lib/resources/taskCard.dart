// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';




class TaskCard extends StatelessWidget {
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

  // bool? isChecked = false;

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
                  color: backgroundColor,
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
                        child: Image.asset(imgSrc,
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
                            taskName,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 30,
                              color: highlightedColor,
                            ),
                          ),
                          Text(
                            '3:00 - 4:00',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                              color: highlightedColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RoundCheckBox(
                      onTap: (selected) {



                      },
                      
                      size: 45,
                      uncheckedColor: Colors.white,
                      checkedColor: highlightedColor,
                      borderColor: backgroundColor,
                      animationDuration: Duration(milliseconds: 250),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Container(
          //   child: FloatingActionButton(onPressed: (){
          //
          //   }),
          // )

        ],
      ),
    );
  }
}
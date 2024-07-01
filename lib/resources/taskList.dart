import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/resources/taskCard.dart';

class TaskList with ChangeNotifier {
  DateTime focusDate=DateTime(2024,7,1);

  updateDate(){
    DateTime today = DateTime.now();
    int day = today.toLocal().day;
    int month = today.toLocal().month;
    int year = today.toLocal().year;
    focusDate = DateTime(year, month, day);
    notifyListeners();
  }

  // print(dateOnly);


  final Map<DateTime,List<TaskCard>> map={
    DateTime(2024,7,1):[TaskCard(
      backgroundColor: const Color(0XFF9BC3FF),
      highlightedColor: const Color(0XFF458CFF),
      imgSrc: 'images/swimming.png',
      taskName: 'Swimming',
    ),TaskCard(
      backgroundColor: const Color(0XFF9BC3FF),
      highlightedColor: const Color(0XFF458CFF),
      imgSrc: 'images/swimming.png',
      taskName: 'Swimming',
    )]

  };

  final List<TaskCard> tasks = [
    TaskCard(
      backgroundColor: const Color(0XFF9BC3FF),
      highlightedColor: const Color(0XFF458CFF),
      imgSrc: 'images/swimming.png',
      taskName: 'Swimming',
    )
  ];

  // Maps for category images, background colors, and highlighted colors
  final Map<String, String> catImg = {
    'Work': 'images/work.png',
    'Swimming': 'images/swimming.png',
    'Running': 'images/running.png',
    'Yoga': 'images/yoga.png',
    'Shopping': 'images/shopping.png',
    'Others': 'images/other.png',
  };

  final Map<String, Color> bgColor = {
    'Work': Color(0xFF4FD7F4),
    'Swimming':  Color(0xFF9BC3FF),
    'Running': Color( 0xFF65DCB2),
    'Yoga':  Color(0xFFFFE29C),
    'Shopping':  Color(0xFFFBCEE2),
    'Others':  Color(0xFFFFAD5E),
  };

  final Map<String, Color> highColor = {
    'Work': Color(0xFF126B7E),
    'Swimming': Color(0xFF458CFF),
    'Running': Color(0xFF0EC075),
    'Yoga': Color(0xFFFFC536),
    'Shopping': Color(0xFFF69FC2),
    'Others': Color(0xFFFE810A),
  };

  // Update task list with new task details
  void updateTaskList(String category, String taskName, TimeOfDay? time) {
    tasks.add(
      TaskCard(
        backgroundColor: bgColor[category]!, // No need for the ! operator
        highlightedColor: highColor[category]!,
        imgSrc: catImg[category]!, // No need for the ! operator
        taskName: taskName,
      )
    );

    notifyListeners();
  }


  void updateDateMap(DateTime date,String category, String taskName, TimeOfDay? time){
    if (map.containsKey(date)) {
      map[date]?.add(
          TaskCard(
            backgroundColor: bgColor[category]!, // No need for the ! operator
            highlightedColor: highColor[category]!,
            imgSrc: catImg[category]!, // No need for the ! operator
            taskName: taskName,
          )
      );
    } else {
      map[date]?.add(
          TaskCard(
            backgroundColor: bgColor[category]!, // No need for the ! operator
            highlightedColor: highColor[category]!,
            imgSrc: catImg[category]!, // No need for the ! operator
            taskName: taskName,
          )
      );


    }
    updateTaskList( category,  taskName,  time);
    notifyListeners();
  }


}


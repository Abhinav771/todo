
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Data with ChangeNotifier{
  var valToWork ={'One':'Work','Two':'Swimming','Three':'Running','Four':'Yoga','Five':'Shopping','Six':'Others'};
  String category="Wo";
  String task="a";
  TimeOfDay? selectedTime=TimeOfDay.now();
  List<List<dynamic>> addTaskDetails=[['w','w',TimeOfDay.now()]];

  int lastIndex=0;
  updateLastIndex(){
    lastIndex=addTaskDetails.length-1;
    notifyListeners();
  }

  updateCat(String x){
    category=valToWork[x]!;
    notifyListeners();
  }

  updateTask(String x){
    task=x;
    notifyListeners();
  }
  updateTime(TimeOfDay? x){
    selectedTime=x;
    notifyListeners();
  }

  updateD(){
    int a=addTaskDetails.length;
    category=addTaskDetails[a-1][0];
    task=addTaskDetails[a-1][1];
    selectedTime=addTaskDetails[a-1][2];
    notifyListeners();

  }

  updateDetails(String x,String y,TimeOfDay? z){
    List<dynamic> l=[];
    l.add(valToWork[x]!);
    l.add(y);
    l.add(z);
    addTaskDetails.add(l);
    updateD();
    updateLastIndex();
    notifyListeners();
  }

}
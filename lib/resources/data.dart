
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Data with ChangeNotifier{
  var valToWork ={'One':'Work','Two':'Swimming','Three':'Running','Four':'Yoga','Five':'Shopping','Six':'Others'};
  String category="Wo";
  String task="a";
  TimeOfDay? selectedTime=TimeOfDay.now();


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

}
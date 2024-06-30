import 'package:flutter/cupertino.dart';
class Percentage with ChangeNotifier{
  int taskCompleted=1;
  int totalTasks=1;
  double percentage=0;

  updatePercentage(){
    if(taskCompleted==0){
      percentage=0;
    }
    else{
      percentage=taskCompleted/totalTasks;
    }

  }

  incTaskComp(){
    taskCompleted++;
    updatePercentage();
    notifyListeners();
  }
  incTotalTask(){
    totalTasks++;
    updatePercentage();
    notifyListeners();
  }


}
import 'package:flutter/cupertino.dart';
class Percentage with ChangeNotifier{
  int taskCompleted=1;
  int totalTasks=1;
  double percentage=0;
  bool a=true;

  updatePercentage(){
    if(taskCompleted==0){
      percentage=0;
    }
    else{
      percentage=taskCompleted/totalTasks;
    }

  }
  updateTaskComp(){
    if(a==true){
      a=false;
      incTaskComp();
    }
    else{
      a=true;
      decTaskComp();
    }
  }

  incTaskComp(){
    taskCompleted++;
    updatePercentage();
    notifyListeners();
  }
  decTaskComp(){
    taskCompleted--;
    updatePercentage();
    notifyListeners();
  }
  incTotalTask(){
    totalTasks++;
    updatePercentage();
    notifyListeners();
  }


}
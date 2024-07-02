import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/resources/percentage.dart';
import 'package:todo/resources/taskList.dart';

import 'data.dart';




class addTask extends StatefulWidget {
  const addTask({super.key});

  @override
  State<addTask> createState() => _addTaskState();
}

class _addTaskState extends State<addTask> {

  final _formKey=GlobalKey<FormState>();
  TimeOfDay? selectedTime=TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    // Handle pickedTime as needed
    if (pickedTime != null) {
      setState(() {
        print('Selected time: ${pickedTime.format(context)}');
        selectedTime=pickedTime;
      });

    }
  }

  String _dropdownValue='One';
  TextEditingController _taskTEC =TextEditingController();
  @override
  Widget build(BuildContext context) {

    return

      AlertDialog(

            actions: [
              Consumer<TaskList>(builder: (context,taskList,child){
                return Consumer<Data>(builder: (context,data,child){
                  return Consumer<Percentage>(builder: (context,per,child){
                    return TextButton(onPressed: (){
                      per.incTotalTask();
                      data.updateCat(_dropdownValue);
                      data.updateTask(_taskTEC.text);
                      data.updateTime(selectedTime);
                      // taskList.updateTaskList(_dropdownValue, _taskTEC.text, selectedTime);
                      data.updateDetails(_dropdownValue, _taskTEC.text, selectedTime);
                      taskList.tasks;
                      taskList.updateTaskList(data.category, _taskTEC.text, selectedTime);
                      taskList.updateDateMap(taskList.focusDate, data.category, _taskTEC.text, selectedTime);


                      Navigator.of(context).pop();
                    }




                        ,child: Text('Add Task',style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w500,
                        ),));
                  });
                });
              }),






            ],
            title: Text('Add New Task',style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
                fontFamily: "OpenSans",
            ),),
            content: SizedBox(
              height: 250,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30,),
                    // Text('Select Category'),
                    DropdownButton<String>(
                        focusColor: CupertinoColors.systemGrey4,

                        value: _dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down),


                        items: const [
                          DropdownMenuItem(
                            value: 'One',
                            child: Text('Work',
                              style: TextStyle(
                                fontSize: 20,
                                  fontFamily: "OpenSans",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Two',
                            child: Text('Swimming',
                              style: TextStyle(
                                fontSize: 20,
                              ),),
                          ),
                          DropdownMenuItem(
                            value: 'Three',
                            child: Text('Running',
                              style: TextStyle(
                                fontSize: 20,
                              ),),
                          ),
                          DropdownMenuItem(
                            value: 'Four',
                            child: Text('Yoga',
                              style: TextStyle(
                                fontSize: 20,
                              ),),
                          ),
                          DropdownMenuItem(
                            value: 'Five',
                            child: Text('Shopping',
                              style: TextStyle(
                                fontSize: 20,
                              ),),
                          ),
                          DropdownMenuItem(
                            value: 'Six',
                            child: Text('Others',
                              style: TextStyle(
                                fontSize: 20,
                              ),),
                          ),
                        ],
                        onChanged: (String? newValue){
                          setState(() {
                            _dropdownValue=newValue!;
                          });
                        }
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        controller: _taskTEC,
                        decoration: InputDecoration(
                          hintText: 'Enter Task', // This is your hint text
                        ),
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return 'Enter Something';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Starting Time: ',
                            style: TextStyle(
                              fontSize: 15,
                                fontFamily: "OpenSans",
                            ),
                          ),

                          MaterialButton(onPressed: (){
                            _selectTime(context);
                          },

                            child: Text('${selectedTime?.format(context)}',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            color: Colors.blue,

                          ),
                        ],
                      ),
                    ),



                  ],
                ),
              ),
            ),
            contentPadding: EdgeInsets.all(8),
          );




  }
}
















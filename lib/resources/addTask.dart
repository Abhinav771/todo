// import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';








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
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop();
        }
            , child: Text('close'))
      ],
      title: Text('Add New Task',style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),),
      content: SizedBox(
        height: 300,
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
              SizedBox(height: 50,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Starting Time: ',
                      style: TextStyle(
                        fontSize: 15,
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
















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

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    // Handle pickedTime as needed
    if (pickedTime != null) {
      print('Selected time: ${pickedTime.format(context)}');
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
            children: [
              Text('Select Category'),
              DropdownButton<String>(
                  focusColor: CupertinoColors.systemGrey4,

                  value: _dropdownValue,
                  icon: const Icon(Icons.arrow_back),


                  items: const [
                    DropdownMenuItem(
                      value: 'One',
                      child: Text('One'),
                    ),
                    DropdownMenuItem(
                      value: 'Two',
                      child: Text('Two'),
                    ),
                    DropdownMenuItem(
                      value: 'Three',
                      child: Text('Three'),
                    ),
                  ],
                  onChanged: (String? newValue){
                    setState(() {
                      _dropdownValue=newValue!;
                    });
                  }
              ),
              Text('Write Task'),
              SizedBox(
                width: 200,
                child: TextFormField(

                  validator: (value){
                    if(value==null || value.isEmpty){
                      return 'Enter Something';
                    }
                    return null;
                  },
                ),
              ),
              MaterialButton(onPressed: (){
                _selectTime(context);
              },
                child: Text('Select Task Time'),
                color: Colors.blue,
              ),

            ],
          ),
        ),
      ),
      contentPadding: EdgeInsets.all(8),
    );
  }
}
















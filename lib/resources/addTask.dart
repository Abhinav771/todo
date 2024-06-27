import 'package:flutter/material.dart';


class addTask extends StatelessWidget {
  const addTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text('close'))
      ],
      title: Text('Add New Task',style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),),
      contentPadding: EdgeInsets.all(8),
    );
  }
}


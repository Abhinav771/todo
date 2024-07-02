import 'package:flutter/material.dart';

class CheckboxExample extends StatefulWidget with ChangeNotifier{
   CheckboxExample({Key? key}) : super(key: key);

  @override
  _CheckboxExampleState createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.yellow;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 2.5,
      child: Checkbox(
        activeColor: Color(0xFF126B7E),
        checkColor: Colors.white,
        focusColor: Colors.red,
        side: BorderSide(color:Colors.transparent,width: 10),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        // fillColor: MaterialStateProperty.resolveWith(getColor),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value ?? false;
          });
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';

class CheckboxExample extends StatefulWidget {
  final Color bgColor; // Background color when checked
  final bool isChecked;

  CheckboxExample({
    required this.bgColor,
    required this.isChecked,
  });

  @override
  _CheckboxExampleState createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };

    if (states.contains(MaterialState.selected)) {
      // Checked state
      return widget.bgColor; // Use widget.bgColor for checked state color
    } else if (states.any(interactiveStates.contains)) {
      // States like pressed, hovered, focused (unchecked)
      return Colors.yellow; // Background color when interactive (unchecked)
    } else {
      return Colors.white; // Default background color when unchecked and not interactive
    }
  }
  bool c=false;
  @override
  Widget build(BuildContext context) {
    bool d=widget.isChecked;
    return Transform.scale(
      scale: 2.5,
      child: Checkbox(
        activeColor: widget.bgColor, // Use widget.bgColor for active color (when checked)
        checkColor: Colors.white, // Color of the check mark
        fillColor: MaterialStateProperty.resolveWith(getColor),
        value: d,
        onChanged: (bool? value) {
          setState(() {
            bool b=widget.isChecked;
            b = value ?? false;
            d=value!;// Update isChecked from onChanged callback
          });

        },
      ),
    );
  }
}

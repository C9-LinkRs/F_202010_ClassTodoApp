import 'package:flutter/material.dart';

class StatelessDropdown extends StatelessWidget {
  const StatelessDropdown({
    this.selected,
    this.onChangedValue
  });
  
  final String selected;
  final ValueChanged<String> onChangedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selected,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Theme.of(context).primaryColor),
      underline: Container(
        height: 2,
        color: Theme.of(context).primaryColor,
      ),
      onChanged: (String newValue) { onChangedValue(newValue); },
      items: <String>['Default', 'Call', 'Homework']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

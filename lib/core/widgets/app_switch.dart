import 'package:flutter/material.dart';

class AppSwitchWidget extends StatelessWidget {
  final bool selectedValue;
  final Function(bool)? isSelected;

  const AppSwitchWidget({Key? key,required this.selectedValue,this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: selectedValue,
      activeColor: Colors.lightBlue,
      onChanged: (bool value) => isSelected!(value),
    );
  }
}

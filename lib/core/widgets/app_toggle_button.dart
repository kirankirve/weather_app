
import 'package:flutter/material.dart';

class AppToggleButtons extends StatelessWidget {
  final List<Widget> children;
  final List<bool> selections;
  final Color? borderWithFillColor;
  final bool multiSelect;
  final Function(int)? selectedIndex;
  const AppToggleButtons({Key? key,required this.children,required this.selections,this.borderWithFillColor,this.multiSelect = false,this.selectedIndex  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      onPressed: (int index) {
        selectedIndex!(index);
      },
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      selectedBorderColor: borderWithFillColor ?? Colors.white,
      selectedColor: Colors.white,
      fillColor: borderWithFillColor ?? Colors.white,
      color: Colors.red[400],
      constraints: const BoxConstraints(
        minHeight: 40.0,
        minWidth: 80.0,
      ),
      isSelected: selections,
      children: children,
    );
  }
}

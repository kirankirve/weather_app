
import 'package:flutter/material.dart';

class AppDropdown extends StatefulWidget {
   AppDropdown({super.key,required this.list});
  List<String> list;

  @override
  State<AppDropdown> createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  String dropdownValue = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     dropdownValue = widget.list.first;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(width: double.infinity,color: Colors.white,
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_drop_down,color: Colors.transparent,),
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.white,
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: widget.list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(value),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Icon(Icons.arrow_drop_down)
      ],
    );
  }
}
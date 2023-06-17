/// Documentation
///
/// This class is responsible to show App button
/// This class has different button types based on a button widget is returned.
/// This is one of the Generic class used across the application

import 'package:flutter/material.dart';

import 'app_text.dart';


enum AppButtonType {
  primary,
  secondary,
  delete,
  cancel,
}

class AppButton extends StatelessWidget {
  final String? title;
  final double? width;
  final double? height;
  final AppButtonType? type;
  final Function? onClicked;

  AppButton(
      {Key? key,
        this.title,
        this.type,
        this.width,
        this.onClicked,
        this.height = 50});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: height,
      width: width,
      child: MaterialButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: () => onClicked!(),
        color: getColorForButton(type: type),
        child: CustomTextWidget(
          text: title ?? '',
          textColor: getTitleColor(type: type),
        ),
      ),
    );
  }

  Color getColorForButton({AppButtonType? type}) {
    switch (type) {
      case AppButtonType.primary:
        return Colors.lightBlue;
      case AppButtonType.secondary:
        return Colors.greenAccent;
      case AppButtonType.cancel:
      case AppButtonType.delete:
        return Colors.white;

      default:
        return Colors.lightBlue;
    }
  }

  Color getTitleColor({AppButtonType? type}) {
    switch (type) {
      case AppButtonType.cancel:
      case AppButtonType.delete:
        return Colors.black;
      default:
        return Colors.white;
    }
  }
}

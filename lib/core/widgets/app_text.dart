/// Documentation
///
/// This class is responsible to show Text widget
/// So that consistency will be maintained throughout the application
/// This is one of the Generic class used across the application
import 'dart:math';
import 'package:flutter/material.dart';

enum TextSizeEnum {
  verySmall,
  small,
  medium,
  webSmallHeading,
  large,
  veryLarge,
  cardTitle
}

class CustomTextWidget extends StatelessWidget {
  final TextSizeEnum? textSizeEnum;
  final String text;
  final Color? textColor;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final int? maxLines;
  final TextStyle? style;

  CustomTextWidget(
      {required this.text,
        this.textSizeEnum = TextSizeEnum.medium,
        this.textColor,
        this.textAlign,
        this.textDecoration,
        this.maxLines,
        this.style});

  @override
  Widget build(BuildContext context) {
    //return Text(text,style: TextStyle(color:textColor ?? Colors.black,fontSize: _fontSize(textSizeEnum: textSizeEnum ?? TextSizeEnum.medium,),fontWeight: textSizeEnum != null && textSizeEnum == TextSizeEnum.veryLarge /*|| textSizeEnum == TextSizeEnum.cardTitle*/ ?  FontWeight.bold : FontWeight.normal,decoration:textDecoration ?? TextDecoration.none ),textAlign: textAlign,maxLines: maxLines ?? 1,);
    return Text(
      text,
      maxLines: maxLines ?? 2,
      style: style ??
          TextStyle(
              color: textColor ?? Colors.black,
              fontSize: _fontSize(
                textSizeEnum: textSizeEnum ?? TextSizeEnum.medium,
              ),
              decoration: textDecoration ?? TextDecoration.none),
      textAlign: textAlign,
      textScaleFactor: ScaleSize.textScaleFactor(context),
    );
  }

  double _fontSize({required TextSizeEnum textSizeEnum}) {
    switch (textSizeEnum) {
      case TextSizeEnum.verySmall:
        return 8.0;
      case TextSizeEnum.small:
        return 10.0;
      case TextSizeEnum.medium:
        return 18.0;
      case TextSizeEnum.webSmallHeading:
        return 16.0;
      case TextSizeEnum.large:
        return 28.0;
      case TextSizeEnum.cardTitle:
        return 20.0;
      case TextSizeEnum.veryLarge:
        return 32.0;
      default:
        return 10;
    }
  }
}

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    // value 2500 is fine
    double val = (width / 2500) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}

import 'package:flutter/material.dart';
import 'package:weather_app/core/widgets/app_text.dart';


enum SectionContainerEnum { simple, withCornerRadius, customChild }

class SectionContainer extends StatelessWidget {
  final String? title;
  final Color? titleColor;
  final double? height;
  final Widget child;
  final Color? backgroundColor;
  final SectionContainerEnum? sectionContainerEnum;
  final Decoration? decoration;

  const SectionContainer(
      {super.key, this.title,
        this.titleColor,
        this.height,
        required this.child,
        this.backgroundColor,
        this.decoration,
        this.sectionContainerEnum});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: backgroundColor,
        elevation: 5,
        child: Column(
          children: [
            title != null
                ? Padding(
              padding: const EdgeInsets.only(top: 8),
              child: CustomTextWidget(
                text: title!,
                textColor: titleColor ?? Colors.black,
                textSizeEnum: TextSizeEnum.large,
              ),
            )
                : Container(),
            const SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: child,
            )
          ],
        ));
  }
}

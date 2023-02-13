import 'package:flutter/material.dart';

import '../../../ui/service_colors.dart';

class SmilerTextButton extends StatelessWidget {
  final String? text;
  final Function()? onTap;
  final Color? color;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;

  const SmilerTextButton(
      {Key? key,
      this.text,
      this.onTap,
      this.color,
      this.textStyle,
      this.padding,
      this.margin,
      this.borderRadius,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? ServiceColors.secondary,
          borderRadius: borderRadius,
        ),
        padding: padding,
        margin: margin,
        width: width ?? double.infinity,
        height: height,
        alignment: Alignment.center,
        child: Text(text ?? "", style: textStyle),
      ),
    );
  }
}

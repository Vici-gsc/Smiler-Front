import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class SvgIconButton extends StatelessWidget {
  final String svgPath;
  final Function()? onTap;
  final double? iconWidth;
  final double? iconHeight;
  final String? label;
  final Color? color;

  const SvgIconButton(
      {Key? key,
      required this.svgPath,
      required this.onTap,
      this.iconWidth,
      this.iconHeight,
      this.label,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          SvgPicture.asset(
            svgPath,
            color: color,
            width: iconWidth,
            height: iconHeight,
          ),
          if (label != null)
            Text(
              label!,
              style: Theme.of(context).textTheme.bodySmall?.apply(color: color),
            ),
        ],
      ),
    );
  }
}

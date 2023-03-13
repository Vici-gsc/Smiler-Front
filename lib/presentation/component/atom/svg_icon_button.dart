import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

/// Svg 파일의 경로를 통해 아이콘 버튼을 보여주는 위젯입니다.
class SvgIconButton extends StatelessWidget {
  /// Svg 파일의 경로입니다.
  final String svgPath;
  final Function()? onTap;
  final double? iconWidth;
  final double? iconHeight;
  final String? label;
  final Color? color;

  /// Svg 파일의 경로를 통해 아이콘 버튼을 보여주는 위젯을 생성합니다.
  ///
  /// [svgPath]는 Svg 파일의 경로입니다. 반드시 null이 아닌 값으로 지정해야 합니다.
  const SvgIconButton(
      {Key? key,
      required this.svgPath,
      this.onTap,
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

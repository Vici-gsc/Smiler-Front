import 'package:flutter/material.dart';

import '../../../ui/service_colors.dart';

/// 모서리가 둥근 다이얼로그입니다.
class RoundDialog extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;

  /// 모서리가 둥근 다이얼로그를 생성합니다.
  const RoundDialog({Key? key, this.child, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: ServiceColors.background,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(10),
        child: child,
      ),
    );
  }
}

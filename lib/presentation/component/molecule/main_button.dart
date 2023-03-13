import 'package:flutter/material.dart';

import '../../../ui/service_colors.dart';
import '../atom/smiler_text_button.dart';

/// 메인 화면에서 각 메뉴에 사용되는 버튼입니다.
class MainButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final bool disabled;

  /// 메인 화면에서 각 메뉴에 사용되는 버튼입니다.
  ///
  /// [disabled]가 true인 경우 버튼의 색이 회색으로 바뀝니다. onTap은 정상 작동합니다.
  const MainButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmilerTextButton(
      onTap: onTap,
      text: text,
      color: disabled ? ServiceColors.secondary : ServiceColors.primaryLight,
      textStyle: Theme.of(context).textTheme.titleSmall,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(15),
      borderRadius: BorderRadius.circular(10),
    );
  }
}

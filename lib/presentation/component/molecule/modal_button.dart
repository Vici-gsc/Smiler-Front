import 'package:flutter/material.dart';

import '../atom/smiler_text_button.dart';

/// 모달에서 사용되는 버튼입니다.
class ModalButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function() onTap;

  /// 모달에서 사용되는 버튼을 생성합니다.
  const ModalButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmilerTextButton(
      onTap: onTap,
      text: text,
      color: color,
      textStyle: Theme.of(context).textTheme.bodyMedium,
      padding: const EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(10),
    );
  }
}

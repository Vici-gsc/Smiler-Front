import 'package:flutter/material.dart';

import '../atom/smiler_text_button.dart';

/// 단어를 표시하는 버튼입니다.
class WordButton extends StatelessWidget {
  final String word;
  final Color color;
  final Function()? onTap;

  /// 단어를 표시하는 버튼을 생성합니다. 주로 단어 퀴즈에서 사용됩니다.
  const WordButton({
    Key? key,
    required this.word,
    required this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmilerTextButton(
      onTap: onTap,
      text: word,
      color: color,
      textStyle: Theme.of(context).textTheme.bodyMedium,
      width: 100,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      borderRadius: BorderRadius.circular(10),
    );
  }
}

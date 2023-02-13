import 'package:flutter/material.dart';

import '../atom/smiler_text_button.dart';

class WordButton extends StatelessWidget {
  final String word;
  final Color color;
  final Function()? onTap;

  const WordButton(
      {Key? key, required this.word, required this.color, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmilerTextButton(
      onTap: onTap,
      text: word,
      color: color,
      textStyle: Theme.of(context).textTheme.bodyMedium,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      borderRadius: BorderRadius.circular(100),
    );
  }
}

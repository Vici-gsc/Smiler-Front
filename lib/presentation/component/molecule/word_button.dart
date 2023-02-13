import 'package:flutter/material.dart';

class WordButton extends StatelessWidget {
  final String word;
  final Color color;
  final Function()? onTap;

  const WordButton(
      {Key? key, required this.word, required this.color, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          word,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}

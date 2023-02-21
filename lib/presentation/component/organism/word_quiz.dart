import 'package:flutter/material.dart';
import 'package:smiler/presentation/component/molecule/word_button.dart';

import '../../../ui/service_colors.dart';

class WordQuiz extends StatelessWidget {
  final List<String> words;
  final Function(String word)? onSelected;
  final int maxRowItemCount;

  const WordQuiz({
    Key? key,
    required this.words,
    this.onSelected,
    this.maxRowItemCount = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int rowCount = (words.length / maxRowItemCount).ceil();
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 30,
      children: [
        for (int i = 0; i < rowCount; i++)
          Wrap(
            spacing: 20,
            children: [
              for (int j = 0; j < maxRowItemCount; j++)
                if (i * maxRowItemCount + j < words.length)
                  WordButton(
                    word: words[i * maxRowItemCount + j],
                    color: ServiceColors.primaryLight,
                    onTap: () => onSelected?.call(
                      words[i * maxRowItemCount + j],
                    ),
                  ),
            ],
          ),
      ],
    );
  }
}

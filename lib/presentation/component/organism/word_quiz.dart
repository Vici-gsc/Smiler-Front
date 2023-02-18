import 'package:flutter/material.dart';
import 'package:smiler/presentation/component/molecule/word_button.dart';

import '../../../ui/service_colors.dart';

class WordQuiz extends StatelessWidget {
  final List<WordQuizItem> items;
  final Function(String word)? onCorrect;
  final Function(String word)? onWrong;
  final int maxRowItemCount;

  const WordQuiz({
    Key? key,
    required this.items,
    this.onCorrect,
    this.onWrong,
    this.maxRowItemCount = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int rowCount = (items.length / maxRowItemCount).ceil();
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
                if (i * maxRowItemCount + j < items.length)
                  WordButton(
                    word: items[i * maxRowItemCount + j].word,
                    color: ServiceColors.primaryLight,
                    onTap: () {
                      items[i * maxRowItemCount + j].isCorrect
                          ? onCorrect?.call(items[i * maxRowItemCount + j].word)
                          : onWrong?.call(items[i * maxRowItemCount + j].word);
                    },
                  ),
            ],
          ),
      ],
    );
  }
}

class WordQuizItem {
  final String word;
  final bool isCorrect;

  const WordQuizItem({
    required this.word,
    this.isCorrect = false,
  });
}

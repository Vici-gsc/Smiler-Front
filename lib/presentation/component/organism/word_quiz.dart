import 'package:flutter/material.dart';
import 'package:smiler/presentation/component/molecule/word_button.dart';

import '../../../ui/service_colors.dart';

/// 여러 단어 선택지를 보여주고, 선택을 받을 수 있는 위젯입니다.
class WordQuiz extends StatelessWidget {
  /// 선택지로 보여줄 단어들입니다.
  final List<String> words;

  /// 단어를 선택했을 때 호출되는 콜백입니다. 선택한 단어가 [word]로 전달됩니다.
  final Function(String word)? onSelected;

  /// 한 줄에 보여줄 단어의 최대 개수입니다.
  final int maxRowItemCount;

  /// 여러 단어 선택지를 보여주고, 선택을 받을 수 있는 위젯을 생성합니다.
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

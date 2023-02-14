import 'package:flutter/material.dart';
import 'package:smiler/presentation/component/organism/scoring_popup.dart';

import '../component/molecule/emotion_image.dart';
import '../component/organism/word_quiz.dart';
import '../component/template/game_template.dart';

class WordScreen extends StatelessWidget {
  const WordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameTemplate(
      headerString: "감정을 맞춰 보아요!",
      onSkip: () {},
      currentQuestionCount: 0,
      correctAnswerCount: 0,
      upperChild:
          const EmotionImage(url: "https://dummyimage.com/600x400/000/fff"),
      lowerChild: Center(
        child: WordQuiz(
          items: const [
            WordQuizItem(word: "행복", isCorrect: true),
            WordQuizItem(word: "슬픔", isCorrect: false),
            WordQuizItem(word: "화남", isCorrect: false),
            WordQuizItem(word: "놀람", isCorrect: false),
            WordQuizItem(word: "불안", isCorrect: false),
          ],
          onCorrect: (word) {
            showDialog(
              context: context,
              builder: (dialogContext) {
                Future.delayed(const Duration(milliseconds: 2000), () {
                  Navigator.of(dialogContext).pop();
                });
                return const ScoringPopup(isCorrect: true);
              },
              barrierDismissible: false,
            );
          },
          onWrong: (word) {
            showDialog(
              context: context,
              builder: (dialogContext) {
                Future.delayed(const Duration(milliseconds: 2000), () {
                  Navigator.of(dialogContext).pop();
                });
                return const ScoringPopup(
                    isCorrect: false, description: "정답은 '행복'입니다.");
              },
              barrierDismissible: false,
            );
          },
        ),
      ),
    );
  }
}

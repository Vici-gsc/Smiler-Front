import 'package:flutter/material.dart';

import '../component/molecule/emotion_image.dart';
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
      lowerChild: const SizedBox(),
    );
  }
}

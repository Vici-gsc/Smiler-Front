import 'package:flutter/material.dart';

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
    );
  }
}

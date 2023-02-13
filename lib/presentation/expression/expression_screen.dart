import 'package:flutter/material.dart';

import '../component/template/game_template.dart';

class ExpressionScreen extends StatelessWidget {
  const ExpressionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameTemplate(
      headerString: "표정을 지어 보아요!",
      onSkip: () {},
      currentQuestionCount: 0,
      correctAnswerCount: 0,
    );
  }
}

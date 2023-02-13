import 'package:flutter/material.dart';
import 'package:smiler/presentation/component/template/game_template.dart';

class ImitatingScreen extends StatelessWidget {
  const ImitatingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameTemplate(
      headerString: "표정을 따라해 보아요!",
      onSkip: () {},
      currentQuestionCount: 0,
      correctAnswerCount: 0,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smiler/ui/service_colors.dart';

import '../atom/round_dialog.dart';

class ScoringPopup extends StatelessWidget {
  static const String correctMessage = "정답입니다!";
  static const String wrongMessage = "틀렸습니다...";
  static const String correctAnimationPath = "asset/animation/correct.json";
  static const String wrongAnimationPath = "asset/animation/wrong.json";

  final bool isCorrect;
  final String? description;

  const ScoringPopup({Key? key, required this.isCorrect, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundDialog(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform(
            transform: Matrix4.translationValues(0, 10, 0),
            child: Lottie.asset(
              isCorrect ? correctAnimationPath : wrongAnimationPath,
              width: 170,
              height: 170,
              repeat: false,
            ),
          ),
          Text(
            isCorrect ? correctMessage : wrongMessage,
            style: Theme.of(context).textTheme.titleMedium!.apply(
                color: isCorrect
                    ? ServiceColors.correctGreen
                    : ServiceColors.wrongRed),
            textAlign: TextAlign.center,
          ),
          if (description != null) const SizedBox(height: 5),
          if (description != null)
            Text(
              description!,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }

  void show(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.of(context).pop();
    });
    showDialog(
      context: context,
      builder: (context) => this,
      barrierDismissible: false,
    );
  }
}

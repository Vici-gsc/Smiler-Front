import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smiler/ui/service_colors.dart';

import '../atom/round_dialog.dart';

/// 문제의 정답/오답을 알려주는 팝업 위젯입니다.
class ScoringPopup extends StatelessWidget {
  static const String _correctMessage = "정답입니다!";
  static const String _wrongMessage = "틀렸습니다...";
  static const String _correctAnimationPath = "asset/animation/correct.json";
  static const String _wrongAnimationPath = "asset/animation/wrong.json";

  /// 문제의 정답 여부입니다.
  final bool isCorrect;

  /// 문제의 정답/오답에 대한 설명입니다.
  final String? description;

  /// 문제의 정답/오답을 알려주는 팝업 위젯을 생성합니다.
  ///
  /// 보통 [show] 메서드와 함께 사용합니다.
  const ScoringPopup({
    Key? key,
    required this.isCorrect,
    this.description,
  }) : super(key: key);

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
              isCorrect ? _correctAnimationPath : _wrongAnimationPath,
              width: 170,
              height: 170,
              repeat: false,
            ),
          ),
          Text(
            isCorrect ? _correctMessage : _wrongMessage,
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

  /// 팝업을 화면에 표시합니다.
  ///
  /// 기존 [showDialog] 함수와는 달리 3초 후 자동으로 팝업이 닫힙니다. 사용에 유의해주세요.
  void show(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.of(context).pop();
    });
    showDialog(
      context: context,
      builder: (context) => this,
      barrierDismissible: false,
    );
  }
}

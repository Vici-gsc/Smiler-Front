import 'package:flutter/material.dart';
import 'package:smiler/presentation/component/organism/game_footer.dart';
import 'package:smiler/presentation/component/organism/smiler_modal.dart';

class GameTemplate extends StatelessWidget {
  final String headerString;
  final Widget? upperChild;
  final Widget? lowerChild;
  final Function() onSkip;
  final int currentQuestionCount;
  final int correctAnswerCount;

  const GameTemplate(
      {Key? key,
      required this.headerString,
      this.upperChild,
      this.lowerChild,
      required this.onSkip,
      required this.currentQuestionCount,
      required this.correctAnswerCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  headerString,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: upperChild ?? const SizedBox(),
            ),
            Expanded(
              flex: 2,
              child: lowerChild ?? const SizedBox(),
            ),
            GameFooter(
              onExitButtonTapped: () {
                showDialog(
                  context: context,
                  builder: (dialogContext) => SmilerModal(
                      title:
                          "지금까지 $currentQuestionCount문제 중 $correctAnswerCount문제를 맞췄어요.",
                      description: "정말로 연습을 그만할까요?",
                      positiveButtonLabel: "그만하기",
                      negativeButtonLabel: "계속하기",
                      onPositiveButtonTap: () {
                        Navigator.of(dialogContext).pop();
                        Navigator.of(context).pop();
                      },
                      onNegativeButtonTap: () {
                        Navigator.of(dialogContext).pop();
                      }),
                );
              },
              onSkipButtonTapped: () {
                showDialog(
                  context: context,
                  builder: (dialogContext) => SmilerModal(
                      title: "정말로 이 문제를 스킵할까요?",
                      description: "스킵한 문제는 다시 풀 수 없어요.",
                      positiveButtonLabel: "스킵하기",
                      negativeButtonLabel: "마저풀기",
                      onPositiveButtonTap: () {
                        Navigator.of(dialogContext).pop();
                        onSkip();
                      },
                      onNegativeButtonTap: () {
                        Navigator.of(dialogContext).pop();
                      }),
                );
              },
              currentQuestionCount: currentQuestionCount,
            ),
          ],
        ),
      ),
    );
  }
}

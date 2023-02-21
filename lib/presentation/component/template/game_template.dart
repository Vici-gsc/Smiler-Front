import 'package:flutter/material.dart';
import 'package:smiler/presentation/component/molecule/alert_flush_bar.dart';
import 'package:smiler/presentation/component/organism/game_footer.dart';
import 'package:smiler/presentation/component/organism/yes_no_dialog.dart';

import '../../../ui/service_colors.dart';

/// 게임 화면의 템플릿 위젯입니다.
class GameTemplate extends StatelessWidget {
  /// 헤더에 표시할 문자열입니다.
  final String headerString;

  /// 위쪽에 표시할 위젯입니다.
  final Widget? upperChild;

  /// 아래쪽에 표시할 위젯입니다.
  final Widget? lowerChild;

  /// 스킵 버튼을 눌렀을 때 호출되는 콜백입니다.
  final Function()? onSkip;

  /// 종료 버튼을 눌렀을 때 호출되는 콜백입니다.
  final Function()? onExit;

  /// 현재 진행 중인 문제의 개수입니다.
  final int currentQuestionCount;

  /// 현재까지 맞춘 문제의 개수입니다.
  final int correctAnswerCount;

  /// 로딩 중인지 여부입니다.
  final bool isLoading;

  /// 게임 화면의 템플릿 위젯을 생성합니다.
  ///
  /// [GameTemplate]는 템플릿이므로, [Scaffold]를 포함하고 있는 점을 확인해주세요.
  /// [upperChild]와 [lowerChild]는 null인 경우 빈 화면을 보여줍니다.
  /// [onSkip]과 [onExit]은 각각의 팝업에서 확인을 눌렀을 때에만 호출됩니다.
  /// [isLoading]이 true일 경우 화면에 로딩 화면이 덮입니다.
  const GameTemplate(
      {Key? key,
      required this.headerString,
      this.upperChild,
      this.lowerChild,
      this.onSkip,
      this.onExit,
      required this.currentQuestionCount,
      required this.correctAnswerCount,
      required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: ServiceColors.background,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
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
                  const Divider(
                    color: ServiceColors.primaryLight,
                    height: 0,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
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
                    onExitButtonTapped: () => _showExitDialog(context),
                    onSkipButtonTapped: () => _showSkipDialog(context),
                    currentQuestionCount: currentQuestionCount,
                  ),
                ],
              ),
              if (isLoading)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(child: CircularProgressIndicator()),
                ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        _showExitDialog(context);
        return false;
      },
    );
  }

  /// 종료 팝업을 띄웁니다.
  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => YesNoDialog(
          title: "지금까지 $currentQuestionCount문제 중 $correctAnswerCount문제를 맞췄어요.",
          description: "정말로 연습을 그만할까요?",
          positiveButtonLabel: "그만하기",
          negativeButtonLabel: "계속하기",
          onPositiveButtonTap: () {
            Navigator.of(dialogContext).pop();
            Navigator.of(context).pop();
            onExit?.call();
          },
          onNegativeButtonTap: () {
            Navigator.of(dialogContext).pop();
          }),
    );
  }

  /// 스킵 팝업을 띄웁니다.
  void _showSkipDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => YesNoDialog(
          title: "정말로 이 문제를 스킵할까요?",
          description: "스킵한 문제는 다시 풀 수 없어요.",
          positiveButtonLabel: "스킵하기",
          negativeButtonLabel: "마저풀기",
          onPositiveButtonTap: () {
            Navigator.of(dialogContext).pop();
            AlertFlushBar("문제가 스킵되었습니다.").show(context);
            onSkip?.call();
          },
          onNegativeButtonTap: () {
            AlertFlushBar("연습을 종료하였습니다.").show(context);
            Navigator.of(dialogContext).pop();
          }),
    );
  }
}

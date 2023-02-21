import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smiler/presentation/component/organism/camera_widget.dart';
import 'package:smiler/presentation/expression/expression_view_model.dart';

import '../component/molecule/alert_flush_bar.dart';
import '../component/organism/scoring_popup.dart';
import '../component/template/game_template.dart';

class ExpressionScreen extends StatefulWidget {
  const ExpressionScreen({Key? key}) : super(key: key);

  @override
  State<ExpressionScreen> createState() => _ExpressionScreenState();
}

class _ExpressionScreenState extends State<ExpressionScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ExpressionViewModel>();
    return GameTemplate(
      headerString: "표정을 지어 보아요!",
      onSkip: () => viewModel.load(),
      onExit: () => viewModel.exit(),
      currentQuestionCount: viewModel.state.questionCount,
      correctAnswerCount: viewModel.state.correctAnswerCount,
      isLoading: viewModel.state.isLoading,
      upperChild: Center(
        child: Text(
          viewModel.state.answerEmotion?.koreanName ?? "",
          style:
              Theme.of(context).textTheme.titleMedium!.apply(fontSizeDelta: 20),
        ),
      ),
      lowerChild: CameraWidget(
        camera: viewModel.camera!,
        onCaptured: (path) {
          // 이미지로 정답 확인
          viewModel.checkAnswer(
            path,
            onFinished: (isCorrect) =>
                ScoringPopup(isCorrect: isCorrect).show(context),
            onError: (error) => AlertFlushBar(error).show(context),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // 진행 상황 초기화
    context.read<ExpressionViewModel>().load(isInit: true);
  }
}

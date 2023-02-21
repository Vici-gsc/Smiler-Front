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

    void checkAnswer(String? imagePath) => viewModel.checkAnswer(
          imagePath,
          onFinished: (isCorrect) =>
              ScoringPopup(isCorrect: isCorrect).show(context),
          onError: (error) => AlertFlushBar(error).show(context),
        );

    return GameTemplate(
      headerString: "표정을 지어 보아요!",
      onSkip: () => checkAnswer(null),
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
        onCaptured: (path) => checkAnswer(path),
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

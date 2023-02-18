import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smiler/presentation/component/organism/camera_widget.dart';
import 'package:smiler/presentation/component/template/game_template.dart';
import 'package:smiler/presentation/imitating/imitating_view_model.dart';

import '../component/molecule/emotion_image.dart';
import '../component/organism/scoring_popup.dart';

class ImitatingScreen extends StatefulWidget {
  const ImitatingScreen({Key? key}) : super(key: key);

  @override
  State<ImitatingScreen> createState() => _ImitatingScreenState();
}

class _ImitatingScreenState extends State<ImitatingScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ImitatingViewModel>();
    return GameTemplate(
      headerString: "표정을 따라해 보아요!",
      onSkip: () => viewModel.load(),
      onExit: () => viewModel.exit(),
      currentQuestionCount: viewModel.state.questionCount,
      correctAnswerCount: viewModel.state.correctAnswerCount,
      isLoading: viewModel.state.isLoading,
      upperChild: EmotionImage(
        url: viewModel.state.imageUrl,
        emotionName: viewModel.state.answerEmotion?.koreanName,
      ),
      lowerChild: CameraWidget(
        camera: viewModel.camera!,
        onCaptured: (path) => viewModel.checkAnswer(
          path,
          () => const ScoringPopup(isCorrect: true).show(context),
          () => const ScoringPopup(isCorrect: false).show(context),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<ImitatingViewModel>().load();
  }
}

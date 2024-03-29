import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:smiler/presentation/component/organism/camera_widget.dart';
import 'package:smiler/presentation/component/template/game_template.dart';
import 'package:smiler/presentation/imitating/imitating_view_model.dart';

import '../component/molecule/alert_flush_bar.dart';
import '../component/molecule/emotion_image.dart';
import '../component/organism/scoring_popup.dart';
import '../main/main_screen.dart';

class ImitatingScreen extends StatefulWidget {
  const ImitatingScreen({Key? key}) : super(key: key);

  @override
  State<ImitatingScreen> createState() => _ImitatingScreenState();
}

class _ImitatingScreenState extends State<ImitatingScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ImitatingViewModel>();

    void checkAnswer(String? imagePath) => viewModel.checkAnswer(
          imagePath,
          onFinished: (isCorrect, userAnswer, isSkipped) {
            ScoringPopup(
              isCorrect: isCorrect,
              description:
                  isSkipped ? "문제를 스킵했습니다." : "인식된 표정은 '$userAnswer'입니다.",
            ).show(context);
          },
          onError: (error) => AlertFlushBar(error).show(context),
        );

    return GameTemplate(
      headerString: "표정을 따라해 보아요!",
      headerDescriptionString: "카메라에서 30cm 정도 떨어져 촬영해주세요.",
      onSkip: () => checkAnswer(null),
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
        onCaptured: (path) => checkAnswer(path),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // 진행 상황 초기화
    context.read<ImitatingViewModel>().load(
        isInit: true,
        onError: (error) {
          // 에러 발생 시 메인 화면으로 이동 및 에러 플러시바 출력
          final mainRoute = MaterialPageRoute(builder: (context) {
            SchedulerBinding.instance.addPostFrameCallback(
              (_) => AlertFlushBar(error).show(context),
            );
            return const MainScreen();
          });

          // 위젯이 바인딩된 이후에 메인 화면으로 이동
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => Navigator.of(context).pushAndRemoveUntil(
              mainRoute,
              (route) => false,
            ),
          );
        });
  }
}

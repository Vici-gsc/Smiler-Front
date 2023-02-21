import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:smiler/presentation/component/organism/scoring_popup.dart';
import 'package:smiler/presentation/main/main_screen.dart';
import 'package:smiler/presentation/word/word_view_model.dart';

import '../component/molecule/alert_flush_bar.dart';
import '../component/molecule/emotion_image.dart';
import '../component/organism/word_quiz.dart';
import '../component/template/game_template.dart';

class WordScreen extends StatefulWidget {
  const WordScreen({Key? key}) : super(key: key);

  @override
  State<WordScreen> createState() => _WordScreenState();
}

class _WordScreenState extends State<WordScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<WordViewModel>();

    void checkAnswer(String? word) => viewModel.checkAnswer(
          word,
          onFinished: (isCorrect) =>
              ScoringPopup(isCorrect: isCorrect).show(context),
          onError: (error) => AlertFlushBar(error).show(context),
        );

    return GameTemplate(
      headerString: "감정을 맞춰 보아요!",
      onSkip: () => checkAnswer(null),
      onExit: () => viewModel.exit(),
      currentQuestionCount: viewModel.state.questionCount,
      correctAnswerCount: viewModel.state.correctAnswerCount,
      isLoading: viewModel.state.isLoading,
      upperChild: EmotionImage(url: viewModel.state.imageUrl),
      lowerChild: Center(
        child: WordQuiz(
          words: List.from(
            viewModel.state.emotionChoices.map((emotion) => emotion.koreanName),
          ),
          onSelected: (word) => checkAnswer(word),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // 진행 상황 초기화
    context.read<WordViewModel>().load(
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

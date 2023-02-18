import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/model/emotion.dart';
import 'expression_state.dart';

class ExpressionViewModel with ChangeNotifier {
  final CameraDescription? camera;

  ExpressionViewModel(this.camera);

  ExpressionState _state = ExpressionState(
    questionCount: -1,
    correctAnswerCount: 0,
    answerEmotion: null,
    isLoading: false,
  );

  ExpressionState get state => _state;

  void exit() {
    _state = ExpressionState(
      questionCount: -1,
      correctAnswerCount: 0,
      answerEmotion: null,
      isLoading: false,
    );
  }

  void load({bool isInit = false}) {
    _state = _state.copyWith(
      questionCount: _state.questionCount + 1,
      answerEmotion: Emotion.getRandomEmotion(except: _state.answerEmotion),
      isLoading: false,
    );

    if (!isInit) {
      notifyListeners();
    }
  }

  void checkAnswer(
      String imagePath, Function() onCorrect, Function() onWrong) async {
    _state = _state.copyWith(
      isLoading: true,
    );
    notifyListeners();

    // TODO: 이미지 분석 후 정답 여부 판단
    await Future.delayed(const Duration(microseconds: 1000));
    bool isCorrect = true;
    // ==========

    if (isCorrect) {
      _state = _state.copyWith(
        correctAnswerCount: _state.correctAnswerCount + 1,
      );
      onCorrect();
    } else {
      onWrong();
    }

    load();
  }
}

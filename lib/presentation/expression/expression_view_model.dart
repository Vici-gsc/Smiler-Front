import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/model/emotion.dart';
import '../../domain/usecase/score_expression_use_case.dart';
import 'expression_state.dart';

class ExpressionViewModel with ChangeNotifier {
  final CameraDescription? camera;
  final ScoreExpressionUseCase _scoreUseCase;

  ExpressionViewModel(this.camera, this._scoreUseCase);

  ExpressionState _state = ExpressionState(
    questionCount: -1,
    correctAnswerCount: 0,
    answerEmotion: null,
    isLoading: true,
  );

  ExpressionState get state => _state;

  void exit() {
    _state = ExpressionState(
      questionCount: -1,
      correctAnswerCount: 0,
      answerEmotion: null,
      isLoading: true,
    );
  }

  void load({bool isInit = false}) {
    _state = _state.copyWith(
      questionCount: _state.questionCount + 1,
      answerEmotion: Emotion.getRandomEmotion(
        exceptions: _state.answerEmotion != null ? [_state.answerEmotion!] : [],
      ),
      isLoading: false,
    );

    if (!isInit) {
      notifyListeners();
    }
  }

  void checkAnswer(
    String imagePath, {
    Function(bool isCorrect)? onFinished,
    Function(String error)? onError,
  }) async {
    _state = _state.copyWith(
      isLoading: true,
    );
    notifyListeners();

    final result =
        await _scoreUseCase.execute(_state.answerEmotion!, imagePath);

    result.when(
      success: (scoringResult) {
        if (scoringResult.isCorrect) {
          _state = _state.copyWith(
            correctAnswerCount: _state.correctAnswerCount + 1,
          );
        }
        onFinished?.call(scoringResult.isCorrect);
        load();
      },
      failure: (error) {
        _state = _state.copyWith(
          isLoading: false,
        );
        onError?.call(error);
      },
    );
  }
}

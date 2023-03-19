import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/model/emotion.dart';
import '../../domain/usecase/score_expression_use_case.dart';
import 'expression_screen.dart';
import 'expression_state.dart';

/// [ExpressionScreen]에서 사용하는 view model입니다.
class ExpressionViewModel with ChangeNotifier {
  final CameraDescription? camera;
  final ScoreExpressionUseCase _scoreUseCase;

  ExpressionViewModel(this.camera, this._scoreUseCase);

  ExpressionState _state = ExpressionState(
    // 맞거나 틀리거나 스킵한 문제의 수
    questionCount: -1,
    // 맞춘 문제의 수
    correctAnswerCount: 0,
    // 정답 감정
    answerEmotion: null,
    // 로딩 중인지 여부
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
    String? imagePath, {
    Function(bool isCorrect, String userAnswer, bool isSkipped)? onFinished,
    Function(String error)? onError,
  }) async {
    // 로딩 시작
    _state = _state.copyWith(
      isLoading: true,
    );
    notifyListeners();

    // 결과 불러오기
    final result = await _scoreUseCase.execute(
      _state.answerEmotion!,
      imagePath,
    );

    result.when(
      success: (scoringResult) {
        if (scoringResult.isCorrect) {
          // 정답시 정답 수 증가
          _state = _state.copyWith(
            correctAnswerCount: _state.correctAnswerCount + 1,
          );
        }
        onFinished?.call(
          scoringResult.isCorrect,
          scoringResult.userAnswer.koreanName,
          scoringResult.userAnswer == Emotion.skip,
        );
        load();
        // load에서 로딩이 종료되므로, 여기서 로딩 종료를 하지 않음
      },
      failure: (error) {
        // 로딩 종료
        _state = _state.copyWith(
          isLoading: false,
        );
        notifyListeners();
        onError?.call(error);
      },
    );
  }
}

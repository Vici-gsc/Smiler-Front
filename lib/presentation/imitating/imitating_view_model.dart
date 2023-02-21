import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/model/emotion.dart';
import '../../domain/usecase/get_photo_use_case.dart';
import '../../domain/usecase/score_imitation_use_case.dart';
import 'imitating_state.dart';

class ImitatingViewModel with ChangeNotifier {
  final CameraDescription? camera;
  final GetPhotoUseCase _getPhotoUseCase;
  final ScoreImitationUseCase _scoreUseCase;

  ImitatingViewModel(this.camera, this._getPhotoUseCase, this._scoreUseCase);

  ImitatingState _state = ImitatingState(
    questionCount: -1,
    correctAnswerCount: 0,
    answerEmotion: null,
    imageUrl: null,
    isLoading: true,
  );

  ImitatingState get state => _state;

  void exit() {
    _state = ImitatingState(
      questionCount: -1,
      correctAnswerCount: 0,
      answerEmotion: null,
      imageUrl: null,
      isLoading: true,
    );
  }

  void load({
    bool isInit = false,
    Function(String error)? onError,
  }) async {
    _state = _state.copyWith(
      isLoading: true,
    );

    if (!isInit) {
      notifyListeners();
    }

    final answer = Emotion.getRandomEmotion(
      exceptions: _state.answerEmotion != null ? [_state.answerEmotion!] : [],
    );
    final result = await _getPhotoUseCase.execute(answer);

    result.when(
      success: (imageUrl) {
        _state = _state.copyWith(
          questionCount: _state.questionCount + 1,
          answerEmotion: answer,
          imageUrl: imageUrl,
          isLoading: false,
        );
        notifyListeners();
      },
      failure: (error) {
        _state = _state.copyWith(
          isLoading: false,
        );
        notifyListeners();
        onError?.call(error);
      },
    );
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

    final result = await _scoreUseCase.execute(
      _state.answerEmotion!,
      imagePath,
    );

    result.when(
      success: (scoringResult) {
        if (scoringResult.isCorrect) {
          _state = _state.copyWith(
            correctAnswerCount: _state.correctAnswerCount + 1,
          );
        }
        onFinished?.call(scoringResult.isCorrect);
        load(onError: onError);
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

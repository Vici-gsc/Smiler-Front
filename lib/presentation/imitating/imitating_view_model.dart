import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/model/emotion.dart';
import '../../domain/usecase/get_photo_use_case.dart';
import '../../domain/usecase/score_imitation_use_case.dart';
import 'imitating_screen.dart';
import 'imitating_state.dart';

/// [ImitatingScreen]에서 사용하는 view model입니다.
class ImitatingViewModel with ChangeNotifier {
  final CameraDescription? camera;
  final GetPhotoUseCase _getPhotoUseCase;
  final ScoreImitationUseCase _scoreUseCase;

  ImitatingViewModel(this.camera, this._getPhotoUseCase, this._scoreUseCase);

  ImitatingState _state = ImitatingState(
    // 맞거나 틀리거나 스킵한 문제의 수
    questionCount: -1,
    // 맞춘 문제의 수
    correctAnswerCount: 0,
    // 정답 감정
    answerEmotion: null,
    // 현재 이미지 URL
    imageUrl: null,
    // 로딩 중인지 여부
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
    // 로딩 시작
    _state = _state.copyWith(
      isLoading: true,
    );

    if (!isInit) {
      notifyListeners();
    }

    // 결과 불러오기
    final answer = Emotion.getRandomEmotion(
      exceptions: _state.answerEmotion != null ? [_state.answerEmotion!] : [],
    );
    final result = await _getPhotoUseCase.execute(answer);

    result.when(
      success: (imageUrl) {
        // 값 반영 및 로딩 종료
        _state = _state.copyWith(
          questionCount: _state.questionCount + 1,
          answerEmotion: answer,
          imageUrl: imageUrl,
          isLoading: false,
        );
        notifyListeners();
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

  void checkAnswer(
    String? imagePath, {
    Function(bool isCorrect)? onFinished,
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
        onFinished?.call(scoringResult.isCorrect);
        load(onError: onError);
        // load에서 로딩이 다시 시작 후 종료되므로, 여기서 로딩 종료를 하지 않음
      },
      failure: (error) {
        // 로딩 종료
        _state = _state.copyWith(
          isLoading: false,
        );
        onError?.call(error);
      },
    );
  }
}

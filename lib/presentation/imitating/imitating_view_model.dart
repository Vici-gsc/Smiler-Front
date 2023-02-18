import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/model/emotion.dart';
import 'imitating_state.dart';

class ImitatingViewModel with ChangeNotifier {
  final CameraDescription? camera;

  ImitatingViewModel(this.camera);

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

  void load() async {
    _state = _state.copyWith(
      isLoading: true,
    );
    notifyListeners();

    // TODO: 서버에서 이미지 불러오기
    final answer = Emotion.getRandomEmotion(except: _state.answerEmotion);
    await Future.delayed(const Duration(microseconds: 1000));
    // ==========

    _state = _state.copyWith(
      questionCount: _state.questionCount + 1,
      answerEmotion: answer,
      imageUrl: 'https://dummyimage.com/600x400/000/fff&text=Dummy+Image',
      isLoading: false,
    );
    notifyListeners();
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

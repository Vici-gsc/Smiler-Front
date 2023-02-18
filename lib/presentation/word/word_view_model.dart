import 'package:flutter/cupertino.dart';
import 'package:smiler/presentation/word/word_state.dart';

import '../../domain/model/emotion.dart';

class WordViewModel with ChangeNotifier {
  WordViewModel();

  WordState _state = WordState(
    questionCount: 0,
    correctAnswerCount: 0,
    answerEmotion: null,
    emotionChoices: [],
    imageUrl: null,
    isLoading: true,
  );

  WordState get state => _state;

  void exit() {
    _state = WordState(
      questionCount: 0,
      correctAnswerCount: 0,
      answerEmotion: null,
      emotionChoices: [],
      imageUrl: null,
      isLoading: true,
    );
  }

  void load({bool isInit = false}) async {
    _state = _state.copyWith(
      isLoading: true,
    );

    if (!isInit) {
      notifyListeners();
    }

    // TODO: 서버에서 이미지 불러오기
    await Future.delayed(const Duration(microseconds: 1000));
    final answer = Emotion.getRandomEmotion(except: _state.answerEmotion);
    // ==========

    _state = _state.copyWith(
      questionCount: _state.questionCount + 1,
      answerEmotion: answer,
      emotionChoices: [
        answer,
        Emotion.getRandomEmotion(),
        Emotion.getRandomEmotion(),
        Emotion.getRandomEmotion(),
        Emotion.getRandomEmotion(),
      ],
      imageUrl: 'https://dummyimage.com/600x400/000/fff&text=Dummy+Image',
      isLoading: false,
    );
    notifyListeners();
  }

  void addCorrectAnswerCount() {
    _state = _state.copyWith(
      correctAnswerCount: _state.correctAnswerCount + 1,
    );
  }
}

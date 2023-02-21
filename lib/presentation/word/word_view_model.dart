import 'package:flutter/cupertino.dart';
import 'package:smiler/presentation/word/word_state.dart';

import '../../domain/model/emotion.dart';
import '../../domain/usecase/get_word_question_use_case.dart';
import '../../domain/usecase/score_word_question_use_case.dart';

class WordViewModel with ChangeNotifier {
  static const choiceCount = 5;
  final GetWordQuestionUseCase _getQuestionUseCase;
  final ScoreWordQuestionUseCase _scoreUseCase;

  WordViewModel(this._getQuestionUseCase, this._scoreUseCase);

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

  void load({bool isInit = false, Function(String error)? onError}) async {
    _state = _state.copyWith(
      isLoading: true,
    );

    if (!isInit) {
      notifyListeners();
    }

    final result = await _getQuestionUseCase.execute();

    result.when(
      success: (question) {
        List<Emotion> choices = [question.correctEmotion];
        for (int i = 0; i < choiceCount - 1; i++) {
          choices.add(Emotion.getRandomEmotion(exceptions: choices));
        }

        _state = _state.copyWith(
          questionCount: _state.questionCount + 1,
          answerEmotion: question.correctEmotion,
          emotionChoices: choices,
          imageUrl: 'https://dummyimage.com/600x400/000/fff&text=Dummy+Image',
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
    String selectedWord, {
    Function(bool isCorrect)? onFinished,
    Function(String error)? onError,
  }) async {
    _state = _state.copyWith(
      isLoading: true,
    );
    notifyListeners();

    final result = await _scoreUseCase.execute(
      _state.answerEmotion!,
      Emotion.fromKoreanName(selectedWord),
    );

    result.when(
      success: (isCorrect) {
        if (isCorrect) {
          _state = _state.copyWith(
            correctAnswerCount: _state.correctAnswerCount + 1,
          );
        }
        onFinished?.call(isCorrect);
        load(onError: onError);
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
}

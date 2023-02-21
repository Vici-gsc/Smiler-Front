import 'package:flutter/cupertino.dart';
import 'package:smiler/presentation/word/word_state.dart';

import '../../domain/model/emotion.dart';
import '../../domain/usecase/get_word_question_use_case.dart';
import '../../domain/usecase/score_word_question_use_case.dart';
import 'word_screen.dart';

/// [WordScreen]에서 사용하는 view model입니다.
class WordViewModel with ChangeNotifier {
  static const choiceCount = 5;
  final GetWordQuestionUseCase _getQuestionUseCase;
  final ScoreWordQuestionUseCase _scoreUseCase;

  WordViewModel(this._getQuestionUseCase, this._scoreUseCase);

  WordState _state = WordState(
    questionCount: 0,
    // 맞거나 틀리거나 스킵한 문제의 수
    correctAnswerCount: 0,
    // 맞춘 문제의 수
    answerEmotion: null,
    // 정답 감정
    emotionChoices: [],
    // 감정 선택지
    imageUrl: null,
    // 현재 이미지 URL
    isLoading: true, // 로딩 중인지 여부
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
    // 로딩 시작
    _state = _state.copyWith(
      isLoading: true,
    );

    if (!isInit) {
      notifyListeners();
    }

    // 결과 불러오기
    final result = await _getQuestionUseCase.execute();

    result.when(
      success: (question) {
        // 값 반영 및 로딩 종료
        _state = _state.copyWith(
          questionCount: _state.questionCount + 1,
          answerEmotion: question.correctEmotion,
          emotionChoices: question.emotionList,
          imageUrl: question.imagePath,
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
    String selectedWord, {
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
      Emotion.fromKoreanName(selectedWord),
    );

    result.when(
      success: (isCorrect) {
        if (isCorrect) {
          // 정답시 정답 수 증가
          _state = _state.copyWith(
            correctAnswerCount: _state.correctAnswerCount + 1,
          );
        }
        onFinished?.call(isCorrect);
        load(onError: onError);
        // load에서 로딩이 다시 시작 후 종료되므로, 여기서 로딩 종료를 하지 않음
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

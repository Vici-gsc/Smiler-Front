import 'package:flutter/cupertino.dart';
import 'package:smiler/domain/usecase/delete_histories_use_case.dart';
import 'package:smiler/domain/usecase/get_histories_use_case.dart';
import 'package:smiler/presentation/statistics/statistics_state.dart';

import '../../domain/model/emotion.dart';
import '../../domain/model/history.dart';
import '../../domain/model/question_type.dart';

/// [StatisticsScreen]에서 사용하는 view model입니다.
class StatisticsViewModel with ChangeNotifier {
  static const statLimit = 1000;

  final GetHistoriesUseCase _getHistoriesUseCase;
  final DeleteHistoriesUseCase _deleteHistoriesUseCase;

  StatisticsViewModel(this._getHistoriesUseCase, this._deleteHistoriesUseCase);

  StatisticsState _state = StatisticsState(
    // 전체 문제 수
    totalQuestionCount: 0,
    // 전체 정답 수
    totalCorrectAnswerCount: 0,
    // 감정별 정답률
    correctRateByEmotion: {},
    // 문제 유형별 정답률
    correctRateByQuestionType: {},
    // 가장 정답률이 낮은 감정
    worstEmotion: null,
    // 가장 정답률이 높은 문제 유형
    bestQuestionType: null,
    // 로딩 중인지 여부
    isLoading: true,
  );

  StatisticsState get state => _state;

  void exit() {
    _state = StatisticsState(
      totalQuestionCount: 0,
      totalCorrectAnswerCount: 0,
      correctRateByEmotion: {},
      correctRateByQuestionType: {},
      worstEmotion: null,
      bestQuestionType: null,
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
    final result = await _getHistoriesUseCase.execute(statLimit);

    result.when(
      success: (histories) {
        // 값 반영 및 로딩 종료
        final stats = _StatCalcResult.fromHistories(histories);
        _state = _state.copyWith(
          totalQuestionCount: stats.totalQuestionCount,
          totalCorrectAnswerCount: stats.totalCorrectAnswerCount,
          correctRateByEmotion: stats.correctRateByEmotion,
          correctRateByQuestionType: stats.correctRateByQuestionType,
          worstEmotion: stats.worstEmotion,
          bestQuestionType: stats.bestQuestionType,
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

  void delete({
    Function()? onSuccess,
    Function(String error)? onError,
  }) async {
    // 로딩 시작
    _state = _state.copyWith(
      isLoading: true,
    );
    notifyListeners();

    final result = await _deleteHistoriesUseCase.execute();
    result.when(success: (_) {
      onSuccess?.call();
      load(onError: onError);
      // load에서 로딩이 다시 시작 후 종료되므로, 여기서 로딩 종료를 하지 않음
    }, failure: (error) {
      // 로딩 종료
      _state = _state.copyWith(
        isLoading: false,
      );
      notifyListeners();
      onError?.call(error);
    });
  }
}

/// 통계 수치들을 계산하는 클래스
class _StatCalcResult {
  final int totalQuestionCount;
  final int totalCorrectAnswerCount;
  final Map<Emotion, double> correctRateByEmotion;
  final Map<QuestionType, double> correctRateByQuestionType;
  final Emotion? worstEmotion;
  final QuestionType? bestQuestionType;

  _StatCalcResult({
    required this.totalQuestionCount,
    required this.totalCorrectAnswerCount,
    required this.correctRateByEmotion,
    required this.correctRateByQuestionType,
    required this.worstEmotion,
    required this.bestQuestionType,
  });

  /// [histories]를 기반으로 통계 수치들을 계산합니다.
  factory _StatCalcResult.fromHistories(List<History> histories) {
    final int totalQuestionCount = histories.length;
    int totalCorrectAnswerCount = 0;
    final Map<Emotion, int> correctCountByEmotion = {};
    final Map<Emotion, int> totalCountByEmotion = {};
    final Map<QuestionType, int> correctCountByQuestionType = {};
    final Map<QuestionType, int> totalCountByQuestionType = {};

    // history들을 돌면서 수치 계산
    for (final history in histories) {
      totalCountByEmotion[history.correctAnswer] =
          (totalCountByEmotion[history.correctAnswer] ?? 0) + 1;
      totalCountByQuestionType[history.questionType] =
          (totalCountByQuestionType[history.questionType] ?? 0) + 1;

      // 정답인 경우
      if (history.isCorrect) {
        totalCorrectAnswerCount++;
        correctCountByEmotion[history.correctAnswer] =
            (correctCountByEmotion[history.correctAnswer] ?? 0) + 1;
        correctCountByQuestionType[history.questionType] =
            (correctCountByQuestionType[history.questionType] ?? 0) + 1;
      }
    }

    // 정답률 계산
    final Map<Emotion, double> correctRateByEmotion = {};
    final Map<QuestionType, double> correctRateByQuestionType = {};

    for (final emotion in Emotion.values) {
      if (emotion == Emotion.skip) continue;
      final correctCount = correctCountByEmotion[emotion] ?? 0;
      final totalCount = totalCountByEmotion[emotion] ?? 1;
      correctRateByEmotion[emotion] = 100 * correctCount / totalCount;
    }

    for (final questionType in QuestionType.values) {
      final correctCount = correctCountByQuestionType[questionType] ?? 0;
      final totalCount = totalCountByQuestionType[questionType] ?? 1;
      correctRateByQuestionType[questionType] = 100 * correctCount / totalCount;
    }

    return _StatCalcResult(
      totalQuestionCount: totalQuestionCount,
      totalCorrectAnswerCount: totalCorrectAnswerCount,
      correctRateByEmotion: correctRateByEmotion,
      correctRateByQuestionType: correctRateByQuestionType,
      worstEmotion: correctRateByEmotion.entries
          .reduce((prev, curr) => prev.value < curr.value ? prev : curr)
          .key,
      bestQuestionType: correctRateByQuestionType.entries
          .reduce((prev, curr) => prev.value > curr.value ? prev : curr)
          .key,
    );
  }
}

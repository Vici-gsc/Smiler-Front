import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/emotion.dart';
import '../../domain/model/question_type.dart';

part 'statistics_state.freezed.dart';

/// [StatisticsScreen]에서 사용하는 state입니다.
@freezed
class StatisticsState with _$StatisticsState {
  /// [StatisticsScreen]에서 사용하는 state를 생성합니다.
  ///
  /// [totalQuestionCount]와 [totalCorrectAnswerCount]는 전체 문제 수와 전체 정답 수입니다.
  /// [correctRateByEmotion]와 [correctRateByQuestionType]은 감정, 문제 유형에 대한 정답률입니다.
  /// [worstEmotion]은 가장 정답률이 낮은 감정, [bestQuestionType]은 가장 정답률이 높은 문제 유형입니다.
  /// [isLoading]은 현재 로딩 중인지 여부를 나타냅니다.
  factory StatisticsState({
    required int totalQuestionCount,
    required int totalCorrectAnswerCount,
    required Map<Emotion, double> correctRateByEmotion,
    required Map<QuestionType, double> correctRateByQuestionType,
    required Emotion? worstEmotion,
    required QuestionType? bestQuestionType,
    required bool isLoading,
  }) = _StatisticsState;
}

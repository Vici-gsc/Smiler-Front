import 'package:freezed_annotation/freezed_annotation.dart';

import 'emotion.dart';

part 'scoring_result.freezed.dart';
part 'scoring_result.g.dart';

/// 채점 결과입니다.
@freezed
class ScoringResult with _$ScoringResult {
  /// 채점 결과를 생성합니다. [isCorrect]는 정답 여부, [userAnswer]는 사용자의 답입니다.
  factory ScoringResult({
    required bool isCorrect,
    required Emotion userAnswer,
  }) = _ScoringResult;

  factory ScoringResult.fromJson(Map<String, dynamic> json) =>
      _$ScoringResultFromJson(json);
}
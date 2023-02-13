import 'package:freezed_annotation/freezed_annotation.dart';

import 'emotion.dart';
part 'scoring_result.freezed.dart';
part 'scoring_result.g.dart';

@freezed
class ScoringResult with _$ScoringResult {
  factory ScoringResult({
    required bool isCorrect,
    required Emotion userAnswer,
  }) = _ScoringResult;

  factory ScoringResult.fromJson(Map<String, dynamic> json) =>
      _$ScoringResultFromJson(json);
}
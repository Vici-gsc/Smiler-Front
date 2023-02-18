import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/emotion.dart';

part 'expression_state.freezed.dart';

@freezed
class ExpressionState with _$ExpressionState {
  factory ExpressionState({
    required int questionCount,
    required int correctAnswerCount,
    required Emotion? answerEmotion,
    required bool isLoading,
  }) = _ExpressionState;
}

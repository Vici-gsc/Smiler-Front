import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/emotion.dart';
import 'expression_screen.dart';

part 'expression_state.freezed.dart';

/// [ExpressionScreen]에서 사용하는 state입니다.
@freezed
class ExpressionState with _$ExpressionState {
  /// [ExpressionScreen]에서 사용하는 state를 생성합니다.
  ///
  /// [questionCount]와 [correctAnswerCount]는 각각 현재까지의 문제 수와 정답 수입니다.
  /// [answerEmotion]은 현재 문제의 정답 감정이며, [isLoading]은 현재 로딩 중인지 여부를 나타냅니다.
  factory ExpressionState({
    required int questionCount,
    required int correctAnswerCount,
    required Emotion? answerEmotion,
    required bool isLoading,
  }) = _ExpressionState;
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/emotion.dart';

part 'word_state.freezed.dart';

/// [WordScreen]에서 사용하는 state입니다.
@freezed
class WordState with _$WordState {
  /// [WordScreen]에서 사용하는 state를 생성합니다.
  ///
  /// [questionCount]와 [correctAnswerCount]는 각각 현재까지의 문제 수와 정답 수입니다.
  /// [answerEmotion]은 현재 문제의 정답 감정이며, [emotionChoices]는 표시될 감정 선택지입니다.
  /// [imageUrl]은 현재 문제의 이미지 URL입니다. [isLoading]은 현재 로딩 중인지 여부를 나타냅니다.
  factory WordState({
    required int questionCount,
    required int correctAnswerCount,
    required Emotion? answerEmotion,
    required List<Emotion> emotionChoices,
    required String? imageUrl,
    required bool isLoading,
  }) = _WordState;
}

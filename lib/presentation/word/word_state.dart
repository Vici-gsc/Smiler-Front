import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/emotion.dart';

part 'word_state.freezed.dart';

@freezed
class WordState with _$WordState {
  factory WordState({
    required int questionCount,
    required int correctAnswerCount,
    required Emotion? answerEmotion,
    required List<Emotion> emotionChoices,
    required String? imageUrl,
    required bool isLoading,
  }) = _WordState;
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/emotion.dart';

part 'imitating_state.freezed.dart';

@freezed
class ImitatingState with _$ImitatingState {
  factory ImitatingState({
    required int questionCount,
    required int correctAnswerCount,
    required Emotion? answerEmotion,
    required String? imageUrl,
    required bool isLoading,
  }) = _ImitatingState;
}

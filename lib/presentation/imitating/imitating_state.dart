import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/emotion.dart';
import 'imitating_screen.dart';

part 'imitating_state.freezed.dart';

/// [ImitatingScreen]에서 사용하는 state입니다.
@freezed
class ImitatingState with _$ImitatingState {
  /// [ImitatingScreen]에서 사용하는 state를 생성합니다.
  ///
  /// [questionCount]와 [correctAnswerCount]는 각각 현재까지의 문제 수와 정답 수입니다.
  /// [answerEmotion]은 현재 문제의 정답 감정이며, [imageUrl]은 현재 문제의 이미지 URL입니다.
  /// [isLoading]은 현재 로딩 중인지 여부를 나타냅니다.
  factory ImitatingState({
    required int questionCount,
    required int correctAnswerCount,
    required Emotion? answerEmotion,
    required String? imageUrl,
    required bool isLoading,
  }) = _ImitatingState;
}

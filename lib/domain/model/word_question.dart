import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smiler/domain/model/emotion.dart';

part 'word_question.freezed.dart';

/// 단어 퀴즈입니다.
@freezed
class WordQuestion with _$WordQuestion {
  /// 단어 퀴즈를 생성합니다.
  ///
  /// [imagePath]는 이미지의 경로입니다.
  /// [emotionList]는 감정 선택지이며, 이중 [correctEmotion]이 정답입니다.
  factory WordQuestion({
    required String imagePath,
    required List<Emotion> emotionList,
    required Emotion correctEmotion,
  }) = _WordQuestion;
}

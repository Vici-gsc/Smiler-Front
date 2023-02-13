import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smiler/domain/model/emotion.dart';

part 'word_question.freezed.dart';

@freezed
class WordQuestion with _$WordQuestion {
  factory WordQuestion( {
    required String imagePath,
    required List<Emotion> emotionList,
    required Emotion correctEmotion,
  }) = _WordQuestion;
}
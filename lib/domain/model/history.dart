import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smiler/domain/model/emotion.dart';
import 'package:smiler/domain/model/question_type.dart';

part 'history.freezed.dart';

@freezed
class History with _$History {
  factory History({
    required int? key,
    required QuestionType questionType,
    required Emotion correctAnswer,
    required Emotion userAnswer,
    required bool isCorrect,
    required DateTime? solvedTime,
  }) = _History;
}

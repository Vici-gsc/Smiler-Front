import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smiler/domain/model/emotion.dart';
import 'package:smiler/domain/model/question_type.dart';

part 'history.freezed.dart';

/// 풀이 이력입니다.
@freezed
class History with _$History {
  /// 풀이 이력을 생성합니다.
  ///
  /// [key]는 풀이 이력의 고유 키입니다. DB에 저장된 풀이 이력의 경우에만 값이 있습니다.
  /// [questionType]은 풀이 이력의 문제 유형입니다.
  /// [correctAnswer]는 해당 문제의 정답, [userAnswer]는 사용자가 입력한 답입니다.
  /// [isCorrect]는 정답 여부입니다.
  /// [solvedTime]은 풀이 이력이 생성된 시간입니다. DB에 저장된 풀이 이력의 경우에만 값이 있습니다.
  factory History({
    required int? key,
    required QuestionType questionType,
    required Emotion correctAnswer,
    required Emotion userAnswer,
    required bool isCorrect,
    required DateTime? solvedTime,
  }) = _History;
}

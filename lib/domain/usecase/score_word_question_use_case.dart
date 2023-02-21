import 'package:smiler/domain/repository/history_repository.dart';

import '../../data/source/model/result.dart';
import '../model/emotion.dart';
import '../model/question_type.dart';

/// 감정 단어 맞추기 문제를 채점하는 UseCase입니다.
class ScoreWordQuestionUseCase {
  /// 감정 단어 맞추기 문제의 타입입니다.
  static const questionType = QuestionType.wordChoice;

  final HistoryRepository _historyRepository;

  /// UseCase를 생성합니다.
  ScoreWordQuestionUseCase(this._historyRepository);

  /// UseCase를 실행합니다. [userChoice]가 [answer]와 일치하는지 확인합니다.
  Future<Result<bool>> execute(Emotion answer, Emotion userChoice) async {
    final isCorrect = answer == userChoice;
    _historyRepository.addHistory(
      questionType.index,
      answer.index,
      userChoice.index,
      isCorrect,
    );
    return Result.success(isCorrect);
  }
}

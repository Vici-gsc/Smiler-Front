import 'package:smiler/domain/repository/history_repository.dart';

import '../../data/source/model/result.dart';
import '../model/emotion.dart';
import '../model/question_type.dart';

class ScoreWordQuestionUseCase {
  static const questionType = QuestionType.wordChoice;
  final HistoryRepository _historyRepository;

  ScoreWordQuestionUseCase(this._historyRepository);

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

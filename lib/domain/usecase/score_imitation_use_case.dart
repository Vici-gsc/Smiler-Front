import 'package:smiler/domain/repository/imitation_repository.dart';

import '../../data/source/model/result.dart';
import '../model/emotion.dart';
import '../model/question_type.dart';
import '../model/scoring_result.dart';
import '../repository/history_repository.dart';

class ScoreImitationUseCase {
  static const questionType = QuestionType.faceImitating;

  final ImitationRepository _imitationRepository;
  final HistoryRepository _historyRepository;

  ScoreImitationUseCase(this._imitationRepository, this._historyRepository);

  Future<Result<ScoringResult>> execute(
      Emotion answer, String imagePath) async {
    final apiResult = await _imitationRepository.isCorrectImitation(
        answer.englishName, imagePath);

    return apiResult.when(
      success: (scoringResult) {
        _historyRepository.addHistory(
          questionType.index,
          answer.index,
          scoringResult.userAnswer.index,
          scoringResult.isCorrect,
        );
        return Result.success(scoringResult);
      },
      failure: (error) => Result.failure(error),
    );
  }
}

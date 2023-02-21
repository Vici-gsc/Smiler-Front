import 'package:smiler/domain/model/question_type.dart';
import 'package:smiler/domain/model/scoring_result.dart';
import 'package:smiler/domain/repository/expression_repository.dart';

import '../../data/source/model/result.dart';
import '../model/emotion.dart';
import '../repository/history_repository.dart';

class ScoreExpressionUseCase {
  static const questionType = QuestionType.faceExpression;

  final ExpressionRepository _expressionRepository;
  final HistoryRepository _historyRepository;

  ScoreExpressionUseCase(this._expressionRepository, this._historyRepository);

  Future<Result<ScoringResult>> execute(
      Emotion answer, String imagePath) async {
    final apiResult = await _expressionRepository.isCorrectExpression(
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

import 'package:smiler/domain/model/question_type.dart';
import 'package:smiler/domain/model/scoring_result.dart';
import 'package:smiler/domain/repository/expression_repository.dart';

import '../../data/source/model/result.dart';
import '../model/emotion.dart';
import '../repository/history_repository.dart';

/// 표정 지어보기 문제를 채점하는 UseCase입니다.
class ScoreExpressionUseCase {
  /// 표정 지어보기 문제의 타입입니다.
  static const questionType = QuestionType.faceExpression;

  final ExpressionRepository _expressionRepository;
  final HistoryRepository _historyRepository;

  /// UseCase를 생성합니다.
  ScoreExpressionUseCase(this._expressionRepository, this._historyRepository);

  /// UseCase를 실행합니다. [imagePath]의 사진이 [answer]의 감정과 일치하는지 확인합니다.
  ///
  /// [imagePath]가 null이면 오답 처리됩니다. (문제 스킵시 사용)
  Future<Result<ScoringResult>> execute(
      Emotion answer, String? imagePath) async {
    final Result<ScoringResult> apiResult;

    if (imagePath == null) {
      apiResult = Result.success(
        ScoringResult(isCorrect: false, userAnswer: Emotion.skip),
      );
    } else {
      apiResult = await _expressionRepository.isCorrectExpression(
        answer.englishName,
        imagePath,
      );
    }

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

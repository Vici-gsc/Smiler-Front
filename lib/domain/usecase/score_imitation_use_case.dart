import 'package:smiler/domain/repository/imitation_repository.dart';

import '../../data/source/model/result.dart';
import '../model/emotion.dart';
import '../model/question_type.dart';
import '../model/scoring_result.dart';
import '../repository/history_repository.dart';

/// 표정 따라하기 문제를 채점하는 UseCase입니다.
class ScoreImitationUseCase {
  /// 표정 따라하기 문제의 타입입니다.
  static const questionType = QuestionType.faceImitating;

  final ImitationRepository _imitationRepository;
  final HistoryRepository _historyRepository;

  /// UseCase를 생성합니다.
  ScoreImitationUseCase(this._imitationRepository, this._historyRepository);

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
      apiResult = await _imitationRepository.isCorrectImitation(
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

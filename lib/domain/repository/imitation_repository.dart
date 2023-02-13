import '../../data/source/model/result.dart';
import '../model/scoring_result.dart';

abstract class ImitationRepository {
  Future<Result<String>> getEmotionImage(String emotionName);

  Future<Result<ScoringResult>> isCorrectImitation(
      String answerEmotionName, String imagePath);
}

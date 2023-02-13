import '../../data/source/model/result.dart';
import '../model/emotion.dart';
import '../model/scoring_result.dart';

abstract class ExpressionRepository {
  Future<Result<ScoringResult>> isCorrectExpression(
      String answerEmotionName, String imagePath);
}

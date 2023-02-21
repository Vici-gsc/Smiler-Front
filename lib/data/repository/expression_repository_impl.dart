import 'package:smiler/data/source/model/result.dart';
import 'package:smiler/domain/model/scoring_result.dart';
import 'package:smiler/domain/repository/expression_repository.dart';

import '../source/api.dart';

class ExpressionRepositoryImpl implements ExpressionRepository {
  final Api api;

  ExpressionRepositoryImpl(this.api);

  @override
  Future<Result<ScoringResult>> isCorrectExpression(
      String answerEmotionName, String imagePath) async {
    final result = await api.postFile(
      "/expression?feeling=$answerEmotionName",
      imagePath,
    );

    return result.when(
      success: (data) {
        final scoringResult = ScoringResult.fromJson(data);
        return Result.success(scoringResult);
      },
      failure: (error) => Result.failure(error),
    );
  }
}

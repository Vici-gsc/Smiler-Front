import 'package:smiler/data/source/model/result.dart';
import 'package:smiler/domain/model/scoring_result.dart';
import 'package:smiler/domain/repository/expression_repository.dart';

import '../../domain/model/emotion.dart';
import '../source/api.dart';

/// [ExpressionRepository]의 구현체입니다.
class ExpressionRepositoryImpl implements ExpressionRepository {
  final Api _api;

  /// [ExpressionRepositoryImpl] 클래스를 생성합니다.
  ExpressionRepositoryImpl(this._api);

  /// [imagePath]에 있는 이미지를 서버로 전송하여 [answerEmotionName]과 일치하는지 확인합니다.
  ///
  /// [answerEmotionName]은 미리 백엔드, 딥러닝 파트와 협의된 영단어를 사용합니다.
  /// 자세한 내용은 [Emotion] 클래스를 참고하세요.
  @override
  Future<Result<ScoringResult>> isCorrectExpression(
      String answerEmotionName, String imagePath) async {
    final result = await _api.postFile(
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

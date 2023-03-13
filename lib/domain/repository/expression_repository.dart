import '../../data/source/model/result.dart';
import '../../domain/model/emotion.dart';
import '../model/scoring_result.dart';

/// 표정 지어보기 문제와 관련된 데이터를 가져오는 Repository입니다.
abstract class ExpressionRepository {
  /// [imagePath]의 이미지가 [answerEmotionName]과 일치하는지 확인합니다.
  ///
  /// [answerEmotionName]은 미리 백엔드, 딥러닝 파트와 협의된 영단어를 사용합니다.
  /// 자세한 내용은 [Emotion] 클래스를 참고하세요.
  Future<Result<ScoringResult>> isCorrectExpression(
      String answerEmotionName, String imagePath);
}

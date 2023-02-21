import 'package:smiler/data/source/model/result.dart';
import 'package:smiler/domain/model/scoring_result.dart';
import 'package:smiler/domain/repository/imitation_repository.dart';

import '../../domain/model/emotion.dart';
import '../source/api.dart';

/// [ImitationRepository]의 구현체입니다.
class ImitationRepositoryImpl implements ImitationRepository {
  final Api _api;

  /// [ImitationRepositoryImpl] 클래스를 생성합니다.
  ImitationRepositoryImpl(this._api);

  /// [emotionName]에 해당하는 감정 이미지를 가져옵니다.
  ///
  /// [emotionName]은 미리 백엔드, 딥러닝 파트와 협의된 영단어를 사용합니다.
  /// 자세한 내용은 [Emotion] 클래스를 참고하세요.
  @override
  Future<Result<String>> getEmotionImage(String emotionName) async {
    final result = await _api.get(
      "/imitation/photo?feeling=$emotionName",
    );

    return result.when(
      success: (data) {
        final imageUrl = data["image"];
        return Result.success(imageUrl);
      },
      failure: (error) => Result.failure(error),
    );
  }

  /// [imagePath]에 해당하는 이미지가 [answerEmotionName]에 해당하는 감정과 일치하는지 확인합니다.
  ///
  /// [answerEmotionName]은 미리 백엔드, 딥러닝 파트와 협의된 영단어를 사용합니다.
  /// 자세한 내용은 [Emotion] 클래스를 참고하세요.
  @override
  Future<Result<ScoringResult>> isCorrectImitation(
      String answerEmotionName, String imagePath) async {
    final result = await _api.postFile(
      "/imitation/face?feeling=$answerEmotionName",
      imagePath,
    );

    return result.when(
      success: (data) {
        final scoringResult = ScoringResult(
          isCorrect: data["isCorrect"],
          userAnswer: Emotion.fromEnglishName(data["userAnswer"]),
        );
        return Result.success(scoringResult);
      },
      failure: (error) => Result.failure(error),
    );
  }
}

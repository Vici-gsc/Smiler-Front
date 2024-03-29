import 'package:smiler/data/source/model/result.dart';
import 'package:smiler/domain/model/word_question.dart';
import 'package:smiler/domain/repository/word_repository.dart';

import '../../domain/model/emotion.dart';
import '../source/api.dart';

/// [WordRepository]의 구현체
class WordRepositoryImpl implements WordRepository {
  final Api _api;

  /// [WordRepositoryImpl] 클래스를 생성합니다.
  WordRepositoryImpl(this._api);

  /// 단어 문제를 가져옵니다.
  @override
  Future<Result<WordQuestion>> getWordQuestion() async {
    final result = await _api.get(
      "/word",
    );

    return result.when(
      success: (data) {
        final List<Emotion> emotions = [];

        for (final String emotionName in data["feeling_list"]) {
          try {
            emotions.add(Emotion.fromEnglishName(emotionName));
          } catch (e) {
            return Result.failure("(서버 오류) 알 수 없는 감정이 수신되었습니다. ($emotionName)");
          }
        }

        final wordQuestion = WordQuestion(
          imagePath: data["photo_url"],
          emotionList: emotions,
          correctEmotion: Emotion.fromEnglishName(data["answer"]),
        );
        return Result.success(wordQuestion);
      },
      failure: (error) => Result.failure(error),
    );
  }
}

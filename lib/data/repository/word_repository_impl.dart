import 'package:smiler/data/source/model/result.dart';
import 'package:smiler/domain/model/word_question.dart';
import 'package:smiler/domain/repository/word_repository.dart';

import '../../domain/model/emotion.dart';
import '../source/api.dart';

class WordRepositoryImpl implements WordRepository {
  final Api api;

  WordRepositoryImpl(this.api);

  @override
  Future<Result<WordQuestion>> getWordQuestion() async {
    final result = await api.get(
      "/word",
    );

    return result.when(
      success: (data) {
        final wordQuestion = WordQuestion(
          imagePath: data["image"],
          emotionList: data["emotionList"]
              .map<Emotion>((e) => Emotion.fromEnglishName(e))
              .toList(),
          correctEmotion: Emotion.fromEnglishName(data["correctEmotion"]),
        );
        return Result.success(wordQuestion);
      },
      failure: (error) => Result.failure(error),
    );
  }
}

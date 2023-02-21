import 'package:mockito/annotations.dart';
import "package:mockito/mockito.dart";
import "package:smiler/data/repository/word_repository_impl.dart";
import "package:smiler/data/source/api.dart";
import "package:smiler/data/source/model/result.dart";
import "package:smiler/domain/model/emotion.dart";
import "package:smiler/domain/model/word_question.dart";
import "package:test/test.dart";

@GenerateNiceMocks([MockSpec<Api>()])
import 'api.mocks.dart';

main() {
  group("getWordQuestion", () {
    test("요청 성공시 단어 퀴즈를 반환한다.", () async {
      final api = MockApi();
      const path = "/word";

      when(api.get(path)).thenAnswer(
        (_) async => const Result.success({
          "image": "SOME_IMAGE",
          "emotionList": ["natural", "happy", "hurt", "embarrass", "angry"],
          "correctEmotion": "hurt",
        }),
      );

      final repository = WordRepositoryImpl(api);
      final result = await repository.getWordQuestion();

      expect(result, isA<Result<WordQuestion>>());

      result.when(success: (value) {
        expect(value, isA<WordQuestion>());
        expect(value.imagePath, isA<String>());
        expect(value.emotionList, isA<List<Emotion>>());
        expect(value.emotionList, hasLength(5));
        expect(value.correctEmotion, isA<Emotion>());
      }, failure: (error) {
        fail("요청 실패");
      });
    });

    test("요청 실패시 에러를 반환한다.", () async {
      final api = MockApi();
      const path = "/word";

      when(api.get(path)).thenAnswer(
        (_) async => const Result.failure("요청 실패"),
      );

      final repository = WordRepositoryImpl(api);
      final result = await repository.getWordQuestion();

      expect(result, isA<Result<WordQuestion>>());

      result.when(success: (value) {
        fail("요청 성공");
      }, failure: (error) {
        expect(error, isA<String>());
      });
    });
  });
}

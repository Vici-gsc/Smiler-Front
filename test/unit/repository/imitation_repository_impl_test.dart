import 'package:mockito/annotations.dart';
import "package:mockito/mockito.dart";
import "package:smiler/data/repository/imitation_repository_impl.dart";
import "package:smiler/data/source/api.dart";
import "package:smiler/data/source/model/result.dart";
import "package:smiler/domain/model/emotion.dart";
import "package:smiler/domain/model/scoring_result.dart";
import "package:test/test.dart";

@GenerateNiceMocks([MockSpec<Api>()])
import 'imitation_repository_impl_test.mocks.dart';

main() {
  group("getEmotionImage", () {
    test("요청 성공시 해당 이미지를 반환한다.", () async {
      final api = MockApi();
      const path = "/imitation/photo?feeling=embarrass";

      when(api.get(path)).thenAnswer(
            (_) async => const Result.success({"photo_url": "SOME_IMAGE"}),
      );

      final repository = ImitationRepositoryImpl(api);
      final result = await repository.getEmotionImage("embarrass");

      expect(result, isA<Result<String>>());

      result.when(success: (value) {
        expect(value, isA<String>());
      }, failure: (error) {
        fail("요청 실패");
      });
    });

    test("요청 실패시 에러를 반환한다.", () async {
      final api = MockApi();
      const path = "/imitation/photo?feeling=embarrass";

      when(api.get(path)).thenAnswer(
        (_) async => const Result.failure("요청 실패"),
      );

      final repository = ImitationRepositoryImpl(api);
      final result = await repository.getEmotionImage("embarrass");

      expect(result, isA<Result<String>>());

      result.when(success: (value) {
        fail("요청 성공");
      }, failure: (error) {
        expect(error, isA<String>());
      });
    });
  });

  group("isCorrectImitation", () {
    test("정답 제출 / 요청 성공시 해당 결과를 반환한다.", () async {
      final api = MockApi();
      const path = "/imitation/face?feeling=happy";

      when(api.postFile(path, any, "file")).thenAnswer(
        (_) async => const Result.success({
          "match": true,
          "recognize": "happy",
        }),
      );

      final repository = ImitationRepositoryImpl(api);
      final result = await repository.isCorrectImitation("happy", "SOME_IMAGE");

      expect(result, isA<Result<ScoringResult>>());

      result.when(success: (value) {
        expect(value, isA<ScoringResult>());
        expect(value.isCorrect, true);
        expect(value.userAnswer, Emotion.happy);
      }, failure: (error) {
        fail("요청 실패");
      });
    });

    test("오답 제출 / 요청 성공시 해당 결과를 반환한다.", () async {
      final api = MockApi();
      const path = "/imitation/face?feeling=happy";

      when(api.postFile(path, "SOME_IMAGE", "file")).thenAnswer(
        (_) async => const Result.success({
          "match": false,
          "recognize": "sad",
        }),
      );

      final repository = ImitationRepositoryImpl(api);
      final result = await repository.isCorrectImitation("happy", "SOME_IMAGE");

      expect(result, isA<Result<ScoringResult>>());

      result.when(success: (value) {
        expect(value, isA<ScoringResult>());
        expect(value.isCorrect, false);
        expect(value.userAnswer, Emotion.sad);
      }, failure: (error) {
        fail("요청 실패");
      });
    });

    test("정답 제출 / 요청 실패시 에러를 반환한다.", () async {
      final api = MockApi();
      const path = "/imitation/face?feeling=happy";

      when(api.postFile(path, "SOME_IMAGE", "file")).thenAnswer(
        (_) async => const Result.failure("요청 실패"),
      );

      final repository = ImitationRepositoryImpl(api);
      final result = await repository.isCorrectImitation("happy", "SOME_IMAGE");

      expect(result, isA<Result<ScoringResult>>());

      result.when(success: (value) {
        fail("요청 성공");
      }, failure: (error) {
        expect(error, isA<String>());
      });
    });

    test("오답 제출 / 요청 실패시 에러를 반환한다.", () async {
      final api = MockApi();
      const path = "/imitation/face?feeling=happy";

      when(api.postFile(path, "SOME_IMAGE", "file")).thenAnswer(
        (_) async => const Result.failure("요청 실패"),
      );

      final repository = ImitationRepositoryImpl(api);
      final result = await repository.isCorrectImitation("happy", "SOME_IMAGE");

      expect(result, isA<Result<ScoringResult>>());

      result.when(success: (value) {
        fail("요청 성공");
      }, failure: (error) {
        expect(error, isA<String>());
      });
    });
  });
}

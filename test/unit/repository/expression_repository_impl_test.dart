import 'package:mockito/annotations.dart';
import "package:mockito/mockito.dart";
import "package:smiler/data/repository/expression_repository_impl.dart";
import "package:smiler/data/source/api.dart";
import "package:smiler/data/source/model/result.dart";
import "package:smiler/domain/model/emotion.dart";
import "package:smiler/domain/model/scoring_result.dart";
import "package:test/test.dart";

@GenerateNiceMocks([MockSpec<Api>()])
import 'api.mocks.dart';

main() {
  group("isCorrectExpression", () {
    test("정답 제출 / 요청 성공시 해당 결과를 반환한다.", () async {
      final api = MockApi();
      const path = "/expression?feeling=happy";

      when(api.postFile(path, any)).thenAnswer(
        (_) async => const Result.success({
          "isCorrect": true,
          "userAnswer": "happy",
        }),
      );

      final repository = ExpressionRepositoryImpl(api);
      final result =
          await repository.isCorrectExpression("happy", "SOME_IMAGE");

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
      const path = "/expression?feeling=happy";

      when(api.postFile(path, "SOME_IMAGE")).thenAnswer(
        (_) async => const Result.success({
          "isCorrect": false,
          "userAnswer": "sad",
        }),
      );

      final repository = ExpressionRepositoryImpl(api);
      final result =
          await repository.isCorrectExpression("happy", "SOME_IMAGE");

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
      const path = "/expression?feeling=happy";

      when(api.postFile(path, "SOME_IMAGE")).thenAnswer(
        (_) async => const Result.failure("요청 실패"),
      );

      final repository = ExpressionRepositoryImpl(api);
      final result =
          await repository.isCorrectExpression("happy", "SOME_IMAGE");

      expect(result, isA<Result<ScoringResult>>());

      result.when(success: (value) {
        fail("요청 성공");
      }, failure: (error) {
        expect(error, "요청 실패");
      });
    });

    test("오답 제출 / 요청 실패시 에러를 반환한다.", () async {
      final api = MockApi();
      const path = "/expression?feeling=happy";

      when(api.postFile(path, "SOME_IMAGE")).thenAnswer(
        (_) async => const Result.failure("요청 실패"),
      );

      final repository = ExpressionRepositoryImpl(api);
      final result =
          await repository.isCorrectExpression("happy", "SOME_IMAGE");

      expect(result, isA<Result<ScoringResult>>());

      result.when(success: (value) {
        fail("요청 성공");
      }, failure: (error) {
        expect(error, "요청 실패");
      });
    });
  });
}

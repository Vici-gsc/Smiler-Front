import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smiler/data/repository/expression_repository_impl.dart';
import 'package:smiler/data/repository/history_repository_impl.dart';
import 'package:smiler/data/source/model/result.dart';
import 'package:smiler/domain/model/emotion.dart';
import 'package:smiler/domain/model/scoring_result.dart';
import 'package:smiler/domain/usecase/score_expression_use_case.dart';
import 'package:test/test.dart';

@GenerateNiceMocks([
  MockSpec<ExpressionRepositoryImpl>(),
  MockSpec<HistoryRepositoryImpl>(),
])
import 'score_expression_use_case_test.mocks.dart';

main() {
  group("getScoringResult", () {
    test("요청 성공시 채점 결과를 가져온다. - 정답인 경우", () async {
      final historyRepository = MockHistoryRepositoryImpl();
      when(historyRepository.addHistory(any, any, any, any))
          .thenAnswer((_) async => const Result.success(null));

      final repository = MockExpressionRepositoryImpl();
      final useCase = ScoreExpressionUseCase(repository, historyRepository);

      when(repository.isCorrectExpression(any, any)).thenAnswer(
        (_) async => Result.success(
          ScoringResult(isCorrect: true, userAnswer: Emotion.natural),
        ),
      );

      final result = await useCase.execute(Emotion.natural, "SOME_IMAGE");

      expect(result, isA<Result<ScoringResult>>());

      result.when(success: (value) {
        expect(value, isA<ScoringResult>());
        expect(value.isCorrect, true);
        expect(value.userAnswer, isA<Emotion>());
      }, failure: (error) {
        fail("요청 실패");
      });
    });

    test("요청 성공시 채점 결과를 가져온다. - 오답인 경우", () async {
      final historyRepository = MockHistoryRepositoryImpl();
      when(historyRepository.addHistory(any, any, any, any))
          .thenAnswer((_) async => const Result.success(null));

      final repository = MockExpressionRepositoryImpl();
      final useCase = ScoreExpressionUseCase(repository, historyRepository);

      when(repository.isCorrectExpression(any, any)).thenAnswer(
        (_) async => Result.success(
          ScoringResult(isCorrect: false, userAnswer: Emotion.happy),
        ),
      );

      final result = await useCase.execute(Emotion.natural, "SOME_IMAGE");

      expect(result, isA<Result<ScoringResult>>());

      result.when(success: (value) {
        expect(value, isA<ScoringResult>());
        expect(value.isCorrect, false);
        expect(value.userAnswer, isA<Emotion>());
      }, failure: (error) {
        fail("요청 실패");
      });
    });

    test("요청 실패시 에러를 반환한다.", () async {
      final historyRepository = MockHistoryRepositoryImpl();
      when(historyRepository.addHistory(any, any, any, any))
          .thenAnswer((_) async => const Result.success(null));

      final repository = MockExpressionRepositoryImpl();
      final useCase = ScoreExpressionUseCase(repository, historyRepository);

      when(repository.isCorrectExpression(any, any))
          .thenAnswer((_) async => const Result.failure("요청 실패"));

      final result = await useCase.execute(Emotion.natural, "SOME_IMAGE");

      expect(result, isA<Result<ScoringResult>>());

      result.when(success: (value) {
        fail("요청 성공");
      }, failure: (error) {
        expect(error, isA<String>());
      });
    });

    test("DB에 기록을 쓸 수 없어도 정상적으로 채점 결과를 가져온다.", () async {
      final historyRepository = MockHistoryRepositoryImpl();
      when(historyRepository.addHistory(any, any, any, any))
          .thenAnswer((_) async => const Result.failure("DB에 기록을 쓸 수 없습니다."));

      final repository = MockExpressionRepositoryImpl();
      final useCase = ScoreExpressionUseCase(repository, historyRepository);

      when(repository.isCorrectExpression(any, any)).thenAnswer(
        (_) async => Result.success(
          ScoringResult(isCorrect: true, userAnswer: Emotion.natural),
        ),
      );

      final result = await useCase.execute(Emotion.natural, "SOME_IMAGE");

      expect(result, isA<Result<ScoringResult>>());

      result.when(success: (value) {
        expect(value, isA<ScoringResult>());
        expect(value.isCorrect, true);
        expect(value.userAnswer, isA<Emotion>());
      }, failure: (error) {
        fail("요청 실패");
      });
    });
  });
}

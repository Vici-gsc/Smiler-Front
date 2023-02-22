import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smiler/data/repository/history_repository_impl.dart';
import 'package:smiler/data/source/model/result.dart';
import 'package:smiler/domain/model/emotion.dart';
import 'package:smiler/domain/usecase/score_word_question_use_case.dart';
import 'package:test/test.dart';

@GenerateNiceMocks([
  MockSpec<HistoryRepositoryImpl>(),
])
import 'score_word_question_use_case_test.mocks.dart';

main() {
  group("getIsCorrect", () {
    test("정답인 경우", () async {
      final historyRepository = MockHistoryRepositoryImpl();
      when(historyRepository.addHistory(any, any, any, any))
          .thenAnswer((_) async => const Result.success(null));

      final useCase = ScoreWordQuestionUseCase(historyRepository);
      final result = await useCase.execute(Emotion.natural, Emotion.natural);

      expect(result, isA<Result<bool>>());

      result.when(success: (value) {
        expect(value, true);
      }, failure: (error) {
        fail("요청 실패");
      });
    });

    test("오답인 경우", () async {
      final historyRepository = MockHistoryRepositoryImpl();
      when(historyRepository.addHistory(any, any, any, any))
          .thenAnswer((_) async => const Result.success(null));

      final useCase = ScoreWordQuestionUseCase(historyRepository);
      final result = await useCase.execute(Emotion.natural, Emotion.happy);

      expect(result, isA<Result<bool>>());

      result.when(success: (value) {
        expect(value, false);
      }, failure: (error) {
        fail("요청 실패");
      });
    });

    test("DB에 기록을 쓸 수 없어도 정상적으로 채점 결과를 가져온다.", () async {
      final historyRepository = MockHistoryRepositoryImpl();
      when(historyRepository.addHistory(any, any, any, any))
          .thenAnswer((_) async => const Result.failure("DB에 기록을 쓸 수 없습니다."));

      final useCase = ScoreWordQuestionUseCase(historyRepository);
      final result = await useCase.execute(Emotion.natural, Emotion.natural);

      expect(result, isA<Result<bool>>());

      result.when(success: (value) {
        expect(value, true);
      }, failure: (error) {
        fail("요청 실패");
      });
    });
  });
}

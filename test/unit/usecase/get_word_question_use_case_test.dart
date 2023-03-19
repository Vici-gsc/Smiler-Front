import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smiler/data/repository/word_repository_impl.dart';
import 'package:smiler/data/source/model/result.dart';
import 'package:smiler/domain/model/emotion.dart';
import 'package:smiler/domain/model/word_question.dart';
import 'package:smiler/domain/usecase/get_word_question_use_case.dart';
import 'package:test/test.dart';

@GenerateNiceMocks([MockSpec<WordRepositoryImpl>()])
import 'get_word_question_use_case_test.mocks.dart';

main() {
  group("getWordQuestion", () {
    test("요청 성공시 랜덤 단어 퀴즈를 가져온다.", () async {
      final repository = MockWordRepositoryImpl();
      final useCase = GetWordQuestionUseCase(repository);

      when(repository.getWordQuestion()).thenAnswer(
        (_) async => Result.success(WordQuestion(
          imagePath: "SOME_IMAGE",
          correctEmotion: Emotion.natural,
          emotionList: [
            Emotion.natural,
            Emotion.angry,
            Emotion.sad,
            Emotion.happy,
            Emotion.embarrass,
          ],
        )),
      );

      final result = await useCase.execute();

      expect(result, isA<Result<WordQuestion>>());

      result.when(success: (value) {
        expect(value, isA<WordQuestion>());
        expect(value.imagePath, isA<String>());
        expect(value.correctEmotion, isA<Emotion>());
        expect(value.emotionList, isA<List<Emotion>>());
      }, failure: (error) {
        fail("요청 실패");
      });
    });

    test("요청 실패시 에러를 반환한다.", () async {
      final repository = MockWordRepositoryImpl();
      final useCase = GetWordQuestionUseCase(repository);

      when(repository.getWordQuestion())
          .thenAnswer((_) async => const Result.failure("요청 실패"));

      final result = await useCase.execute();

      expect(result, isA<Result<WordQuestion>>());

      result.when(success: (value) {
        fail("요청 성공");
      }, failure: (error) {
        expect(error, isA<String>());
      });
    });
  });
}

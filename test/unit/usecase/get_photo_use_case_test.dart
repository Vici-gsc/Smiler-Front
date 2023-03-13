import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smiler/data/repository/imitation_repository_impl.dart';
import 'package:smiler/data/source/model/result.dart';
import 'package:smiler/domain/model/emotion.dart';
import 'package:smiler/domain/usecase/get_photo_use_case.dart';
import 'package:test/test.dart';

@GenerateNiceMocks([MockSpec<ImitationRepositoryImpl>()])
import 'get_photo_use_case_test.mocks.dart';

main() {
  group("getPhoto", () {
    test("요청 성공시 해당 감정의 사진을 불러온다.", () async {
      final repository = MockImitationRepositoryImpl();
      final useCase = GetPhotoUseCase(repository);

      when(repository.getEmotionImage(any))
          .thenAnswer((_) async => const Result.success("SOME_IMAGE"));

      final result = await useCase.execute(Emotion.natural);

      expect(result, isA<Result<String>>());

      result.when(success: (value) {
        expect(value, isA<String>());
      }, failure: (error) {
        fail("요청 실패");
      });
    });

    test("요청 실패시 에러를 반환한다.", () async {
      final repository = MockImitationRepositoryImpl();
      final useCase = GetPhotoUseCase(repository);

      when(repository.getEmotionImage(any))
          .thenAnswer((_) async => const Result.failure("요청 실패"));

      final result = await useCase.execute(Emotion.natural);

      expect(result, isA<Result<String>>());

      result.when(success: (value) {
        fail("요청 성공");
      }, failure: (error) {
        expect(error, isA<String>());
      });
    });
  });
}

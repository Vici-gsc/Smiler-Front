import 'package:smiler/domain/repository/imitation_repository.dart';

import '../../data/source/model/result.dart';
import '../model/emotion.dart';

/// 감정 사진을 가져오는 UseCase입니다.
class GetPhotoUseCase {
  final ImitationRepository _imitationRepository;

  /// UseCase를 생성합니다.
  GetPhotoUseCase(this._imitationRepository);

  /// UseCase를 실행합니다. [emotion]의 감정을 지닌 표정 사진을 불러옵니다.
  Future<Result<String>> execute(Emotion emotion) async {
    return await _imitationRepository.getEmotionImage(emotion.englishName);
  }
}

import 'package:smiler/domain/repository/imitation_repository.dart';

import '../../data/source/model/result.dart';
import '../model/emotion.dart';

class GetPhotoUseCase {
  final ImitationRepository _imitationRepository;

  GetPhotoUseCase(this._imitationRepository);

  Future<Result<String>> execute(Emotion emotion) async {
    return await _imitationRepository.getEmotionImage(emotion.englishName);
  }
}

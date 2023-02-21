import 'package:smiler/domain/model/word_question.dart';
import 'package:smiler/domain/repository/word_repository.dart';

import '../../data/source/model/result.dart';

/// 감정 단어 문제를 가져오는 UseCase입니다.
class GetWordQuestionUseCase {
  final WordRepository _wordRepository;

  /// UseCase를 생성합니다.
  GetWordQuestionUseCase(this._wordRepository);

  /// UseCase를 실행합니다. 랜덤한 감정 단어 문제를 불러옵니다.
  Future<Result<WordQuestion>> execute() async {
    return await _wordRepository.getWordQuestion();
  }
}

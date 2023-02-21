import 'package:smiler/domain/model/word_question.dart';
import 'package:smiler/domain/repository/word_repository.dart';

import '../../data/source/model/result.dart';

class GetWordQuestionUseCase {
  final WordRepository _wordRepository;

  GetWordQuestionUseCase(this._wordRepository);

  Future<Result<WordQuestion>> execute() async {
    return await _wordRepository.getWordQuestion();
  }
}

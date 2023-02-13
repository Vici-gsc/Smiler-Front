import '../../data/source/model/result.dart';
import '../model/word_question.dart';

abstract class WordRepository {
  Future<Result<WordQuestion>> getWordQuestion();
}

import '../../data/source/model/result.dart';
import '../model/word_question.dart';

/// 감정 단어 맞추기 문제와 관련된 데이터를 가져오는 Repository입니다.
abstract class WordRepository {
  /// 단어 문제를 가져옵니다.
  Future<Result<WordQuestion>> getWordQuestion();
}

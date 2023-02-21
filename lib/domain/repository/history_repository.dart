import '../../data/source/model/result.dart';
import '../model/history.dart';

abstract class HistoryRepository {
  Future<Result<List<History>>> getHistories();

  Future<Result<void>> addHistory(int questionTypeId, int correctAnswerId,
      int userAnswerId, bool isCorrect);

  Future<Result<void>> deleteAllHistories();
}

import '../model/history.dart';

abstract class HistoryRepository {
  Future<List<History>> getHistories();

  Future<void> addHistory(int questionTypeId, int correctAnswerId,
      int userAnswerId, bool isCorrect);

  Future<void> deleteAllHistories();
}

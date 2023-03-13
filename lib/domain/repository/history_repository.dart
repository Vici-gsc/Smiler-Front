import '../../data/source/model/result.dart';
import '../model/history.dart';

/// 학습 이력과 관련된 데이터를 가져오고 저장하는 Repository입니다.
abstract class HistoryRepository {
  /// 모든 풀이 이력을 가져옵니다.
  Future<Result<List<History>>> getHistories({int? limit});

  ///  [questionTypeId] Type을 가지는 문제에 대한 풀이 이력을 저장합니다.
  ///
  /// 문제의 정답 [correctAnswerId]과 사용자가 선택한 답 [userAnswerId]를 저장합니다.
  /// 또한 [isCorrect]가 true이면 정답으로 저장하고, false이면 오답으로 저장합니다.
  Future<Result<void>> addHistory(int questionTypeId, int correctAnswerId,
      int userAnswerId, bool isCorrect);

  /// 모든 풀이 이력을 삭제합니다.
  Future<Result<void>> deleteAllHistories();
}

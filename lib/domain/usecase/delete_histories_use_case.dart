import '../../data/source/model/result.dart';
import '../repository/history_repository.dart';

/// 모든 History를 삭제하는 UseCase입니다.
class DeleteHistoriesUseCase {
  final HistoryRepository _historyRepository;

  /// UseCase를 생성합니다.
  DeleteHistoriesUseCase(this._historyRepository);

  /// UseCase를 실행합니다. 모든 History를 삭제합니다.
  Future<Result<void>> execute() async {
    return await _historyRepository.deleteAllHistories();
  }
}

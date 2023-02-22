import '../../data/source/model/result.dart';
import '../model/history.dart';
import '../repository/history_repository.dart';

/// 모든 History를 가져오는 UseCase입니다.
class GetHistoriesUseCase {
  final HistoryRepository _historyRepository;

  /// UseCase를 생성합니다.
  GetHistoriesUseCase(this._historyRepository);

  /// UseCase를 실행합니다. 모든 History를 불러옵니다.
  Future<Result<List<History>>> execute() async {
    return await _historyRepository.getHistories();
  }
}

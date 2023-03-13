import 'package:smiler/domain/model/history.dart';
import 'package:smiler/domain/repository/history_repository.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/model/emotion.dart';
import '../../domain/model/question_type.dart';
import '../source/model/result.dart';

/// [HistoryRepository]의 구현체입니다.
class HistoryRepositoryImpl implements HistoryRepository {
  static const String _tableName = 'history';
  final Database _database;

  /// [HistoryRepositoryImpl] 클래스를 생성합니다.
  HistoryRepositoryImpl(this._database);

  ///  [questionTypeId] Type을 가지는 문제에 대한 풀이 이력을 저장합니다.
  ///
  /// 문제의 정답 [correctAnswerId]과 사용자가 선택한 답 [userAnswerId]를 저장합니다.
  /// 또한 [isCorrect]가 true이면 정답으로 저장하고, false이면 오답으로 저장합니다.
  @override
  Future<Result<void>> addHistory(int questionTypeId, int correctAnswerId,
      int userAnswerId, bool isCorrect) async {
    try {
      await _database.insert(
        _tableName,
        {
          "questionType": questionTypeId,
          "correctAnswer": correctAnswerId,
          "userAnswer": userAnswerId,
          "isCorrect": isCorrect ? 1 : 0,
        },
      );
      return const Result.success(null);
    } catch (e) {
      return const Result.failure("기록에 저장에 실패하였습니다.");
    }
  }

  /// 모든 풀이 이력을 삭제합니다.
  @override
  Future<Result<void>> deleteAllHistories() async {
    try {
      await _database.delete(_tableName);
      return const Result.success(null);
    } catch (e) {
      return const Result.failure("기록을 삭제하는데 실패하였습니다.");
    }
  }

  /// 모든 풀이 이력을 가져옵니다.
  @override
  Future<Result<List<History>>> getHistories({int? limit}) async {
    try {
      final result = await _database.query(_tableName, limit: limit);
      final histories = result.map((e) => _toHistory(e)).toList();
      return Result.success(histories);
    } catch (e) {
      return const Result.failure("기록을 가져오는데 실패하였습니다.");
    }
  }

  History _toHistory(Map<String, dynamic> map) {
    return History(
      key: map['key'],
      questionType: QuestionType.fromIndex(map['questionType']),
      correctAnswer: Emotion.fromIndex(map['correctAnswer']),
      userAnswer: Emotion.fromIndex(map['userAnswer']),
      isCorrect: map['isCorrect'] == 1,
      solvedTime: DateTime.parse(map['solvedTime']),
    );
  }
}

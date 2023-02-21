import 'package:smiler/domain/model/history.dart';
import 'package:smiler/domain/repository/history_repository.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/model/emotion.dart';
import '../../domain/model/question_type.dart';
import '../source/model/result.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  static const String _tableName = 'history';
  final Database database;

  HistoryRepositoryImpl(this.database);

  @override
  Future<Result<void>> addHistory(int questionTypeId, int correctAnswerId,
      int userAnswerId, bool isCorrect) async {
    try {
      await database.insert(
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

  @override
  Future<Result<void>> deleteAllHistories() async {
    try {
      await database.delete(_tableName);
      return const Result.success(null);
    } catch (e) {
      return const Result.failure("기록을 삭제하는데 실패하였습니다.");
    }
  }

  @override
  Future<Result<List<History>>> getHistories() async {
    try {
      final result = await database.query(_tableName);
      final histories = result.map(_toHistory).toList();
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

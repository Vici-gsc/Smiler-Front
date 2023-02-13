import 'package:smiler/domain/model/history.dart';
import 'package:smiler/domain/repository/history_repository.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/model/emotion.dart';
import '../../domain/model/question_type.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  static const String _tableName = 'history';
  final Database database;

  HistoryRepositoryImpl(this.database);

  @override
  Future<void> addHistory(int questionTypeId, int correctAnswerId,
      int userAnswerId, bool isCorrect) async {
    await database.insert(_tableName, {
      "questionType": questionTypeId,
      "correctAnswer": correctAnswerId,
      "userAnswer": userAnswerId,
      "isCorrect": isCorrect ? 1 : 0,
    });
  }

  @override
  Future<void> deleteAllHistories() async {
    await database.delete(_tableName);
  }

  @override
  Future<List<History>> getHistories() async {
    final result = await database.query(_tableName);
    return result.map((e) => _toHistory(e)).toList();
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

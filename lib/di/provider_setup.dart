import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import '../data/source/api.dart';

/// Get providers for view models
Future<List<SingleChildWidget>> getProviders() async {
  // 1. Independent Models
  http.Client client = http.Client();
  Database database = await openDatabase(
    join(await getDatabasesPath(), 'smiler.db'),
    version: 1,
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE history(id INTEGER PRIMARY KEY, questionType INTEGER NOT NULL, correctAnswer INTEGER NOT NULL, userAnswer INTEGER NOT NULL, isCorrect INTEGER NOT NULL, solvedTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL)",
      );
    },
  );

  // 2. Data Sources
  Api api = Api(client);

  // 3. Repositories

  // 4. Use Cases

  // 5. View Models

  return [
    ChangeNotifierProvider(create: (_) => null),
  ];
}

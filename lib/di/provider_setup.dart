import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:smiler/data/repository/expression_repository_impl.dart';
import 'package:smiler/domain/repository/expression_repository.dart';
import 'package:smiler/domain/repository/history_repository.dart';
import 'package:smiler/domain/repository/imitation_repository.dart';
import 'package:smiler/domain/repository/word_repository.dart';
import 'package:smiler/presentation/expression/expression_view_model.dart';
import 'package:smiler/presentation/main/main_view_model.dart';
import 'package:smiler/presentation/word/word_view_model.dart';
import 'package:sqflite/sqflite.dart';

import '../data/repository/history_repository_impl.dart';
import '../data/repository/imitation_repository_impl.dart';
import '../data/repository/word_repository_impl.dart';
import '../data/source/api.dart';
import '../presentation/imitating/imitating_view_model.dart';

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

  List<CameraDescription> cameras = await availableCameras();
  CameraDescription? camera = cameras.length > 1 ? cameras[1] : null;

  // 2. Data Sources
  Api api = Api(client);

  // 3. Repositories
  ExpressionRepository expressionRepository = ExpressionRepositoryImpl(api);
  WordRepository wordRepository = WordRepositoryImpl(api);
  ImitationRepository imitationRepository = ImitationRepositoryImpl(api);
  HistoryRepository historyRepository = HistoryRepositoryImpl(database);

  // 4. Use Cases

  // 5. View Models
  MainViewModel mainViewModel = MainViewModel(camera != null);
  ImitatingViewModel imitatingViewModel = ImitatingViewModel(camera);
  WordViewModel wordViewModel = WordViewModel();
  ExpressionViewModel expressionViewModel = ExpressionViewModel(camera);

  return [
    ChangeNotifierProvider(create: (_) => mainViewModel),
    ChangeNotifierProvider(create: (_) => imitatingViewModel),
    ChangeNotifierProvider(create: (_) => wordViewModel),
    ChangeNotifierProvider(create: (_) => expressionViewModel),
  ];
}

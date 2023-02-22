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
import 'package:smiler/domain/usecase/delete_histories_use_case.dart';
import 'package:smiler/domain/usecase/get_histories_use_case.dart';
import 'package:smiler/domain/usecase/get_photo_use_case.dart';
import 'package:smiler/domain/usecase/get_word_question_use_case.dart';
import 'package:smiler/domain/usecase/score_expression_use_case.dart';
import 'package:smiler/domain/usecase/score_word_question_use_case.dart';
import 'package:smiler/presentation/expression/expression_view_model.dart';
import 'package:smiler/presentation/main/main_view_model.dart';
import 'package:smiler/presentation/word/word_view_model.dart';
import 'package:sqflite/sqflite.dart';

import '../data/repository/history_repository_impl.dart';
import '../data/repository/imitation_repository_impl.dart';
import '../data/repository/word_repository_impl.dart';
import '../data/source/api.dart';
import '../domain/usecase/score_imitation_use_case.dart';
import '../presentation/imitating/imitating_view_model.dart';

/// 앱 전체에서 사용하는 Provider를 생성합니다. (의존성 주입)
Future<List<SingleChildWidget>> getProviders() async {
  // Independent Classes
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

  // Data Sources
  Api api = Api(client);

  // Repositories
  ExpressionRepository expressionRepository = ExpressionRepositoryImpl(api);
  WordRepository wordRepository = WordRepositoryImpl(api);
  ImitationRepository imitationRepository = ImitationRepositoryImpl(api);
  HistoryRepository historyRepository = HistoryRepositoryImpl(database);

  // Use Cases
  GetPhotoUseCase getPhotoUseCase = GetPhotoUseCase(imitationRepository);
  GetWordQuestionUseCase getWordQuestionUseCase =
      GetWordQuestionUseCase(wordRepository);

  ScoreExpressionUseCase scoreExpressionUseCase =
      ScoreExpressionUseCase(expressionRepository, historyRepository);
  ScoreImitationUseCase scoreImitationUseCase =
      ScoreImitationUseCase(imitationRepository, historyRepository);
  ScoreWordQuestionUseCase scoreWordQuestionUseCase =
      ScoreWordQuestionUseCase(historyRepository);

  GetHistoriesUseCase getHistoriesUseCase =
      GetHistoriesUseCase(historyRepository);
  DeleteHistoriesUseCase deleteHistoriesUseCase =
      DeleteHistoriesUseCase(historyRepository);

  // View Models
  MainViewModel mainViewModel = MainViewModel(camera != null);
  ImitatingViewModel imitatingViewModel =
      ImitatingViewModel(camera, getPhotoUseCase, scoreImitationUseCase);
  WordViewModel wordViewModel =
      WordViewModel(getWordQuestionUseCase, scoreWordQuestionUseCase);
  ExpressionViewModel expressionViewModel =
      ExpressionViewModel(camera, scoreExpressionUseCase);

  return [
    ChangeNotifierProvider(create: (_) => mainViewModel),
    ChangeNotifierProvider(create: (_) => imitatingViewModel),
    ChangeNotifierProvider(create: (_) => wordViewModel),
    ChangeNotifierProvider(create: (_) => expressionViewModel),
  ];
}

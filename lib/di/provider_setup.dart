import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:http/http.dart' as http;

import '../data/source/api.dart';

/// Get providers for view models
Future<List<SingleChildWidget>> getProviders() async {
  // 1. Independent Models
  http.Client client = http.Client();

  // 2. Data Sources
  Api api = Api(client);

  // 3. Repositories

  // 4. Use Cases

  // 5. View Models


  return [
    ChangeNotifierProvider(create: (_) => null),
  ];
}
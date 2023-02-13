import 'dart:convert';
import 'dart:io';

import 'package:smiler/data/source/model/result.dart';
import 'package:smiler/domain/model/scoring_result.dart';
import 'package:smiler/domain/repository/imitation_repository.dart';

import '../source/api.dart';

class ImitationRepositoryImpl implements ImitationRepository {
  final Api api;

  ImitationRepositoryImpl(this.api);

  @override
  Future<Result<String>> getEmotionImage(String emotionName) async {
    final result = await api.get(
      "/imitation/photo?feeling=$emotionName",
    );

    return result.when(
      success: (data) {
        final imageUrl = data["image"];
        return Result.success(imageUrl);
      },
      failure: (error) => Result.failure(error),
    );
  }

  @override
  Future<Result<ScoringResult>> isCorrectImitation(
      String answerEmotionName, String imagePath) async {
    // Load image
    File imageFile = File(imagePath);
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);

    // Send image
    final result = await api.post(
      "/imitation/face?feeling=$answerEmotionName",
      body: jsonEncode(
        [
          {"image": base64Image}
        ],
      ),
    );

    return result.when(
      success: (data) {
        final scoringResult = ScoringResult.fromJson(data);
        return Result.success(scoringResult);
      },
      failure: (error) => Result.failure(error),
    );
  }
}

import 'dart:math';

enum Emotion {
  natural("natural", "중립"),
  happy("happy", "행복"),
  embarrass("embarrass", "당황"),
  angry("angry", "분노"),
  fear("fear", "불안"),
  hurt("hurt", "상처"),
  sad("sad", "슬픔");

  final String englishName;
  final String koreanName;

  const Emotion(this.englishName, this.koreanName);

  static Emotion fromEnglishName(String englishName) {
    return Emotion.values.firstWhere((e) => e.englishName == englishName);
  }

  static Emotion fromKoreanName(String koreanName) {
    return Emotion.values.firstWhere((e) => e.englishName == koreanName);
  }

  static Emotion fromIndex(int index) {
    return Emotion.values[index];
  }

  static Emotion getRandomEmotion({List<Emotion>? exceptions}) {
    final targetEmotions = List.from(Emotion.values);

    if (exceptions != null) {
      for (final exception in exceptions) {
        targetEmotions.remove(exception);
      }
    }

    return targetEmotions[Random().nextInt(targetEmotions.length)];
  }
}

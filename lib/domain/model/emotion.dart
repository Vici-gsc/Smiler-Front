import 'dart:math';

/// 퀴즈에 사용되는 감정입니다.
enum Emotion {
  natural("natural", "정색", "😐"),
  happy("happy", "행복", "😀"),
  embarrass("embarrass", "당황", "😳"),
  angry("angry", "분노", "😡"),
  fear("fear", "불안", "😨"),
  hurt("hurt", "상처", "😢"),
  sad("sad", "슬픔", "😭"),
  skip("skip", "스킵", "🤷‍");

  /// 감정의 영어 이름입니다.
  final String englishName;

  /// 감정의 한국어 이름입니다.
  final String koreanName;

  /// 감정의 이모지입니다.
  final String emoji;

  const Emotion(this.englishName, this.koreanName, this.emoji);

  /// 감정의 영어 이름을 기반으로 감정을 반환합니다.
  static Emotion fromEnglishName(String englishName) {
    return Emotion.values
        .firstWhere((e) => e.englishName == englishName.toLowerCase());
  }

  /// 감정의 한국어 이름을 기반으로 감정을 반환합니다.
  static Emotion fromKoreanName(String koreanName) {
    return Emotion.values.firstWhere((e) => e.koreanName == koreanName);
  }

  /// 감정의 인덱스를 기반으로 감정을 반환합니다.
  static Emotion fromIndex(int index) {
    return Emotion.values[index];
  }

  /// 랜덤으로 감정을 반환합니다. [exceptions]에 포함된 감정은 제외됩니다.
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

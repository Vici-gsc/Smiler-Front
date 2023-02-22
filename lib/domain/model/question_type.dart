/// 문제 유형입니다.
enum QuestionType {
  /// 표정을 보고 따라하는 문제입니다.
  faceImitating("표정 따라하기"),

  /// 표정을 보고 감정 단어를 선택하는 문제입니다.
  wordChoice("감정 단어 맞추기"),

  /// 감정 단어를 보고 표정을 지어보는 문제입니다.
  faceExpression("표정 지어보기");

  /// 문제 유형의 이름입니다.
  final String name;

  const QuestionType(this.name);

  /// [index]에 해당하는 [QuestionType]을 반환합니다.
  static QuestionType fromIndex(int index) {
    return QuestionType.values[index];
  }
}

enum QuestionType {
  faceImitating,
  wordChoice,
  faceExpression;

  static QuestionType fromIndex(int index) {
    return QuestionType.values[index];
  }
}

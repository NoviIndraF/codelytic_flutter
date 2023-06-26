class AnswerDetail {
  AnswerDetail({
     this.question_id,
    this.titleQuestion,
     this.answer,
    this.answerCorrect,
    this.correct,
  });
   final int? question_id;
  final String? titleQuestion;
   final String? answer;
   final String? answerCorrect;
   final bool? correct;

  Map<String, dynamic> toMap() {
    return {
      'question_id': question_id,
      'titleQuestion': titleQuestion,
      'answer': answer,
      'answerCorrect': answerCorrect,
      'correct' : correct,
    };
  }
}
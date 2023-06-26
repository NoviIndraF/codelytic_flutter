class Answer {
  Answer({
     this.question_id,
     this.answer,
  });
   final int? question_id;
   final String? answer;

  Map<String, dynamic> toMap() {
    return {
      'question_id': question_id,
      'answer': answer,
    };
  }
}
class SubmitQuizRequest{
  SubmitQuizRequest({
    required this.quiz_id,
    required this.room_id,
    required this.score,
    required this.sended,
  });
  late final int quiz_id;
  late final int room_id;
  late final int score;
  late final String sended;

  Map<String, dynamic> toMap() {
    return {
      'quiz_id': quiz_id,
      'room_id': room_id,
      'score': score,
      'sended': sended,
    };
  }
}
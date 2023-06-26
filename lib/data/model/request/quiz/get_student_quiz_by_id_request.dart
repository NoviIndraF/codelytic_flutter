
class GetStudentQuizByIdRequest {
  GetStudentQuizByIdRequest({
    required this.room_id,
    required this.quiz_id,
  });
  late final int room_id;
  late final int quiz_id;

  Map<String, dynamic> toMap() {
    return {
      'room_id': room_id,
      'quiz_id': quiz_id,
    };
  }
}
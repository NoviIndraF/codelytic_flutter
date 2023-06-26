class SubmitTaskRequest{
  SubmitTaskRequest({
    required this.task_id,
    required this.room_id,
    required this.answer,
    required this.sended,
  });
  late final int task_id;
  late final int room_id;
  late final String answer;
  late final String sended;

  Map<String, dynamic> toMap() {
    return {
      'task_id': task_id,
      'room_id': room_id,
      'answer': answer,
      'sended': sended,
    };
  }
}
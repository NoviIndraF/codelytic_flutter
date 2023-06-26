class GetStudentQuizByRoomIdRequest {
  GetStudentQuizByRoomIdRequest({
    required this.room_id,
  });
  late final int room_id;

  Map<String, dynamic> toMap() {
    return {
      'room_id': room_id,
    };
  }
}
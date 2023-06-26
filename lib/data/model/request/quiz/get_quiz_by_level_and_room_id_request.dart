class GetQuizByLevelAndRoomIdRequest {
  GetQuizByLevelAndRoomIdRequest({
    required this.room_id,
    required this.level,
  });
  late final String room_id;
  late final String level;

  Map<String, dynamic> toMap() {
    return {
      'room_id': room_id,
      'level': level,
    };
  }
}
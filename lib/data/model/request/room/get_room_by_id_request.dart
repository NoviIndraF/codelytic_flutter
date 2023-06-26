class GetRoomByIdRequest {
  GetRoomByIdRequest({
    required this.room_id,
  });
  late final String room_id;

  Map<String, dynamic> toMap() {
    return {
      'room_id': room_id,
    };
  }
}
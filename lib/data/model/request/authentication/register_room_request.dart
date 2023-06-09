class RegisterRoomRequest{
  RegisterRoomRequest({
    required this.room_id,
    required this.code,
  });
  late final int room_id;
  late final String code;

  Map<String, dynamic> toMap() {
    return {
      'room_id': room_id,
      'code': code,
    };
  }
}
class GetAllDataByRoomCodeRequest {
  GetAllDataByRoomCodeRequest({
    required this.code,
  });
  late final String code;

  Map<String, dynamic> toMap() {
    return {
      'code': code,
    };
  }
}
class GetGroupByCodeRequest {
  GetGroupByCodeRequest({
    required this.code,
  });
  late final String code;

  Map<String, dynamic> toMap() {
    return {
      'code': code,
    };
  }
}
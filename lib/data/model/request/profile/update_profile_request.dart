class UpdateProfileRequest {
  UpdateProfileRequest({
    required this.name,
    required this.username,
  });
  late final String name;
  late final String username;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'username': username,
    };
  }
}
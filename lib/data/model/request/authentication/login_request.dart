class LoginRequest{
  LoginRequest({
    required this.email,
    required this.password,
  });
  late final String email;
    late final String password;

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}
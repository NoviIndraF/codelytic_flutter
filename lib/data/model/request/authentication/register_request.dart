class RegisterRequest{
  RegisterRequest({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
  });
    late final String name;
    late final String username;
    late final String email;
    late final String password;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
import 'package:codelytic/data/model/response/authentication/authentication.dart';
import 'package:equatable/equatable.dart';

class AuthenticationEntity extends Equatable{
  AuthenticationEntity({
    required this.accessToken,
    required this.tokenType,
    required this.student,
  });
  late final String accessToken;
  late final String tokenType;
  late final Student student;

  @override
  // TODO: implement props
  List<Object?> get props => [accessToken, tokenType, student];
}

class StudentEntity extends Equatable {
  StudentEntity({
     this.id,
     this.name,
     this.username,
     this.email,
     this.emailVerifiedAt,
     this.createdAt,
     this.updatedAt,
  });
    int? id;
    String? name;
    String? username;
    String? email;
    String? emailVerifiedAt;
    String? createdAt;
    String? updatedAt;

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, username, email, emailVerifiedAt, createdAt, updatedAt];
}
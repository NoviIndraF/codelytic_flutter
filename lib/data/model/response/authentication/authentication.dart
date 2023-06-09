import 'package:codelytic/domain/entities/authentication/authentication_entity.dart';
import 'package:equatable/equatable.dart';

class Authentication extends Equatable{
  Authentication({
    required this.accessToken,
    required this.tokenType,
    required this.student,
  });
  late final String accessToken;
  late final String tokenType;
  late final Student student;

  Authentication.fromJson(Map<String, dynamic> json){
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    student = Student.fromJson(json['student']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['access_token'] = accessToken ?? '';
    _data['token_type'] = tokenType ?? '';
    _data['student'] = student.toJson();
    return _data;
  }


  AuthenticationEntity toEntity() => AuthenticationEntity(
      accessToken: accessToken,
      tokenType: tokenType,
      student: student
  );

  @override
  // TODO: implement props
  List<Object?> get props => [accessToken, tokenType, student];
}

class Student extends Equatable {
  Student({
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
  
  Student.fromJson(Map<String, dynamic> json){
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    username = json['username'] ?? '';
    email = json['email'] ?? '';
    emailVerifiedAt = json['email_verified_at'] ?? '';
    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['username'] = username;
    _data['email'] = email;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }

  StudentEntity toEntity() => StudentEntity(
      id: id,
      name: name,
      username: username,
      email: email,
      createdAt: createdAt,
      updatedAt: updatedAt
  );

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, username, email, emailVerifiedAt, createdAt, updatedAt];
}
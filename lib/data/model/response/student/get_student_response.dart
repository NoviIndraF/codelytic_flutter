// To parse this JSON data, do
//
//     final getQuizByRoomCode = getQuizByRoomCodeFromJson(jsonString);

import 'package:codelytic/domain/entities/student/get_student_entity.dart';
import 'package:equatable/equatable.dart';

class GetStudentResponse extends Equatable{
  int? id;
  String? name;
  String? username;
  String? email;
  String? createdAt;
  String? updatedAt;

  GetStudentResponse({
    this.id,
    this.name,
    this.username,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  factory GetStudentResponse.fromJson(Map<String, dynamic> json) => GetStudentResponse(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  GetStudentEntity toEntity()=> GetStudentEntity(id: id, name: name, username: username, email: email, createdAt: createdAt, updatedAt: updatedAt);

  @override
  List<Object?> get props => [id, name, username, email, createdAt, updatedAt];
}

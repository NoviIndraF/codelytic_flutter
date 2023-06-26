// To parse this JSON data, do
//
//     final getQuizByRoomCode = getQuizByRoomCodeFromJson(jsonString);

import 'package:equatable/equatable.dart';

class GetStudentEntity extends Equatable{
  int? id;
  String? name;
  String? username;
  String? email;
  String? createdAt;
  String? updatedAt;

  GetStudentEntity({
    this.id,
    this.name,
    this.username,
    this.email,
    this.createdAt,
    this.updatedAt,
  });

  factory GetStudentEntity.fromJson(Map<String, dynamic> json) => GetStudentEntity(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };

  @override
  List<Object?> get props => [id, name, username, email, createdAt, updatedAt];
}

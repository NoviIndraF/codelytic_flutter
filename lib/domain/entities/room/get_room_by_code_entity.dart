import 'package:equatable/equatable.dart';

import '../../../data/model/response/room/get_room_by_id_response.dart';

class GetRoomByIdEntity extends Equatable{
  int? id;
  String? code;
  String? slug;
  String? name;
  String? major;
  String? description;
  String? createdAt;
  String? updatedAt;
  int? userId;
  User? user;

  GetRoomByIdEntity({
    this.id,
    this.code,
    this.slug,
    this.name,
    this.major,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.user,
  });

  factory GetRoomByIdEntity.fromJson(Map<String, dynamic> json) => GetRoomByIdEntity(
    id: json["id"],
    code: json["code"],
    slug: json["slug"],
    name: json["name"],
    major: json["major"],
    description: json["description"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    userId: json["user_id"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  @override
  List<Object?> get props => [id, code, slug, name, major, description, createdAt, updatedAt, userId, user];

}

class UserEntity extends Equatable{
  int? id;
  String? name;
  String? username;
  String? email;
  String? status;
  String? showingStatus;

  UserEntity({
    this.id,
    this.name,
    this.username,
    this.email,
    this.status,
    this.showingStatus,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    status: json["status"],
    showingStatus: json["showing_status"],
  );

  @override
  List<Object?> get props => [id, name, username, email, status, showingStatus];
}

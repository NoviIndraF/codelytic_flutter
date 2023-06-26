import 'package:codelytic/domain/entities/room/get_room_by_code_entity.dart';
import 'package:equatable/equatable.dart';

class GetRoomByIdResponse extends Equatable{
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

  GetRoomByIdResponse({
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

  factory GetRoomByIdResponse.fromJson(Map<String, dynamic> json) => GetRoomByIdResponse(
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

  GetRoomByIdEntity toEntity()=> GetRoomByIdEntity(id: id, slug: slug, name: name, major: major, description: description, code: code, user: user, userId: userId, createdAt: createdAt, updatedAt: updatedAt);

  @override
  List<Object?> get props => [id, code, slug, name, major, description, createdAt, updatedAt, userId, user];

}

class User extends Equatable{
  int? id;
  String? name;
  String? username;
  String? email;
  String? status;
  String? showingStatus;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.status,
    this.showingStatus,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    status: json["status"],
    showingStatus: json["showing_status"],
  );

  UserEntity toEntity() => UserEntity(id: id, name: name, username: username, email: email, status: status, showingStatus: showingStatus);

  @override
  List<Object?> get props => [id, name, username, email, status, showingStatus];
}

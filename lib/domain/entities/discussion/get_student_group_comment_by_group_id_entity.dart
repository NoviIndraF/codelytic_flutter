import 'dart:convert';

import 'package:codelytic/data/model/response/discussion/get_student_group_comment_by_group_id_response.dart';
import 'package:equatable/equatable.dart';

GetStudentGroupCommentByGroupIdEntity getStudentGroupCommentByGroupIdEntityFromJson(String str) => GetStudentGroupCommentByGroupIdEntity.fromJson(json.decode(str));
class GetStudentGroupCommentByGroupIdEntity extends Equatable{
  List<StudentGroupComment>? studentGroupComment;

  GetStudentGroupCommentByGroupIdEntity({
    this.studentGroupComment,
  });

  factory GetStudentGroupCommentByGroupIdEntity.fromJson(Map<String, dynamic> json) => GetStudentGroupCommentByGroupIdEntity(
    studentGroupComment: json["data"] == null ? [] : List<StudentGroupComment>.from(json["data"]!.map((x) => StudentGroupComment.fromJson(x))),
  );

  @override
  List<Object?> get props => [studentGroupComment];
}

class StudentGroupCommentEntity extends Equatable{
  int? id;
  String? message;
  int? like;
  int? up;
  int? studentId;
  int? groupId;
  String? createdAt;
  String? updatedAt;
  Student? student;
  int? userId;
  User? user;

  StudentGroupCommentEntity({
    this.id,
    this.message,
    this.like,
    this.up,
    this.studentId,
    this.groupId,
    this.createdAt,
    this.updatedAt,
    this.student,
    this.userId,
    this.user,
  });

  factory StudentGroupCommentEntity.fromJson(Map<String, dynamic> json) => StudentGroupCommentEntity(
    id: json["id"],
    message: json["message"],
    like: json["like"],
    up: json["up"],
    studentId: json["student_id"],
    groupId: json["group_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    student: json["student"] == null ? null : Student.fromJson(json["student"]),
    userId: json["user_id"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  @override
  List<Object?> get props => [id, message, like, up, studentId, groupId, createdAt, updatedAt, userId, user];
}

class StudentEntity extends Equatable{
  int? id;
  String? name;
  String? username;
  String? email;
  StudentEntity({
    this.id,
    this.name,
    this.username,
    this.email,
  });

  factory StudentEntity.fromJson(Map<String, dynamic> json) => StudentEntity(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
  );

  @override
  List<Object?> get props => [id, name, username, email];
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
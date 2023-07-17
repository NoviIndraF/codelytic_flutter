import 'dart:convert';

import 'package:codelytic/domain/entities/discussion/get_student_group_comment_by_group_id_entity.dart';
import 'package:equatable/equatable.dart';

GetStudentGroupCommentByGroupIdResponse getStudentGroupCommentByGroupIdResponseFromJson(String str) => GetStudentGroupCommentByGroupIdResponse.fromJson(json.decode(str));

class GetStudentGroupCommentByGroupIdResponse extends Equatable{
  List<StudentGroupComment>? studentGroupComment;

  GetStudentGroupCommentByGroupIdResponse({
    this.studentGroupComment,
  });

  factory GetStudentGroupCommentByGroupIdResponse.fromJson(Map<String, dynamic> json) => GetStudentGroupCommentByGroupIdResponse(
    studentGroupComment: json["data"] == null ? [] : List<StudentGroupComment>.from(json["data"]!.map((x) => StudentGroupComment.fromJson(x))),
  );

  GetStudentGroupCommentByGroupIdEntity toEntity() => GetStudentGroupCommentByGroupIdEntity(studentGroupComment: studentGroupComment);

  @override
  List<Object?> get props => [studentGroupComment];
}

class StudentGroupComment extends Equatable{
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

  StudentGroupComment({
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

  factory StudentGroupComment.fromJson(Map<String, dynamic> json) => StudentGroupComment(
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

  StudentGroupCommentEntity toEntity() => StudentGroupCommentEntity(id: id, message: message, like: like, up: up, studentId: studentId, groupId: groupId, createdAt: createdAt, updatedAt: updatedAt, student: student, userId: userId, user: user);

  @override
  List<Object?> get props => [id, message, like, up, studentId, groupId, createdAt, updatedAt, userId, user];
}

class Student extends Equatable{
  int? id;
  String? name;
  String? username;
  String? email;
  Student({
    this.id,
    this.name,
    this.username,
    this.email,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
  };

  @override
  List<Object?> get props => [id, name, username, email];
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

  @override
  List<Object?> get props => [id, name, username, email, status, showingStatus];
}
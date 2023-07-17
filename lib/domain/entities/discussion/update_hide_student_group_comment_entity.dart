import 'dart:convert';

import 'package:codelytic/data/model/response/discussion/update_hide_student_group_comment_response.dart';
import 'package:equatable/equatable.dart';

UpdateHideStudentGroupCommentEntity updateStudentGroupCommentEntityFromJson(String str) => UpdateHideStudentGroupCommentEntity.fromJson(json.decode(str));
class UpdateHideStudentGroupCommentEntity extends Equatable{
  UpdateStudentGroupComment? updateStudentGroupComment;

  UpdateHideStudentGroupCommentEntity({
    this.updateStudentGroupComment,
  });

  factory UpdateHideStudentGroupCommentEntity.fromJson(Map<String, dynamic> json) => UpdateHideStudentGroupCommentEntity(
    updateStudentGroupComment: json["data"] == null ? null : UpdateStudentGroupComment.fromJson(json["data"]),
  );

  @override
  List<Object?> get props => [updateStudentGroupComment];

}

class UpdateStudentGroupCommentEntity extends Equatable{
  int? id;
  String? message;
  int? like;
  int? hide;
  int? studentId;
  int? groupId;
  String? createdAt;
  String? updatedAt;

  UpdateStudentGroupCommentEntity({
    this.id,
    this.message,
    this.like,
    this.hide,
    this.studentId,
    this.groupId,
    this.createdAt,
    this.updatedAt,
  });

  factory UpdateStudentGroupCommentEntity.fromJson(Map<String, dynamic> json) => UpdateStudentGroupCommentEntity(
    id: json["id"],
    message: json["message"],
    like: json["like"],
    hide: json["hide"],
    studentId: json["student_id"],
    groupId: json["group_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  @override
  List<Object?> get props => [id, message, like, hide, studentId, groupId, createdAt, updatedAt];
}

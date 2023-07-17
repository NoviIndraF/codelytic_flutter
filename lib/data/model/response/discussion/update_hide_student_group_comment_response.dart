import 'dart:convert';

import 'package:codelytic/domain/entities/discussion/update_hide_student_group_comment_entity.dart';
import 'package:equatable/equatable.dart';

UpdateHideStudentGroupCommentResponse updateStudentGroupCommentResponseFromJson(String str) => UpdateHideStudentGroupCommentResponse.fromJson(json.decode(str));
class UpdateHideStudentGroupCommentResponse extends Equatable{
  UpdateStudentGroupComment? updateStudentGroupComment;

  UpdateHideStudentGroupCommentResponse({
    this.updateStudentGroupComment,
  });

  factory UpdateHideStudentGroupCommentResponse.fromJson(Map<String, dynamic> json) => UpdateHideStudentGroupCommentResponse(
    updateStudentGroupComment: json["data"] == null ? null : UpdateStudentGroupComment.fromJson(json["data"]),
  );

  UpdateHideStudentGroupCommentEntity toEntity() => UpdateHideStudentGroupCommentEntity(updateStudentGroupComment: updateStudentGroupComment);

  @override
  List<Object?> get props => [updateStudentGroupComment];

}

class UpdateStudentGroupComment extends Equatable{
  int? id;
  String? message;
  int? like;
  int? hide;
  int? studentId;
  int? groupId;
  String? createdAt;
  String? updatedAt;

  UpdateStudentGroupComment({
    this.id,
    this.message,
    this.like,
    this.hide,
    this.studentId,
    this.groupId,
    this.createdAt,
    this.updatedAt,
  });

  factory UpdateStudentGroupComment.fromJson(Map<String, dynamic> json) => UpdateStudentGroupComment(
    id: json["id"],
    message: json["message"],
    like: json["like"],
    hide: json["hide"],
    studentId: json["student_id"],
    groupId: json["group_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  UpdateStudentGroupCommentEntity toEntity() => UpdateStudentGroupCommentEntity(
    id: id, message: message, like: like, hide: hide, studentId: studentId, groupId: groupId, createdAt: createdAt, updatedAt: updatedAt
  );

  @override
  List<Object?> get props => [id, message, like, hide, studentId, groupId, createdAt, updatedAt];
}

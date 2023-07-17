import 'dart:convert';

import 'package:codelytic/data/model/response/discussion/discussion.dart';
import 'package:codelytic/data/model/response/discussion/get_student_group_by_room_id_response.dart';
import 'package:codelytic/data/model/response/discussion/group.dart';
import 'package:equatable/equatable.dart';

GetStudentGroupByRoomIdEntity getStudentGroupByRoomIdFromJson(String str) => GetStudentGroupByRoomIdEntity.fromJson(json.decode(str));

class GetStudentGroupByRoomIdEntity extends Equatable{
  List<StudentGroup>? studentGroup;

  GetStudentGroupByRoomIdEntity({
    this.studentGroup,
  });

  factory GetStudentGroupByRoomIdEntity.fromJson(Map<String, dynamic> json) => GetStudentGroupByRoomIdEntity(
    studentGroup: json["data"] == null ? [] : List<StudentGroup>.from(json["data"]!.map((x) => StudentGroup.fromJson(x))),
  );

  @override
  // TODO: implement props
  List<Object?> get props => [studentGroup];

}

class StudentGroupEntity extends Equatable{
  int? id;
  int? studentId;
  int? groupId;
  int? roomId;
  String? createdAt;
  String? updatedAt;
  Group? group;

  StudentGroupEntity({
    this.id,
    this.studentId,
    this.groupId,
    this.roomId,
    this.createdAt,
    this.updatedAt,
    this.group,
  });

  factory StudentGroupEntity.fromJson(Map<String, dynamic> json) => StudentGroupEntity(
    id: json["id"],
    studentId: json["student_id"],
    groupId: json["group_id"],
    roomId: json["room_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    group: json["group"] == null ? null : Group.fromJson(json["group"]),
  );

  @override
  List<Object?> get props => [id, studentId, groupId, roomId, createdAt, updatedAt, group];
}

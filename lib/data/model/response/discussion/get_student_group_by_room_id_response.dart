import 'dart:convert';

import 'package:codelytic/domain/entities/discussion/get_student_group_by_room_id_entity.dart';
import 'package:equatable/equatable.dart';

import 'group.dart';

GetStudentGroupByRoomIdResponse getStudentGroupByRoomIdFromJson(String str) => GetStudentGroupByRoomIdResponse.fromJson(json.decode(str));

class GetStudentGroupByRoomIdResponse extends Equatable{
  List<StudentGroup>? studentGroup;

  GetStudentGroupByRoomIdResponse({
    this.studentGroup,
  });

  factory GetStudentGroupByRoomIdResponse.fromJson(Map<String, dynamic> json) => GetStudentGroupByRoomIdResponse(
    studentGroup: json["data"] == null ? [] : List<StudentGroup>.from(json["data"]!.map((x) => StudentGroup.fromJson(x))),
  );

  GetStudentGroupByRoomIdEntity toEntity()=> GetStudentGroupByRoomIdEntity(studentGroup: studentGroup);

  @override
  // TODO: implement props
  List<Object?> get props => [studentGroup];

}

class StudentGroup extends Equatable{
  int? id;
  int? studentId;
  int? groupId;
  int? roomId;
  String? createdAt;
  String? updatedAt;
  Group? group;

  StudentGroup({
    this.id,
    this.studentId,
    this.groupId,
    this.roomId,
    this.createdAt,
    this.updatedAt,
    this.group,
  });

  factory StudentGroup.fromJson(Map<String, dynamic> json) => StudentGroup(
    id: json["id"],
    studentId: json["student_id"],
    groupId: json["group_id"],
    roomId: json["room_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    group: json["group"] == null ? null : Group.fromJson(json["group"]),
  );

  StudentGroupEntity toEntity()=> StudentGroupEntity(id: id, studentId: studentId, groupId: groupId, roomId: roomId, createdAt: createdAt, updatedAt: updatedAt, group: group);

  @override
  List<Object?> get props => [id, studentId, groupId, roomId, createdAt, updatedAt, group];
}

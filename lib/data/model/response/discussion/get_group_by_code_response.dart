import 'dart:convert';

import 'package:codelytic/domain/entities/discussion/get_group_by_code_entity.dart';
import 'package:codelytic/domain/entities/quiz/get_student_quiz_by_id_entity.dart';
import 'package:equatable/equatable.dart';

import 'group.dart';

GetGroupByCodeResponse getGroupByCodeFromJson(String str) => GetGroupByCodeResponse.fromJson(json.decode(str));
class GetGroupByCodeResponse extends Equatable{
  Group? group;

  GetGroupByCodeResponse({
    this.group,
  });

  factory GetGroupByCodeResponse.fromJson(Map<String, dynamic> json) => GetGroupByCodeResponse(
    group: json["data"] == null ? null : Group.fromJson(json["data"]),
  );

  GetGroupByCodeEntity toEntity()=> GetGroupByCodeEntity(group: group);

  @override
  // TODO: implement props
  List<Object?> get props => [group];

}

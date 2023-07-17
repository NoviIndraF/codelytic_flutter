import 'dart:convert';

import 'package:codelytic/data/model/response/discussion/get_group_by_code_response.dart';
import 'package:codelytic/data/model/response/discussion/group.dart';
import 'package:equatable/equatable.dart';

GetGroupByCodeEntity getGroupByCodeFromJson(String str) => GetGroupByCodeEntity.fromJson(json.decode(str));
class GetGroupByCodeEntity extends Equatable{
  Group? group;

  GetGroupByCodeEntity({
    this.group,
  });

  factory GetGroupByCodeEntity.fromJson(Map<String, dynamic> json) => GetGroupByCodeEntity(
    group: json["data"] == null ? null : Group.fromJson(json["data"]),
  );

  @override
  // TODO: implement props
  List<Object?> get props => [group];

}

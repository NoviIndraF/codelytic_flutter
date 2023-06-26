import 'dart:convert';

import 'package:codelytic/data/model/response/task/task.dart';
import 'package:codelytic/domain/entities/task/get_task_by_room_code_entity.dart';
import 'package:equatable/equatable.dart';

class GetTaskByRoomCodeResponse extends Equatable{
  int? id;
  String? code;
  String? slug;
  String? name;
  String? major;
  String? description;
  String? createdAt;
  String? updatedAt;
  List<Task>? task;

  GetTaskByRoomCodeResponse({
    this.id,
    this.code,
    this.slug,
    this.name,
    this.major,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.task,
  });

  factory GetTaskByRoomCodeResponse.fromJson(Map<String, dynamic> json) => GetTaskByRoomCodeResponse(
    id: json["id"],
    code: json["code"],
    slug: json["slug"],
    name: json["name"],
    major: json["major"],
    description: json["description"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    task: json["task"] == null ? [] : List<Task>.from(json["task"]!.map((x) => Task.fromJson(x))),
  );

  GetTaskByRoomCodeResponseEntity toEntity() => GetTaskByRoomCodeResponseEntity(id: id, slug: slug, code: code,name: name,major: major,description: description, createdAt: createdAt,updatedAt: updatedAt,task: task);

  @override
  // TODO: implement props
  List<Object?> get props => [id, code, slug, name, major, description, createdAt, updatedAt, task];
}



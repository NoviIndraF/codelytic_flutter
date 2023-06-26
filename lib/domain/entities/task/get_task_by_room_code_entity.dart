import 'dart:convert';

import 'package:codelytic/data/model/response/task/get_task_by_room_code_response.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/response/task/task.dart';



class GetTaskByRoomCodeResponseEntity extends Equatable{
  int? id;
  String? code;
  String? slug;
  String? name;
  String? major;
  String? description;
  String? createdAt;
  String? updatedAt;
  List<Task>? task;

  GetTaskByRoomCodeResponseEntity({
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

  factory GetTaskByRoomCodeResponseEntity.fromJson(Map<String, dynamic> json) => GetTaskByRoomCodeResponseEntity(
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


  @override
  List<Object?> get props => [id, code, slug, name, major, description, createdAt, updatedAt, task];
}
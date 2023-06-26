import 'dart:convert';

import 'package:codelytic/data/model/response/task/get_student_task_by_room_id.dart';
import 'package:codelytic/data/model/response/task/student_task.dart';
import 'package:equatable/equatable.dart';

GetStudentTaskByRoomIdEntity getStudentTaskByRoomIdEntity(String str) => GetStudentTaskByRoomIdEntity.fromJson(json.decode(str));

class GetStudentTaskByRoomIdEntity extends Equatable{
  List<StudentTask>? studentTask;

  GetStudentTaskByRoomIdEntity({
    this.studentTask,
  });

  factory GetStudentTaskByRoomIdEntity.fromJson(Map<String, dynamic> json) => GetStudentTaskByRoomIdEntity(
    studentTask: json["data"] == null ? [] : List<StudentTask>.from(json["data"]!.map((x) => StudentTask.fromJson(x))),
  );

  @override
  List<Object?> get props => [studentTask];
}

class StudentTaskEntity extends Equatable{
  int? id;
  String? answer;
  int? studentId;
  int? taskId;
  int? roomId;
  String? sended;
  String? createdAt;
  String? updatedAt;
  Task? task;

  StudentTaskEntity({
    this.id,
    this.answer,
    this.studentId,
    this.taskId,
    this.roomId,
    this.sended,
    this.createdAt,
    this.updatedAt,
    this.task,
  });

  factory StudentTaskEntity.fromJson(Map<String, dynamic> json) => StudentTaskEntity(
    id: json["id"],
    answer: json["answer"],
    studentId: json["student_id"],
    taskId: json["task_id"],
    roomId: json["room_id"],
    sended: json["sended"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    task: json["task"] == null ? null : Task.fromJson(json["task"]),
  );

  @override
  List<Object?> get props => [id, answer, studentId, taskId, roomId, sended, createdAt, updatedAt, task];

}

class TaskEntity extends Equatable{
  int? id;
  String? slug;
  String? title;
  String? description;
  String? note;
  String? deadline;

  TaskEntity({
    this.id,
    this.slug,
    this.title,
    this.description,
    this.note,
    this.deadline,
  });

  factory TaskEntity.fromJson(Map<String, dynamic> json) => TaskEntity(
    id: json["id"],
    slug: json["slug"],
    title: json["title"],
    description: json["description"],
    note: json["note"],
    deadline: json["deadline"],
  );

  @override
  List<Object?> get props => [id, slug, title, description, note,deadline];
}

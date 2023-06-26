import 'dart:convert';

import 'package:codelytic/data/model/response/task/student_task.dart';
import 'package:codelytic/domain/entities/task/get_student_task_by_room_id_entity.dart';
import 'package:equatable/equatable.dart';

GetStudentTaskByRoomIdResponse getStudentTaskByRoomIdResponse(String str) => GetStudentTaskByRoomIdResponse.fromJson(json.decode(str));

class GetStudentTaskByRoomIdResponse extends Equatable {
  List<StudentTask>? studentTask;

  GetStudentTaskByRoomIdResponse({
    this.studentTask,
  });

  factory GetStudentTaskByRoomIdResponse.fromJson(Map<String, dynamic> json) => GetStudentTaskByRoomIdResponse(
    studentTask: json["data"] == null ? [] : List<StudentTask>.from(json["data"]!.map((x) => StudentTask.fromJson(x))),
  );

  GetStudentTaskByRoomIdEntity toEntity() => GetStudentTaskByRoomIdEntity(studentTask: studentTask);

  @override
  List<Object?> get props => [studentTask];

}


class StudentTask extends Equatable{
  int? id;
  String? answer;
  int? studentId;
  int? taskId;
  int? roomId;
  String? sended;
  String? createdAt;
  String? updatedAt;
  Task? task;

  StudentTask({
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

  factory StudentTask.fromJson(Map<String, dynamic> json) => StudentTask(
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

  StudentTaskEntity toEntity()=> StudentTaskEntity(id: id, answer: answer, studentId: studentId, taskId: taskId, roomId: roomId, sended: sended,createdAt: createdAt, updatedAt: updatedAt, task: task);

  @override
  List<Object?> get props => [id, answer, studentId, taskId, roomId, createdAt, updatedAt, task];

}


// import 'dart:convert';
//
// import 'package:codelytic/data/model/response/task/list_student_task.dart';
// import 'package:equatable/equatable.dart';
//
// ListStudentTaskEntity ListStudentTaskEntityFromJson(String str) => ListStudentTaskEntity.fromJson(json.decode(str));
// class ListStudentTaskEntity extends Equatable{
//   List<StudentTask>? studentTask;
//
//   ListStudentTaskEntity({
//     this.studentTask,
//   });
//
//   factory ListStudentTaskEntity.fromJson(Map<String, dynamic> json) => ListStudentTaskEntity(
//     studentTask: json["data"] == null ? [] : List<StudentTask>.from(json["data"]!.map((x) => StudentTask.fromJson(x))),
//   );
//
//   @override
//   List<Object?> get props => [studentTask];
// }
//
// class StudentTaskEntity extends Equatable {
//   int? id;
//   String? answer;
//   int? studentId;
//   int? taskId;
//   int? roomId;
//   String? createdAt;
//   String? updatedAt;
//
//   StudentTaskEntity({
//     this.id,
//     this.answer,
//     this.studentId,
//     this.taskId,
//     this.roomId,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   factory StudentTaskEntity.fromJson(Map<String, dynamic> json) => StudentTaskEntity(
//     id: json["id"],
//     answer: json["answer"],
//     studentId: json["student_id"],
//     taskId: json["task_id"],
//     roomId: json["room_id"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//   );
//
//   @override
//   List<Object?> get props => [id, answer, studentId, taskId, roomId, createdAt, updatedAt];
// }
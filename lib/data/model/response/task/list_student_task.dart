// import 'dart:convert';
//
// import 'package:codelytic/domain/entities/task/list_student_task_entity.dart';
// import 'package:equatable/equatable.dart';
//
// ListStudentTask listStudentTaskFromJson(String str) => ListStudentTask.fromJson(json.decode(str));
// class ListStudentTask extends Equatable{
//   List<StudentTask>? studentTask;
//
//   ListStudentTask({
//     this.studentTask,
//   });
//
//   factory ListStudentTask.fromJson(Map<String, dynamic> json) => ListStudentTask(
//     studentTask: json["data"] == null ? [] : List<StudentTask>.from(json["data"]!.map((x) => StudentTask.fromJson(x))),
//   );
//
//   ListStudentTaskEntity toEntity() => ListStudentTaskEntity(studentTask: studentTask);
//
//   @override
//   List<Object?> get props => [studentTask];
// }
//
// class StudentTask extends Equatable {
//   int? id;
//   String? answer;
//   int? studentId;
//   int? taskId;
//   int? roomId;
//   String? createdAt;
//   String? updatedAt;
//
//   StudentTask({
//     this.id,
//     this.answer,
//     this.studentId,
//     this.taskId,
//     this.roomId,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   factory StudentTask.fromJson(Map<String, dynamic> json) => StudentTask(
//     id: json["id"],
//     answer: json["answer"],
//     studentId: json["student_id"],
//     taskId: json["task_id"],
//     roomId: json["room_id"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//   );
//
//   StudentTaskEntity toEntity()=> StudentTaskEntity(id: id, answer: answer, studentId: studentId, taskId: taskId, roomId: roomId, createdAt: createdAt, updatedAt: updatedAt);
//
//   @override
//   List<Object?> get props => [id, answer, studentId, taskId, roomId, createdAt, updatedAt];
// }
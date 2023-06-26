import 'package:codelytic/data/model/request/task/get_student_task_by_room_id_request.dart';
import 'package:codelytic/data/model/request/task/get_task_by_room_code_request.dart';
import 'package:codelytic/data/model/request/task/submit_task_request.dart';
import 'package:codelytic/domain/entities/task/get_student_task_by_room_id_entity.dart';
import 'package:codelytic/domain/entities/task/get_task_by_room_code_entity.dart';
import 'package:codelytic/domain/entities/task/list_student_task_entity.dart';
import 'package:codelytic/domain/entities/task/submit_task_entity.dart';
import 'package:codelytic/domain/repositories/task_repositories.dart';
import 'package:dartz/dartz.dart';

class TaskUsecase{
  final TaskRepositories taskRepositories;
  TaskUsecase(this.taskRepositories);

  Future<Either<String, GetTaskByRoomCodeResponseEntity>> getTaskByRoomId(String token, GetTaskByRoomIdRequest request){
    return taskRepositories.getTaskByRoomId(token, request);
  }

  Future<Either<String, GetStudentTaskByRoomIdEntity>> getStudentTask(String token, GetStudentTaskByRoomIdRequest request){
    return taskRepositories.getStudentTask(token, request);
  }

  Future<Either<String, SubmitTaskEntity>> submitTask(String token, SubmitTaskRequest request){
    return taskRepositories.submitTask(token, request);
  }
}
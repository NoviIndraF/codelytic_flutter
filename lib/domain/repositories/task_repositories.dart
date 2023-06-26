import 'package:codelytic/data/model/request/task/get_student_task_by_room_id_request.dart';
import 'package:codelytic/data/model/request/task/get_task_by_room_code_request.dart';
import 'package:codelytic/data/model/request/task/submit_task_request.dart';
import 'package:codelytic/domain/entities/task/get_student_task_by_room_id_entity.dart';
import 'package:codelytic/domain/entities/task/get_task_by_room_code_entity.dart';
import 'package:codelytic/domain/entities/task/list_student_task_entity.dart';
import 'package:codelytic/domain/entities/task/submit_task_entity.dart';
import 'package:dartz/dartz.dart';

abstract class TaskRepositories{
  Future<Either<String, GetTaskByRoomCodeResponseEntity>> getTaskByRoomId(String token, GetTaskByRoomIdRequest request);
  Future<Either<String, GetStudentTaskByRoomIdEntity>> getStudentTask(String token, GetStudentTaskByRoomIdRequest request);
  Future<Either<String, SubmitTaskEntity>> submitTask(String token, SubmitTaskRequest request);

}
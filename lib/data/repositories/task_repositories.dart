import 'package:codelytic/data/datasource/network/task/task_remote_data_source_impl.dart';
import 'package:codelytic/data/model/request/task/get_student_task_by_room_id_request.dart';
import 'package:codelytic/data/model/request/task/get_task_by_room_code_request.dart';
import 'package:codelytic/data/model/request/task/submit_task_request.dart';
import 'package:codelytic/domain/entities/task/get_student_task_by_room_id_entity.dart';
import 'package:codelytic/domain/entities/task/get_task_by_room_code_entity.dart';
import 'package:codelytic/domain/entities/task/list_student_task_entity.dart';
import 'package:codelytic/domain/entities/task/submit_task_entity.dart';
import 'package:codelytic/domain/repositories/task_repositories.dart';
import 'package:dartz/dartz.dart';

class TaskRepositoriesImpl implements TaskRepositories{
  final TaskRemoteDataSourceImpl taskRemoteDataSourceImpl;

  TaskRepositoriesImpl(
      {required this.taskRemoteDataSourceImpl});

  @override
  Future<Either<String, GetTaskByRoomCodeResponseEntity>> getTaskByRoomId(String token, GetTaskByRoomIdRequest request) async {
    try {
      final result = await taskRemoteDataSourceImpl.getTaskByRoomId(token, request);
      return Right(result.toEntity());
    }
    catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, SubmitTaskEntity>> submitTask(String token, SubmitTaskRequest request) async {
    try {
      final result = await taskRemoteDataSourceImpl.submitTask(token, request);
      return Right(result.toEntity());
    }
    catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, GetStudentTaskByRoomIdEntity>> getStudentTask(String token, GetStudentTaskByRoomIdRequest request) async {
    try {
      final result = await taskRemoteDataSourceImpl.getStudentTask(token, request);
      return Right(result.toEntity());
    }
    catch (e) {
      return Left(e.toString());
    }
  }
}
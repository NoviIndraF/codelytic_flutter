import 'package:codelytic/data/model/request/task/get_task_by_room_code_request.dart';
import 'package:codelytic/domain/entities/student/get_student_entity.dart';
import 'package:codelytic/domain/entities/task/get_task_by_room_code_entity.dart';
import 'package:codelytic/domain/repositories/student_repositories.dart';
import 'package:codelytic/domain/repositories/task_repositories.dart';
import 'package:dartz/dartz.dart';

class StudentUsecase{
  final StudentRepositories taskRepositories;
  StudentUsecase(this.taskRepositories);

  Future<Either<String, GetStudentEntity>> getStudent(String token){
    return taskRepositories.getStudent(token);
  }
}
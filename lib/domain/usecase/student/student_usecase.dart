import 'package:codelytic/data/model/request/profile/update_profile_request.dart';
import 'package:codelytic/data/model/request/task/get_task_by_room_code_request.dart';
import 'package:codelytic/domain/entities/authentication/authentication_entity.dart';
import 'package:codelytic/domain/entities/student/get_student_entity.dart';
import 'package:codelytic/domain/entities/task/get_task_by_room_code_entity.dart';
import 'package:codelytic/domain/repositories/student_repositories.dart';
import 'package:codelytic/domain/repositories/task_repositories.dart';
import 'package:dartz/dartz.dart';

class StudentUsecase{
  final StudentRepositories studentRepositories;
  StudentUsecase(this.studentRepositories);

  Future<Either<String, GetStudentEntity>> getStudent(String token){
    return studentRepositories.getStudent(token);
  }

  Future<Either<String, StudentEntity>> updateProfile(String token, UpdateProfileRequest request){
    return studentRepositories.updateProfile(token, request);
  }
}
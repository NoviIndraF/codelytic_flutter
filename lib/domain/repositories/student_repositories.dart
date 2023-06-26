import 'package:codelytic/data/model/request/quiz/get_quiz_by_room_id_request.dart';
import 'package:codelytic/domain/entities/quiz/get_quiz_by_room_code_entity.dart';
import 'package:codelytic/domain/entities/student/get_student_entity.dart';
import 'package:dartz/dartz.dart';

abstract class StudentRepositories{
  Future<Either<String, GetStudentEntity>> getStudent(String token);
}
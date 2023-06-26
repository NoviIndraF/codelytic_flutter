import 'package:codelytic/data/model/request/quiz/get_quiz_by_level_and_room_id_request.dart';
import 'package:codelytic/data/model/request/quiz/get_quiz_by_room_id_request.dart';
import 'package:codelytic/data/model/request/quiz/get_student_quiz_by_id_request.dart';
import 'package:codelytic/data/model/request/quiz/get_student_quiz_by_room_id.dart';
import 'package:codelytic/data/model/request/quiz/submit_quiz_request.dart';
import 'package:codelytic/domain/entities/quiz/get_quiz_by_level_and_room_id_entity.dart';
import 'package:codelytic/domain/entities/quiz/get_quiz_by_room_code_entity.dart';
import 'package:codelytic/domain/entities/quiz/get_student_quiz_by_id_entity.dart';
import 'package:codelytic/domain/entities/quiz/get_student_quiz_by_room_id_entity.dart';
import 'package:codelytic/domain/entities/quiz/submit_quiz_entity.dart';
import 'package:dartz/dartz.dart';

abstract class QuizRepositories{
  Future<Either<String, GetQuizByRoomIdEntity>> getQuizByRoomId(String token, GetQuizByRoomIdRequest request);
  Future<Either<String, GetQuizByLevelAndRoomIdEntity>> getQuizByLevelAndRoomId(String token, GetQuizByLevelAndRoomIdRequest request);
  Future<Either<String, GetStudentQuizByIdEntity>> getStudentQuizById(String token, GetStudentQuizByIdRequest request);
  Future<Either<String, GetStudentQuizByRoomIdEntity>> getStudentQuizByRoomId(String token, GetStudentQuizByRoomIdRequest request);

  Future<Either<String, SubmitQuizEntity>> submitQuiz(String token, SubmitQuizRequest request);

}
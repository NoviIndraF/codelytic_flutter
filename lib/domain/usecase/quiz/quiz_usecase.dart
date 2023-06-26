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
import 'package:codelytic/domain/repositories/quiz_repositories.dart';
import 'package:dartz/dartz.dart';

class QuizUsecase{
  final QuizRepositories quizRepositories;
  QuizUsecase(this.quizRepositories);

  Future<Either<String, GetQuizByRoomIdEntity>> getQuizByRoomCode(String token, GetQuizByRoomIdRequest request){
    return quizRepositories.getQuizByRoomId(token, request);
  }

  Future<Either<String, GetQuizByLevelAndRoomIdEntity>> getQuizByLevelAndRoomId(String token, GetQuizByLevelAndRoomIdRequest request){
    return quizRepositories.getQuizByLevelAndRoomId(token, request);
  }

  Future<Either<String, GetStudentQuizByIdEntity>> getStudentQuizById(String token, GetStudentQuizByIdRequest request){
    return quizRepositories.getStudentQuizById(token, request);
  }

  Future<Either<String, GetStudentQuizByRoomIdEntity>> getStudentQuizByRoomId(String token, GetStudentQuizByRoomIdRequest request){
    return quizRepositories.getStudentQuizByRoomId(token, request);
  }

  Future<Either<String, SubmitQuizEntity>> submitQuiz(String token, SubmitQuizRequest request){
    return quizRepositories.submitQuiz(token, request);
  }
}
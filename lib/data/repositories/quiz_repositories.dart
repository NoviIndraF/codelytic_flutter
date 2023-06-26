import 'package:codelytic/data/datasource/network/quiz/quiz_remote_data_source_impl.dart';
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

class QuizRepositoriesImpl implements QuizRepositories{
  final QuizRemoteDataSourceImpl quizRemoteDataSourceImpl;

  QuizRepositoriesImpl(
      {required this.quizRemoteDataSourceImpl});

  @override
  Future<Either<String, GetQuizByRoomIdEntity>> getQuizByRoomId(String token, GetQuizByRoomIdRequest request) async {
    try {
      final result = await quizRemoteDataSourceImpl.getQuizByRoomId(token, request);
      return Right(result.toEntity());
    }
    catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, GetQuizByLevelAndRoomIdEntity>> getQuizByLevelAndRoomId(String token, GetQuizByLevelAndRoomIdRequest request) async {
    try {
      final result = await quizRemoteDataSourceImpl.getQuizByLevelAndRoomId(token, request);
      return Right(result.toEntity());
    }
    catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, SubmitQuizEntity>> submitQuiz(String token, SubmitQuizRequest request) async {
    try {
      final result = await quizRemoteDataSourceImpl.submitQuiz(token, request);
      return Right(result.toEntity());
    }
    catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, GetStudentQuizByIdEntity>> getStudentQuizById(String token, GetStudentQuizByIdRequest request) async {
    try {
      final result = await quizRemoteDataSourceImpl.getStudentQuizById(token, request);
      return Right(result.toEntity());
    }
    catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, GetStudentQuizByRoomIdEntity>> getStudentQuizByRoomId(String token, GetStudentQuizByRoomIdRequest request) async {
    try {
      final result = await quizRemoteDataSourceImpl.getStudentQuizByRoomId(token, request);
      return Right(result.toEntity());
    }
    catch (e) {
      return Left(e.toString());
    }
  }

}
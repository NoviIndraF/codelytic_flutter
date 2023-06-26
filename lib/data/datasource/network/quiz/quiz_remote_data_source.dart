import 'package:codelytic/data/model/request/quiz/get_quiz_by_level_and_room_id_request.dart';
import 'package:codelytic/data/model/request/quiz/get_quiz_by_room_id_request.dart';
import 'package:codelytic/data/model/request/quiz/get_student_quiz_by_id_request.dart';
import 'package:codelytic/data/model/request/quiz/get_student_quiz_by_room_id.dart';
import 'package:codelytic/data/model/request/quiz/submit_quiz_request.dart';
import 'package:codelytic/data/model/response/quiz/get_quiz_by_level_and_room_id.dart';
import 'package:codelytic/data/model/response/quiz/get_quiz_by_room_id_response.dart';
import 'package:codelytic/data/model/response/quiz/get_student_quiz_by_id_response.dart';
import 'package:codelytic/data/model/response/quiz/get_student_quiz_by_room_id_response.dart';
import 'package:codelytic/data/model/response/quiz/submit_quiz_response.dart';

abstract class QuizRemoteDataSource{
  Future<GetQuizByRoomIdResponse> getQuizByRoomId(String token, GetQuizByRoomIdRequest request);
  Future<GetQuizByLevelAndRoomIdResponse> getQuizByLevelAndRoomId(String token, GetQuizByLevelAndRoomIdRequest request);

  Future<GetStudentQuizByIdResponse> getStudentQuizById(String token, GetStudentQuizByIdRequest request);
  Future<GetStudentQuizByRoomIdResponse> getStudentQuizByRoomId(String token, GetStudentQuizByRoomIdRequest request);

  Future<SubmitQuizResponse> submitQuiz(String token, SubmitQuizRequest request);
}
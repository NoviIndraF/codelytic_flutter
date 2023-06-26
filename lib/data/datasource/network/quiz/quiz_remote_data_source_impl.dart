import 'dart:convert';

import 'package:codelytic/common/constant.dart';
import 'package:codelytic/data/datasource/network/quiz/quiz_remote_data_source.dart';
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
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class QuizRemoteDataSourceImpl implements QuizRemoteDataSource {

  Dio dio;
  final http.Client client;
  QuizRemoteDataSourceImpl({required this.dio, required this.client});

  @override
  Future<GetQuizByRoomIdResponse> getQuizByRoomId(String token, GetQuizByRoomIdRequest requester) async {
    final request = await http.post(
      Uri.parse('${Constant.baseUrl}getQuizByRoomId'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      body: jsonEncode(requester.toMap()),
    );

    final response = jsonDecode(request.body);
    if (response['meta']['code'] == 200) {
      if(response['data'] == null){
        return GetQuizByRoomIdResponse();
      }
      return GetQuizByRoomIdResponse.fromJson(response['data']);
    } else {
      throw Exception(response['message']);
    }
  }

  @override
  Future<GetQuizByLevelAndRoomIdResponse> getQuizByLevelAndRoomId(String token, GetQuizByLevelAndRoomIdRequest requester) async {
    final request = await http.post(
      Uri.parse('${Constant.baseUrl}getQuizzesByLevelAndRoomId'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      body: jsonEncode(requester.toMap()),
    );

    final response = jsonDecode(request.body);
    if (response['meta']['code'] == 200) {
      if (response['data'] == null) {
        return GetQuizByLevelAndRoomIdResponse();
      }
      return GetQuizByLevelAndRoomIdResponse.fromJson(response);
    } else {
      throw Exception(response['message']);
    }
  }

  @override
  Future<SubmitQuizResponse> submitQuiz(String token, SubmitQuizRequest requester) async {
    final request = await http.post(
      Uri.parse('${Constant.baseUrl}submitQuiz'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      body: jsonEncode(requester.toMap()),
    );

    final response = jsonDecode(request.body);
    if (response['meta']['code'] == 200) {
      if(response['data'] == null){
        return SubmitQuizResponse();
      }
      return SubmitQuizResponse.fromJson(response['data']);
    } else {
      throw Exception(response['message']);
    }
  }

  @override
  Future<GetStudentQuizByIdResponse> getStudentQuizById(String token, GetStudentQuizByIdRequest requester) async {
    final request = await http.post(
      Uri.parse('${Constant.baseUrl}getStudentQuizById'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      body: jsonEncode(requester.toMap()),
    );

    final response = jsonDecode(request.body);
    if (response['meta']['code'] == 200) {
      if(response['data'] == null){
        return GetStudentQuizByIdResponse();
      }
      return GetStudentQuizByIdResponse.fromJson(response);
    } else {
      throw Exception(response['message']);
    }
  }

  @override
  Future<GetStudentQuizByRoomIdResponse> getStudentQuizByRoomId(String token, GetStudentQuizByRoomIdRequest requester) async {
    final request = await http.post(
      Uri.parse('${Constant.baseUrl}getStudentQuizByRoomId'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      body: jsonEncode(requester.toMap()),
    );

    final response = jsonDecode(request.body);
    if (response['meta']['code'] == 200) {
      if(response['data'] == null){
        return GetStudentQuizByRoomIdResponse();
      }
      return GetStudentQuizByRoomIdResponse.fromJson(response);
    } else {
      throw Exception(response['message']);
    }
  }
}
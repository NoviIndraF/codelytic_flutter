import 'dart:convert';

import 'package:codelytic/common/constant.dart';
import 'package:codelytic/data/datasource/network/quiz/quiz_remote_data_source.dart';
import 'package:codelytic/data/datasource/network/student/student_remote_data_source.dart';
import 'package:codelytic/data/model/request/quiz/get_quiz_by_room_id_request.dart';
import 'package:codelytic/data/model/response/quiz/get_quiz_by_room_id_response.dart';
import 'package:codelytic/data/model/response/student/get_student_response.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class StudentRemoteDataSourceImpl implements StudentRemoteDataSource {

  Dio dio;
  final http.Client client;
  StudentRemoteDataSourceImpl({required this.dio, required this.client});

  @override
  Future<GetStudentResponse> getStudent(String token) async {
    final request = await http.post(
      Uri.parse('${Constant.baseUrl}getStudent'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
    );

    final response = jsonDecode(request.body);
    if (response['meta']['code'] == 200) {
      if(response['data'] == null){
        return GetStudentResponse();
      }
      return GetStudentResponse.fromJson(response['data']);
    } else {
      throw Exception(response['message']);
    }
  }
}
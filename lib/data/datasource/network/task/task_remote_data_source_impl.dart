import 'dart:convert';

import 'package:codelytic/common/constant.dart';
import 'package:codelytic/data/datasource/network/task/task_remote_data_source.dart';
import 'package:codelytic/data/model/request/task/get_student_task_by_room_id_request.dart';
import 'package:codelytic/data/model/request/task/get_task_by_room_code_request.dart';
import 'package:codelytic/data/model/request/task/submit_task_request.dart';
import 'package:codelytic/data/model/response/task/get_student_task_by_room_id.dart';
import 'package:codelytic/data/model/response/task/get_task_by_room_code_response.dart';
import 'package:codelytic/data/model/response/task/submit_task_response.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {

  Dio dio;
  final http.Client client;
  TaskRemoteDataSourceImpl({required this.dio, required this.client});

  @override
  Future<GetTaskByRoomCodeResponse> getTaskByRoomId(String token, GetTaskByRoomIdRequest requester) async {
    final request = await http.post(
      Uri.parse('${Constant.baseUrl}getTaskByRoomId'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      body: jsonEncode(requester.toMap()),
    );

    final response = jsonDecode(request.body);
    if (response['meta']['code'] == 200) {
      if(response['data'] == null){
        return GetTaskByRoomCodeResponse();
      }
      return GetTaskByRoomCodeResponse.fromJson(response['data']);
    } else {
      throw Exception(response['message']);
    }
  }


  @override
  Future<SubmitTaskResponse> submitTask(String token, SubmitTaskRequest requester) async {
    final request = await http.post(
      Uri.parse('${Constant.baseUrl}submitTask'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      body: jsonEncode(requester.toMap()),
    );

    final response = jsonDecode(request.body);
    if (response['meta']['code'] == 200) {
      if(response['data'] == null){
        return SubmitTaskResponse();
      }
      return SubmitTaskResponse.fromJson(response['data']);
    } else {
      throw Exception(response['message']);
    }
  }

  @override
  Future<GetStudentTaskByRoomIdResponse> getStudentTask(String token, GetStudentTaskByRoomIdRequest requester) async {
    final request = await http.post(
      Uri.parse('${Constant.baseUrl}getStudentTask'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      body: jsonEncode(requester.toMap()),
    );

    final response = jsonDecode(request.body);
    if (response['meta']['code'] == 200) {
      if(response['data'] == null){
        return GetStudentTaskByRoomIdResponse();
      }
      return GetStudentTaskByRoomIdResponse.fromJson(response);
    } else {
      throw Exception(response['message']);
    }
  }
}
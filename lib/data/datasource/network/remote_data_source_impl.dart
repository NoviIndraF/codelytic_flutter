import 'dart:convert';

import 'package:codelytic/common/constant.dart';
import 'package:codelytic/data/model/request/authentication/get_room_by_code_request.dart';
import 'package:codelytic/data/model/request/authentication/login_request.dart';
import 'package:codelytic/data/model/request/authentication/register_room_request.dart';
import 'package:codelytic/data/model/request/authentication/register_request.dart';
import 'package:codelytic/data/model/request/home/get_materi_by_room_code_request.dart';
import 'package:codelytic/data/model/request/materi/get_materi_by_room_id_request.dart';
import 'package:codelytic/data/model/response/authentication/auth_register_room_response.dart';
import 'package:codelytic/data/model/response/authentication/auth_response.dart';
import 'package:codelytic/data/model/response/authentication/get_student_room_response.dart';
import 'package:codelytic/data/model/response/authentication/authentication.dart';
import 'package:codelytic/data/datasource/network/remote_data_source.dart';
import 'package:codelytic/data/model/response/authentication/get_room_by_code_response.dart';
import 'package:codelytic/data/model/response/home/get_all_data_by_room_code_response.dart';
import 'package:codelytic/data/model/response/materi/get_materi_by_room_id_response.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class RemoteDataSourceImpl implements RemoteDataSource {

  Dio dio;
  final http.Client client;
  RemoteDataSourceImpl({required this.dio, required this.client});
  @override
  Future<Authentication> login(LoginRequest register) async {

    dio = Dio();

    final request = await http.post(
      Uri.parse('${Constant.baseUrl}login'),
      body: register.toMap(),
    );
    final response = jsonDecode(request.body);

    if (response['meta']['code'] == 200) {
      return Authentication.fromJson(response['data']);
    } else {
      throw Exception([response['meta']['code'], response['data']['message']]);
    }
  }

  @override
  Future<Authentication> register(RegisterRequest register) async {
    // TODO: implement register
    final request = await http.post(
      Uri.parse('${Constant.baseUrl}register'),
      body: register.toMap(),
    );

    final response = jsonDecode(request.body);
    if (response['meta']['code'] == 200) {
      return Authentication.fromJson(response['data']);
    } else {
      throw Exception([response['meta']['code'], response['data']['message']]);
    }
  }

  @override
  Future<AuthResponse> logout(String token) async {
    // TODO: implement logout
    final request = await http.post(
      Uri.parse('${Constant.baseUrl}logout'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
    );

    final response = jsonDecode(request.body);
    if (response['meta']['code'] == 200) {
      return AuthResponse.fromJson(response);
    } else {
      throw Exception(response['message']);
    }
  }

  @override
  Future<GetStudentRoomResponse> getStudentRoom(String token) async {
    final request = await http.post(
      Uri.parse('${Constant.baseUrl}getStudentRoom'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
    );

    final response = jsonDecode(request.body);
    if (response['meta']['code'] == 200) {
      return GetStudentRoomResponse.fromJson(response);
    } else {
      throw Exception(response['message']);
    }
  }

  @override
  Future<GetRoomByCodeResponse> getRoomByCode(String token, GetRoomByCodeRequest code) async {
    final request = await http.post(
      Uri.parse('${Constant.baseUrl}getRoomByCode'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      body: jsonEncode(code.toMap()),
    );

    final response = jsonDecode(request.body);
    if (response['meta']['code'] == 200) {
      if(response['data'] == null){
        return GetRoomByCodeResponse();
      }
      return GetRoomByCodeResponse.fromJson(response['data']);
    } else {
      throw Exception(response['message']);
    }
  }

  @override
  Future<AuthRegisterRoomResponse> createStudentRoom(String token, RegisterRoomRequest registerRoomRequest) async {
    final request = await http.post(
      Uri.parse('${Constant.baseUrl}createStudentRoom'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      body: jsonEncode(registerRoomRequest.toMap()),
    );

    final response = jsonDecode(request.body);
    if (response['meta']['code'] == 200) {
      if(response['data'] == null){
        return AuthRegisterRoomResponse();
      }
      return AuthRegisterRoomResponse.fromJson(response['data']);
    } else {
      throw Exception(response['message']);
    }
  }

  @override
  Future<Student> getStudent(String token) async {
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
        return Student();
      }
      return Student.fromJson(response['data']);
    } else {
      throw Exception(response['message']);
    }
  }
}

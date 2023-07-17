import 'dart:convert';

import 'package:codelytic/common/constant.dart';
import 'package:codelytic/data/model/request/discussion/get_group_by_code_request.dart';
import 'package:codelytic/data/model/request/discussion/get_student_group_by_room_id_request.dart';
import 'package:codelytic/data/model/request/discussion/get_student_group_comment_by_group_id_request.dart';
import 'package:codelytic/data/model/request/discussion/register_student_group_request.dart';
import 'package:codelytic/data/model/request/discussion/send_student_group_coment_request.dart';
import 'package:codelytic/data/model/request/discussion/update_hide_student_group_comment_request.dart';
import 'package:codelytic/data/model/response/discussion/get_group_by_code_response.dart';
import 'package:codelytic/data/model/response/discussion/get_student_group_by_room_id_response.dart';
import 'package:codelytic/data/model/response/discussion/get_student_group_comment_by_group_id_response.dart';
import 'package:codelytic/data/model/response/discussion/register_student_group_response.dart';
import 'package:codelytic/data/model/response/discussion/send_student_group_comment_response.dart';
import 'package:codelytic/data/model/response/discussion/update_hide_student_group_comment_response.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'discussion_remote_data_source.dart';

class DiscussionRemoteDataSourceImpl implements DiscussionRemoteDataSource {

  Dio dio;
  final http.Client client;
  DiscussionRemoteDataSourceImpl({required this.dio, required this.client});

  @override
  Future<GetGroupByCodeResponse> getGroupByCode(String token, GetGroupByCodeRequest requester) async {
    final request = await http.post(
      Uri.parse('${Constant.baseUrl}getGroupByCode'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      body: jsonEncode(requester.toMap()),
    );

    final response = jsonDecode(request.body);
    if (response['meta']['code'] == 200) {
      if(response['data'] == null){
        return GetGroupByCodeResponse();
      }
      return GetGroupByCodeResponse.fromJson(response);
    } else {
      throw Exception(response['message']);
    }
  }

  @override
  Future<GetStudentGroupByRoomIdResponse> getStudentGroupByRoomId(String token, GetStudentGroupByRoomIdRequest requester) async {
    final request = await http.post(
      Uri.parse('${Constant.baseUrl}getStudentGroupByRoomId'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      body: jsonEncode(requester.toMap()),
    );

    final response = jsonDecode(request.body);
    if (response['meta']['code'] == 200) {
      if(response['data'] == null || response['data'].isEmpty){
        return GetStudentGroupByRoomIdResponse();
      }
      return GetStudentGroupByRoomIdResponse.fromJson(response);
    } else {
      throw Exception(response['message']);
    }
  }

  @override
  Future<RegisterStudentGroupResponse> createStudentGroup(String token, RegisterStudentGroupRequest request) async {
    final requester = await http.post(
      Uri.parse('${Constant.baseUrl}createStudentGroup'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      body: jsonEncode(request.toMap()),
    );

    final response = jsonDecode(requester.body);
    if (response['meta']['code'] == 200) {
      if(response['data'] == null){
        return RegisterStudentGroupResponse();
      }
      return RegisterStudentGroupResponse.fromJson(response['data']);
    } else {
      throw Exception(response['message']);
    }
  }

  @override
  Future<GetStudentGroupCommentByGroupIdResponse> getStudentGroupCommentByGroupId(String token, GetStudentGroupCommentByGroupIdRequest request) async {
    final requester = await http.post(
      Uri.parse('${Constant.baseUrl}getStudentGroupCommentByGroupId'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      body: jsonEncode(request.toMap()),
    );

    final response = jsonDecode(requester.body);
    if (response['meta']['code'] == 200) {
      if(response['data'] == null || response['data'].isEmpty){
        return GetStudentGroupCommentByGroupIdResponse();
      }
      return GetStudentGroupCommentByGroupIdResponse.fromJson(response);
    } else {
      throw Exception(response['message']);
    }
  }

  @override
  Future<SendStudentGroupCommentResponse> sendStudentGroupComment(String token, SendStudentGroupCommentRequest request) async {
    final requester = await http.post(
      Uri.parse('${Constant.baseUrl}sendStudentGroupComment'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      body: jsonEncode(request.toMap()),
    );

    final response = jsonDecode(requester.body);
    if (response['meta']['code'] == 200) {
      if(response['data'] == null || response['data'].isEmpty){
        return SendStudentGroupCommentResponse();
      }
      return SendStudentGroupCommentResponse.fromJson(response);
    } else {
      throw Exception(response['message']);
    }
  }

  @override
  Future<UpdateHideStudentGroupCommentResponse> updateHideStudentGroupComment(String token, UpdateHideStudentGroupCommentRequest request) async {
    final requester = await http.post(
      Uri.parse('${Constant.baseUrl}updateStudentGroupCommentHide'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      body: jsonEncode(request.toMap()),
    );

    final response = jsonDecode(requester.body);
    if (response['meta']['code'] == 200) {
      if(response['data'] == null || response['data'].isEmpty){
        return UpdateHideStudentGroupCommentResponse();
      }
      return UpdateHideStudentGroupCommentResponse.fromJson(response);
    } else {
      throw Exception(response['message']);
    }
  }
}
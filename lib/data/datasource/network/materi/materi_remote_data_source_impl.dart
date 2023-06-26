import 'dart:convert';

import 'package:codelytic/common/constant.dart';
import 'package:codelytic/data/model/request/materi/get_chapter_by_materi_id_request.dart';
import 'package:codelytic/data/model/request/materi/get_materi_by_room_id_request.dart';
import 'package:codelytic/data/model/request/task/submit_task_request.dart';
import 'package:codelytic/data/model/response/materi/get_chapter_by_materi_id.dart';
import 'package:codelytic/data/model/response/materi/get_materi_by_room_id_response.dart';
import 'package:codelytic/data/model/response/task/submit_task_response.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'materi_remote_data_source.dart';

class MateriRemoteDataSourceImpl implements MateriRemoteDataSource {

  Dio dio;
  final http.Client client;
  MateriRemoteDataSourceImpl({required this.dio, required this.client});

  @override
  Future<GetMateriByRoomIdResponse> getMateriByRoomId(String token, GetMateriByRoomIdRequest requester) async {
    final request = await http.post(
      Uri.parse('${Constant.baseUrl}getMateriByRoomId'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      body: jsonEncode(requester.toMap()),
    );

    final response = jsonDecode(request.body);
    if (response['meta']['code'] == 200) {
      if(response['data'] == null){
        return GetMateriByRoomIdResponse();
      }
      return GetMateriByRoomIdResponse.fromJson(response['data']);
    } else {
      throw Exception(response['message']);
    }
  }

  @override
  Future<GetChapterByMateriIdResponse> getChapterByMateriId(String token, GetChapterByMateriIdRequest requester) async {
    final request = await http.post(
      Uri.parse('${Constant.baseUrl}getChapterByMateriId'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      body: jsonEncode(requester.toMap()),
    );

    final response = jsonDecode(request.body);
    if (response['meta']['code'] == 200) {
      if(response['data'] == null){
        return GetChapterByMateriIdResponse();
      }
      return GetChapterByMateriIdResponse.fromJson(response['data']);
    } else {
      throw Exception(response['message']);
    }
  }

}
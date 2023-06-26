import 'dart:convert';

import 'package:codelytic/common/constant.dart';
import 'package:codelytic/data/datasource/network/room/room_remote_data_source.dart';
import 'package:codelytic/data/model/request/room/get_room_by_id_request.dart';
import 'package:codelytic/data/model/response/room/get_room_by_id_response.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class RoomRemoteDataSourceImpl implements RoomRemoteDataSource {

  Dio dio;
  final http.Client client;
  RoomRemoteDataSourceImpl({required this.dio, required this.client});

  @override
  Future<GetRoomByIdResponse> getRoomById(String token, GetRoomByIdRequest requester) async {
    final request = await http.post(
      Uri.parse('${Constant.baseUrl}getRoomById'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '$token',
      },
      body: jsonEncode(requester.toMap()),
    );

    final response = jsonDecode(request.body);
    if (response['meta']['code'] == 200) {
      if(response['data'] == null){
        return GetRoomByIdResponse();
      }
      return GetRoomByIdResponse.fromJson(response['data']);
    } else {
      throw Exception(response['message']);
    }
  }
}
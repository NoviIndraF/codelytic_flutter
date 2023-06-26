
import 'package:codelytic/data/model/request/room/get_room_by_id_request.dart';
import 'package:codelytic/data/model/response/room/get_room_by_id_response.dart';

abstract class RoomRemoteDataSource{
  Future<GetRoomByIdResponse> getRoomById(String token, GetRoomByIdRequest request);

}
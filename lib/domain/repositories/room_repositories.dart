import 'package:codelytic/data/model/request/quiz/get_quiz_by_room_id_request.dart';
import 'package:codelytic/data/model/request/room/get_room_by_id_request.dart';
import 'package:codelytic/domain/entities/quiz/get_quiz_by_room_code_entity.dart';
import 'package:codelytic/domain/entities/room/get_room_by_code_entity.dart';
import 'package:dartz/dartz.dart';

abstract class RoomRepositories{
  Future<Either<String, GetRoomByIdEntity>> getRoomById(String token, GetRoomByIdRequest request);

}
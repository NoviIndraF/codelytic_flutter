import 'package:codelytic/data/model/request/quiz/get_quiz_by_room_id_request.dart';
import 'package:codelytic/data/model/request/room/get_room_by_id_request.dart';
import 'package:codelytic/domain/entities/quiz/get_quiz_by_room_code_entity.dart';
import 'package:codelytic/domain/entities/room/get_room_by_code_entity.dart';
import 'package:codelytic/domain/repositories/quiz_repositories.dart';
import 'package:codelytic/domain/repositories/room_repositories.dart';
import 'package:dartz/dartz.dart';

class RoomUsecase{
  final RoomRepositories roomRepositories;
  RoomUsecase(this.roomRepositories);

  Future<Either<String, GetRoomByIdEntity>> getRoomByRoomCode(String token, GetRoomByIdRequest request){
    return roomRepositories.getRoomById(token, request);
  }

}
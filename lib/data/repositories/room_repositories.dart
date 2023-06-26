import 'package:codelytic/data/datasource/network/quiz/quiz_remote_data_source_impl.dart';
import 'package:codelytic/data/datasource/network/room/room_remote_data_source_impl.dart';
import 'package:codelytic/data/model/request/quiz/get_quiz_by_room_id_request.dart';
import 'package:codelytic/data/model/request/room/get_room_by_id_request.dart';
import 'package:codelytic/domain/entities/quiz/get_quiz_by_room_code_entity.dart';
import 'package:codelytic/domain/entities/room/get_room_by_code_entity.dart';
import 'package:codelytic/domain/repositories/quiz_repositories.dart';
import 'package:codelytic/domain/repositories/room_repositories.dart';
import 'package:dartz/dartz.dart';

class RoomRepositoriesImpl implements RoomRepositories{
  final RoomRemoteDataSourceImpl roomRemoteDataSourceImpl;

  RoomRepositoriesImpl(
      {required this.roomRemoteDataSourceImpl});

  @override
  Future<Either<String, GetRoomByIdEntity>> getRoomById(String code, GetRoomByIdRequest request) async {
    try {
      final result = await roomRemoteDataSourceImpl.getRoomById(code, request);
      return Right(result.toEntity());
    }
    catch (e) {
      return Left(e.toString());
    }
  }

}
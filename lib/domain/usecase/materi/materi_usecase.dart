import 'package:codelytic/data/model/request/home/get_materi_by_room_code_request.dart';
import 'package:codelytic/data/model/request/materi/get_chapter_by_materi_id_request.dart';
import 'package:codelytic/data/model/request/materi/get_materi_by_room_id_request.dart';
import 'package:codelytic/domain/entities/authentication/authentication_entity.dart';
import 'package:codelytic/domain/entities/home/get_all_data_by_room_code_response_entity.dart';
import 'package:codelytic/domain/entities/materi/get_chapter_by_materi_id_entity.dart';
import 'package:codelytic/domain/entities/materi/get_materi_by_room_code_entity.dart';
import 'package:codelytic/domain/repositories/home_repositories.dart';
import 'package:codelytic/domain/repositories/materi_repositories.dart';
import 'package:dartz/dartz.dart';

class MateriUsecase{
  final MateriRepositories materiRepositories;
  MateriUsecase(this.materiRepositories);

  Future<Either<String, GetChapterByMateriIdEntity>> getChapterByMateriId(String token, GetChapterByMateriIdRequest request){
    return materiRepositories.getChapterByMateriId(token, request);
  }
  Future<Either<String, GetMateriByRoomIdResponseEntity>> getMateriByRoomId(String token, GetMateriByRoomIdRequest request){
    return materiRepositories.getMateriByRoomId(token, request);
  }
}
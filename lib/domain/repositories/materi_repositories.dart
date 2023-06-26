import 'package:codelytic/data/model/request/materi/get_chapter_by_materi_id_request.dart';
import 'package:codelytic/data/model/request/materi/get_materi_by_room_id_request.dart';
import 'package:codelytic/data/model/request/task/submit_task_request.dart';
import 'package:codelytic/domain/entities/materi/get_chapter_by_materi_id_entity.dart';
import 'package:codelytic/domain/entities/materi/get_materi_by_room_code_entity.dart';
import 'package:codelytic/domain/entities/task/submit_task_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MateriRepositories{

  Future<Either<String, GetChapterByMateriIdEntity>> getChapterByMateriId(String token, GetChapterByMateriIdRequest request);
  Future<Either<String, GetMateriByRoomIdResponseEntity>> getMateriByRoomId(String token, GetMateriByRoomIdRequest request);
}
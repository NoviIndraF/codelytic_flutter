import 'package:codelytic/data/datasource/local/shared_preference_data_source_impl.dart';
import 'package:codelytic/data/datasource/network/materi/materi_remote_data_source_impl.dart';
import 'package:codelytic/data/datasource/network/remote_data_source_impl.dart';
import 'package:codelytic/data/model/request/materi/get_chapter_by_materi_id_request.dart';
import 'package:codelytic/data/model/request/materi/get_materi_by_room_id_request.dart';
import 'package:codelytic/data/model/request/task/submit_task_request.dart';
import 'package:codelytic/domain/entities/authentication/get_materi_by_room_code_entity.dart';
import 'package:codelytic/domain/entities/materi/get_chapter_by_materi_id_entity.dart';
import 'package:codelytic/domain/entities/materi/get_materi_by_room_code_entity.dart';
import 'package:codelytic/domain/entities/task/submit_task_entity.dart';
import 'package:codelytic/domain/repositories/materi_repositories.dart';
import 'package:dartz/dartz.dart';

class MateriRepositoriesImpl implements MateriRepositories{
  final MateriRemoteDataSourceImpl materiRemoteDataSourceImpl;
  final SharedPreferencesDataSourceImpl sharedPreferencesDataSourceImpl;

  MateriRepositoriesImpl(
      {required this.materiRemoteDataSourceImpl, required this.sharedPreferencesDataSourceImpl});

  @override
  Future<Either<String, GetMateriByRoomIdResponseEntity>> getMateriByRoomId(String token, GetMateriByRoomIdRequest request) async {
    try {
      final result = await materiRemoteDataSourceImpl.getMateriByRoomId(token, request);
      return Right(result.toEntity());
    }
    catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, GetChapterByMateriIdEntity>> getChapterByMateriId(String token, GetChapterByMateriIdRequest request) async {
    try {
      final result = await materiRemoteDataSourceImpl.getChapterByMateriId(token, request);
      return Right(result.toEntity());
    }
    catch (e) {
      return Left(e.toString());
    }
  }
}
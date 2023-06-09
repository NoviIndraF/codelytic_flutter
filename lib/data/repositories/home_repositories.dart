import 'package:codelytic/data/datasource/local/shared_preference_data_source_impl.dart';
import 'package:codelytic/data/datasource/network/remote_data_source_impl.dart';
import 'package:codelytic/data/model/request/home/get_materi_by_room_code_request.dart';
import 'package:codelytic/domain/entities/authentication/authentication_entity.dart';
import 'package:codelytic/domain/entities/home/get_all_data_by_room_code_entity.dart';
import 'package:codelytic/domain/repositories/home_repositories.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoriesImpl implements HomeRepositories {
  final RemoteDataSourceImpl remoteDataSourceImpl;
  final SharedPreferencesDataSourceImpl sharedPreferencesDataSourceImpl;

  HomeRepositoriesImpl(
      {required this.remoteDataSourceImpl, required this.sharedPreferencesDataSourceImpl});

  @override
  Future<Either<String, GetAllDataByRoomCodeEntity>> getAllDataByRoomCode(String token, GetAllDataByRoomCodeRequest getAllDataByRoomCodeRequest) async {
    try {
      final result = await remoteDataSourceImpl.getAllDataByRoomCode(token, getAllDataByRoomCodeRequest);
      return Right(result.toEntity());
    }
    catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> deteleToSharedPref(String name) async {
    try {
      final result = await sharedPreferencesDataSourceImpl.deteleToSharedPref(name);
      return Right(result);
    }
    catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> getToSharedPref(String name) async {
    try {
      final result = await sharedPreferencesDataSourceImpl.getToSharedPref(name);
      return Right(result);
    }
    catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> saveToSharedpref(String name, String value) async {
    try {
      final result = await sharedPreferencesDataSourceImpl.saveToSharedpref(name, value);
      return Right(result);
    }
    catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, StudentEntity>> getStudent(String token) async {
    try {
      final result = await remoteDataSourceImpl.getStudent(token);
      return Right(result.toEntity());
    }
    catch (e) {
      return Left(e.toString());
    }
  }
}
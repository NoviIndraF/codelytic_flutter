import 'package:codelytic/data/datasource/local/shared_preference_data_source_impl.dart';
import 'package:codelytic/data/datasource/network/remote_data_source_impl.dart';
import 'package:codelytic/data/model/request/authentication/get_room_by_code_request.dart';
import 'package:codelytic/data/model/request/authentication/login_request.dart';
import 'package:codelytic/data/model/request/authentication/register_room_request.dart';
import 'package:codelytic/data/model/request/authentication/register_request.dart';
import 'package:codelytic/data/model/request/home/get_materi_by_room_code_request.dart';
import 'package:codelytic/data/model/response/authentication/auth_response.dart';
import 'package:codelytic/domain/entities/authentication/auth_register_room_response_entity.dart';
import 'package:codelytic/domain/entities/authentication/get_student_room_response_entity.dart';
import 'package:codelytic/domain/entities/authentication/authentication_entity.dart';
import 'package:codelytic/domain/entities/authentication/get_room_by_code_response_entity.dart';
import 'package:codelytic/domain/entities/home/get_all_data_by_room_code_response_entity.dart';
import 'package:codelytic/domain/repositories/auth_repositories.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoriesImpl implements AuthRepositories {
  final RemoteDataSourceImpl remoteDataSourceImpl;
  final SharedPreferencesDataSourceImpl sharedPreferencesDataSourceImpl;

  AuthRepositoriesImpl(
      {required this.remoteDataSourceImpl, required this.sharedPreferencesDataSourceImpl});

  @override
  Future<Either<String, AuthenticationEntity>> login(
      LoginRequest loginRequest) async {
    // TODO: implement login
    try {
      final result = await remoteDataSourceImpl.login(loginRequest);
      return Right(result.toEntity());
    }
    catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, AuthResponse>> logout(String token) async {
    try {
      final result = await remoteDataSourceImpl.logout(token);
      return Right(result);
    }
    catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> deteleToSharedPref(String name) async{
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
  Future<Either<String, String>> hasToken() async {
    try {
      final result = await sharedPreferencesDataSourceImpl.hasToken();
      return Right(result);
    }
    catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, AuthenticationEntity>> register(
      RegisterRequest registerRequest) async {
    // TODO: implement register
    try {
      final result = await remoteDataSourceImpl.register(registerRequest);
      return Right(result.toEntity());
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
  Future<Either<String, bool>> setToken(String token) async {
    // TODO: implement loginStudent
    try {
      final result = await sharedPreferencesDataSourceImpl.setLocalToken(token);
      return Right(result);
    }
    catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> unsetToken() async {
    try {
      final result = await sharedPreferencesDataSourceImpl.unsetToken();
      return Right(result);
    }
    catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, GetStudentRoomResponseEntity>> getStudentRoom(String token) async {
    try {
      final result = await remoteDataSourceImpl.getStudentRoom(token);
      return Right(result.toEntity());
    }
    catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, GetRoomByCodeResponseEntity>> getRoomByCode(String token,GetRoomByCodeRequest code) async {
    try {
      final result = await remoteDataSourceImpl.getRoomByCode(token, code);
      return Right(result.toEntity());
    }
    catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, AuthRegisterRoomResponseEntity>> createStudentRoom(String token, RegisterRoomRequest registerRoomRequest) async {
    try {
      final result = await remoteDataSourceImpl.createStudentRoom(token, registerRoomRequest);
      return Right(result.toEntity());
    }
    catch (e) {
      return Left(e.toString());
    }
  }
}
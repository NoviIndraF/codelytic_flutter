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
import 'package:dartz/dartz.dart';

abstract class AuthRepositories{

  Future<Either<String, AuthRegisterRoomResponseEntity>> createStudentRoom(String token, RegisterRoomRequest registerRoomRequest);

  Future<Either<String, GetStudentRoomResponseEntity>> getStudentRoom(String token);
  Future<Either<String, GetRoomByCodeResponseEntity>> getRoomByCode(String token, GetRoomByCodeRequest code);

  Future<Either<String, AuthenticationEntity>> login(LoginRequest loginRequest);
  Future<Either<String, AuthResponse>> logout(String token);

  Future<Either<String, AuthenticationEntity>> register(RegisterRequest registerRequest);

  Future<Either<String, bool>> setToken(String token);
  Future<Either<String, String>> hasToken();
  Future<Either<String, String>> unsetToken();

  Future<Either<String, String>> saveToSharedpref (String name, String value);
  Future<Either<String, String>> getToSharedPref(String name);
  Future<Either<String, String>> deteleToSharedPref(String name);
}
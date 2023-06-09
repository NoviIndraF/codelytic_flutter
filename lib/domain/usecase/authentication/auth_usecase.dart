import 'package:codelytic/data/model/request/authentication/get_room_by_code_request.dart';
import 'package:codelytic/data/model/request/authentication/login_request.dart';
import 'package:codelytic/data/model/request/authentication/register_room_request.dart';
import 'package:codelytic/data/model/request/authentication/register_request.dart';
import 'package:codelytic/data/model/response/authentication/auth_response.dart';
import 'package:codelytic/domain/entities/authentication/auth_register_room_response_entity.dart';
import 'package:codelytic/domain/entities/authentication/get_student_room_response_entity.dart';
import 'package:codelytic/domain/entities/authentication/authentication_entity.dart';
import 'package:codelytic/domain/entities/authentication/get_room_by_code_response_entity.dart';
import 'package:codelytic/domain/repositories/auth_repositories.dart';
import 'package:dartz/dartz.dart';

class AuthUsecase{
  final AuthRepositories authRepositories;
  AuthUsecase(this.authRepositories);

  Future<Either<String, AuthenticationEntity>> registerStudent(RegisterRequest registerRequest){
    return authRepositories.register(registerRequest);
  }

  Future<Either<String, AuthenticationEntity>> loginStudent(LoginRequest loginRequest){
    return authRepositories.login(loginRequest);
  }

  Future<Either<String, GetStudentRoomResponseEntity>> getStudentRoom(String token){
    return authRepositories.getStudentRoom(token);
  }

  Future<Either<String, GetRoomByCodeResponseEntity>> getRoomByCode(String token, GetRoomByCodeRequest code){
    return authRepositories.getRoomByCode(token, code);
  }

  Future<Either<String, AuthRegisterRoomResponseEntity>> createStudentRoom(String token, RegisterRoomRequest registerRoomRequest){
    return authRepositories.createStudentRoom(token, registerRoomRequest);
  }

  Future<Either<String, AuthResponse>> logoutStudent(String token){
    return authRepositories.logout(token);
  }

  Future<Either<String, bool>> setToken(String token){
    return authRepositories.setToken(token);
  }

  Future<Either<String, String>> hasToken(){
    return authRepositories.hasToken();
  }

  Future<Either<String, String>> unsetToken(){
    return authRepositories.unsetToken();
  }

  Future<Either<String, String>> saveToSharedpref(String name, String value){
    return authRepositories.saveToSharedpref(name, value);
  }

  Future<Either<String, String>> getToSharedPref(String name){
    return authRepositories.getToSharedPref(name);
  }

  Future<Either<String, String>> deteleToSharedPref(String name){
    return authRepositories.deteleToSharedPref(name);
  }
}
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

abstract class HomeRepositories{

  Future<Either<String, StudentEntity>> getStudent(String token);

  Future<Either<String, String>> saveToSharedpref (String name, String value);
  Future<Either<String, String>> getToSharedPref(String name);
  Future<Either<String, String>> deteleToSharedPref(String name);
}
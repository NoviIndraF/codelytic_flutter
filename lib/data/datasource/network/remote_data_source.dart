import 'package:codelytic/data/model/request/authentication/get_room_by_code_request.dart';
import 'package:codelytic/data/model/request/authentication/login_request.dart';
import 'package:codelytic/data/model/request/authentication/register_room_request.dart';
import 'package:codelytic/data/model/request/authentication/register_request.dart';
import 'package:codelytic/data/model/request/home/get_materi_by_room_code_request.dart';
import 'package:codelytic/data/model/response/authentication/auth_register_room_response.dart';
import 'package:codelytic/data/model/response/authentication/auth_response.dart';
import 'package:codelytic/data/model/response/authentication/get_student_room_response.dart';
import 'package:codelytic/data/model/response/authentication/authentication.dart';
import 'package:codelytic/data/model/response/authentication/get_room_by_code_response.dart';
import 'package:codelytic/data/model/response/home/get_all_data_by_room_code_response.dart';

abstract class RemoteDataSource {

  Future<AuthRegisterRoomResponse> createStudentRoom(String token, RegisterRoomRequest request);

  Future<GetStudentRoomResponse> getStudentRoom(String token);
  Future<GetRoomByCodeResponse> getRoomByCode(String token, GetRoomByCodeRequest code);
  Future<GetAllDataByRoomCodeResponse> getAllDataByRoomCode(String token, GetAllDataByRoomCodeRequest getAllDataByRoomCodeRequest);
  Future<Student> getStudent(String token);

  Future<Authentication> login (LoginRequest register);
  Future<AuthResponse> logout (String token);
  Future<Authentication> register (RegisterRequest register);
}
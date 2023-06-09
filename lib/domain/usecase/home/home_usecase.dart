import 'package:codelytic/data/model/request/home/get_materi_by_room_code_request.dart';
import 'package:codelytic/domain/entities/authentication/authentication_entity.dart';
import 'package:codelytic/domain/entities/home/get_all_data_by_room_code_entity.dart';
import 'package:codelytic/domain/repositories/home_repositories.dart';
import 'package:dartz/dartz.dart';

class HomeUsecase{
  final HomeRepositories homeRepositories;
  HomeUsecase(this.homeRepositories);

  Future<Either<String, GetAllDataByRoomCodeEntity>> getAllDataByRoomCode(String token, GetAllDataByRoomCodeRequest getAllDataByRoomCodeRequest){
    return homeRepositories.getAllDataByRoomCode(token, getAllDataByRoomCodeRequest);
  }

  Future<Either<String, StudentEntity>> getStudent(String token){
    return homeRepositories.getStudent(token);
  }
  Future<Either<String, String>> saveToSharedpref (String name, String value){
    return homeRepositories.saveToSharedpref(name, value);
  }
  Future<Either<String, String>> getToSharedPref(String name){
    return homeRepositories.getToSharedPref(name);
  }
  Future<Either<String, String>> deteleToSharedPref(String name){
    return homeRepositories.deteleToSharedPref(name);
  }
}
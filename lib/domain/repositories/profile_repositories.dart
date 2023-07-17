import 'package:codelytic/data/model/request/profile/update_profile_request.dart';
import 'package:codelytic/domain/entities/authentication/authentication_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepositories{
  Future<Either<String, StudentEntity>> updateProfile(String token, UpdateProfileRequest request);
}
import 'package:codelytic/data/datasource/network/student/student_remote_data_source_impl.dart';
import 'package:codelytic/data/model/request/profile/update_profile_request.dart';
import 'package:codelytic/domain/entities/authentication/authentication_entity.dart';
import 'package:codelytic/domain/entities/student/get_student_entity.dart';
import 'package:codelytic/domain/repositories/student_repositories.dart';
import 'package:dartz/dartz.dart';

class StudentRepositoriesImpl implements StudentRepositories{
  final StudentRemoteDataSourceImpl studentRemoteDataSourceImpl;

  StudentRepositoriesImpl(
      {required this.studentRemoteDataSourceImpl});

  @override
  Future<Either<String, GetStudentEntity>> getStudent(String token) async {
    try {
      final result = await studentRemoteDataSourceImpl.getStudent(token);
      return Right(result.toEntity());
    }
    catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, StudentEntity>> updateProfile(String token, UpdateProfileRequest request) async {
    try {
      final result = await studentRemoteDataSourceImpl.updateStudent(token, request);
      return Right(result.toEntity());
    }
    catch (e) {
      return Left(e.toString());
    }
  }
}
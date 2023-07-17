import 'package:codelytic/data/datasource/local/shared_preference_data_source_impl.dart';
import 'package:codelytic/data/datasource/network/discussion/discussion_remote_data_source_impl.dart';
import 'package:codelytic/data/model/request/discussion/get_group_by_code_request.dart';
import 'package:codelytic/data/model/request/discussion/get_student_group_by_room_id_request.dart';
import 'package:codelytic/data/model/request/discussion/get_student_group_comment_by_group_id_request.dart';
import 'package:codelytic/data/model/request/discussion/register_student_group_request.dart';
import 'package:codelytic/data/model/request/discussion/send_student_group_coment_request.dart';
import 'package:codelytic/data/model/request/discussion/update_hide_student_group_comment_request.dart';
import 'package:codelytic/domain/entities/discussion/get_group_by_code_entity.dart';
import 'package:codelytic/domain/entities/discussion/get_student_group_by_room_id_entity.dart';
import 'package:codelytic/domain/entities/discussion/get_student_group_comment_by_group_id_entity.dart';
import 'package:codelytic/domain/entities/discussion/register_student_group_entity.dart';
import 'package:codelytic/domain/entities/discussion/send_student_group_comment_entity.dart';
import 'package:codelytic/domain/entities/discussion/update_hide_student_group_comment_entity.dart';
import 'package:codelytic/domain/repositories/disscussion_repository.dart';
import 'package:dartz/dartz.dart';

class DiscussionRepositoriesImpl implements DiscussionRepositories{
  final DiscussionRemoteDataSourceImpl discussionRemoteDataSourceImpl;
  final SharedPreferencesDataSourceImpl sharedPreferencesDataSourceImpl;

  DiscussionRepositoriesImpl(
      {required this.discussionRemoteDataSourceImpl, required this.sharedPreferencesDataSourceImpl});

  @override
  Future<Either<String, GetGroupByCodeEntity>> getGroupByCode(String token, GetGroupByCodeRequest request) async {
    try {
      final result = await discussionRemoteDataSourceImpl.getGroupByCode(token, request);
      return Right(result.toEntity());
    }
    catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, GetStudentGroupByRoomIdEntity>> getStudentGroupByRoomId(String token, GetStudentGroupByRoomIdRequest request) async {
    try {
      final result = await discussionRemoteDataSourceImpl.getStudentGroupByRoomId(token, request);
      return Right(result.toEntity());
    }
    catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, RegisterStudentGroupEntity>> createStudentGroup(String token, RegisterStudentGroupRequest request) async {
    try {
      final result = await discussionRemoteDataSourceImpl.createStudentGroup(token, request);
      return Right(result.toEntity());
    }
    catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, GetStudentGroupCommentByGroupIdEntity>> getStudentGroupCommentByGroupId(String token, GetStudentGroupCommentByGroupIdRequest request) async {
    try {
      final result = await discussionRemoteDataSourceImpl.getStudentGroupCommentByGroupId(token, request);
      return Right(result.toEntity());
    }
    catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, SendStudentGroupCommentEntity>> sendStudentGroupComment(String token, SendStudentGroupCommentRequest request) async {
    try {
      final result = await discussionRemoteDataSourceImpl.sendStudentGroupComment(token, request);
      return Right(result.toEntity());
    }
    catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, UpdateHideStudentGroupCommentEntity>> updateHideStudentGroupComment(String token, UpdateHideStudentGroupCommentRequest request) async {
    try {
      final result = await discussionRemoteDataSourceImpl.updateHideStudentGroupComment(token, request);
      return Right(result.toEntity());
    }
    catch (e) {
      return Left(e.toString());
    }
  }

}
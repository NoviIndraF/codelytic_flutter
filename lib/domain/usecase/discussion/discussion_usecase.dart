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

class DiscussionUsecase{
  final DiscussionRepositories discussionRepositories;
  DiscussionUsecase(this.discussionRepositories);

  Future<Either<String, RegisterStudentGroupEntity>> createStudentGroup(String token, RegisterStudentGroupRequest request){
    return discussionRepositories.createStudentGroup(token, request);
  }

  Future<Either<String, GetGroupByCodeEntity>> getGroupByCode(String token, GetGroupByCodeRequest request){
    return discussionRepositories.getGroupByCode(token, request);
  }

  Future<Either<String, GetStudentGroupByRoomIdEntity>> getStudentGroupByRoomId(String token, GetStudentGroupByRoomIdRequest request){
    return discussionRepositories.getStudentGroupByRoomId(token, request);
  }

  Future<Either<String, GetStudentGroupCommentByGroupIdEntity>> getStudentGroupCommentByGroupId(String token, GetStudentGroupCommentByGroupIdRequest request){
    return discussionRepositories.getStudentGroupCommentByGroupId(token, request);
  }

  Future<Either<String, SendStudentGroupCommentEntity>> sendStudentGroupComment(String token, SendStudentGroupCommentRequest request){
    return discussionRepositories.sendStudentGroupComment(token, request);
  }

  Future<Either<String, UpdateHideStudentGroupCommentEntity>> updateHideStudentGroupComment(String token, UpdateHideStudentGroupCommentRequest request){
    return discussionRepositories.updateHideStudentGroupComment(token, request);
  }
}
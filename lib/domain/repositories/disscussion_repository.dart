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
import 'package:dartz/dartz.dart';

abstract class DiscussionRepositories{

  Future<Either<String, GetGroupByCodeEntity>> getGroupByCode(String token, GetGroupByCodeRequest request);
  Future<Either<String, GetStudentGroupByRoomIdEntity>> getStudentGroupByRoomId(String token, GetStudentGroupByRoomIdRequest request);
  Future<Either<String, GetStudentGroupCommentByGroupIdEntity>> getStudentGroupCommentByGroupId(String token, GetStudentGroupCommentByGroupIdRequest request);

  Future<Either<String, RegisterStudentGroupEntity>> createStudentGroup(String token, RegisterStudentGroupRequest request);

  Future<Either<String, SendStudentGroupCommentEntity>> sendStudentGroupComment(String token, SendStudentGroupCommentRequest request);

  Future<Either<String, UpdateHideStudentGroupCommentEntity>> updateHideStudentGroupComment(String token, UpdateHideStudentGroupCommentRequest request);

}
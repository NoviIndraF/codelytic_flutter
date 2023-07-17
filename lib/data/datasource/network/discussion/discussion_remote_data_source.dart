
import 'package:codelytic/data/model/request/discussion/get_group_by_code_request.dart';
import 'package:codelytic/data/model/request/discussion/get_student_group_by_room_id_request.dart';
import 'package:codelytic/data/model/request/discussion/get_student_group_comment_by_group_id_request.dart';
import 'package:codelytic/data/model/request/discussion/register_student_group_request.dart';
import 'package:codelytic/data/model/request/discussion/send_student_group_coment_request.dart';
import 'package:codelytic/data/model/request/discussion/update_hide_student_group_comment_request.dart';
import 'package:codelytic/data/model/response/discussion/get_group_by_code_response.dart';
import 'package:codelytic/data/model/response/discussion/get_student_group_by_room_id_response.dart';
import 'package:codelytic/data/model/response/discussion/get_student_group_comment_by_group_id_response.dart';
import 'package:codelytic/data/model/response/discussion/register_student_group_response.dart';
import 'package:codelytic/data/model/response/discussion/send_student_group_comment_response.dart';
import 'package:codelytic/data/model/response/discussion/update_hide_student_group_comment_response.dart';

abstract class DiscussionRemoteDataSource{
  Future<GetGroupByCodeResponse> getGroupByCode(String token, GetGroupByCodeRequest request);
  Future<GetStudentGroupByRoomIdResponse> getStudentGroupByRoomId(String token, GetStudentGroupByRoomIdRequest request);
  Future<GetStudentGroupCommentByGroupIdResponse> getStudentGroupCommentByGroupId(String token, GetStudentGroupCommentByGroupIdRequest request);

  Future<RegisterStudentGroupResponse> createStudentGroup(String token, RegisterStudentGroupRequest request);
  Future<SendStudentGroupCommentResponse> sendStudentGroupComment(String token, SendStudentGroupCommentRequest request);

  Future<UpdateHideStudentGroupCommentResponse> updateHideStudentGroupComment(String token, UpdateHideStudentGroupCommentRequest request);

}
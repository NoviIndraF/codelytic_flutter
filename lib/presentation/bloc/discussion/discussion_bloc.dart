import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:codelytic/common/constant.dart';
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
import 'package:codelytic/domain/usecase/discussion/discussion_usecase.dart';
import 'package:meta/meta.dart';

part 'discussion_event.dart';
part 'discussion_state.dart';

class DiscussionBloc extends Bloc<DiscussionEvent, DiscussionState> {
  final DiscussionUsecase discussionUsecase;
  DiscussionBloc(this.discussionUsecase) : super(DiscussionInitial()) {
    on<DiscussionEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<DiscussionChangesViewEvent>((event, emit) async {
      emit(DiscussionLoading());
      print("DiscussionChangesViewEvent :");
      int view = event.view;
      if (view == Constant.CHATGROUP) {
        view = Constant.DISCUSSION;
      } else if (view == Constant.DISCUSSION) {
        view = Constant.CHATGROUP;
      }
      emit(DiscussionChangesViewState(view));
    });

    on<DiscussionGetGroupByCodeEvent>((event, emit) async {
      emit(DiscussionLoading());
      print("DiscussionGetGroupByCodeEvent :");

      final getGroup =
          await discussionUsecase.getGroupByCode(event.token, event.request);
      getGroup.fold(
          (failure) => emit(DiscussionFailedState(failure.toString())), (data) {
        emit(DiscussionGetGroupByCodeState(data));
      });
    });

    on<DiscussionGetStudentGroupByRoomIdEvent>((event, emit) async {
      emit(DiscussionLoading());
      print("DiscussionGetStudentGroupByRoomIdEvent :");

      final getStudentGroup = await discussionUsecase.getStudentGroupByRoomId(
          event.token, event.request);
      getStudentGroup.fold(
          (failure) => emit(DiscussionFailedState(failure.toString())), (data) {
        emit(DiscussionGetStudentGroupByRoomIdState(data));
      });
    });

    on<DiscussionGetStudentGroupCommentByGroupIdEvent>((event, emit) async {
      emit(DiscussionLoading());
      print("DiscussionGetStudentGroupCommentByGroupIdEvent :");

      final getStudentGroup = await discussionUsecase
          .getStudentGroupCommentByGroupId(event.token, event.request);
      getStudentGroup.fold(
          (failure) => emit(DiscussionFailedState(failure.toString())), (data) {
        emit(DiscussionGetStudentGroupCommentByGroupIdState(data));
      });
    });

    on<DiscussionRegisterStudentGroupByCodeEvent>((event, emit) async {
      emit(DiscussionLoading());
      print("DiscussionRegisterStudentGroupByCodeEvent :");

      final getGroup = await discussionUsecase.createStudentGroup(
          event.token, event.request);
      getGroup.fold(
          (failure) => emit(DiscussionFailedState(failure.toString())), (data) {
        emit(DiscussionRegisterStudentGroupByCodeState(data));
      });
    });

    on<DiscussionSendStudentGroupCommentEvent>((event, emit) async {
      emit(DiscussionLoading());
      print("DiscussionSendStudentGroupCommentEvent :");

      final getGroup = await discussionUsecase.sendStudentGroupComment(
          event.token, event.request);
      getGroup.fold(
              (failure) => emit(DiscussionFailedState(failure.toString())), (data) {
        emit(DiscussionSendStudentGroupCommentState(data));
      });
    });

    on<DiscussionShowPopUpItemChatEvent>((event, emit) async {
      emit(DiscussionLoading());
      print("DiscussionShowPopUpItemChatEvent :");
      bool isShow = event.isShow;
      if(isShow){
        isShow = false;
      }{
        isShow = true;
      }

        emit(DiscussionShowPopUpItemChatState(isShow));

    });

    on<DiscussionUpdateHideStudentDiscussionCommentEvent>((event, emit) async {
      emit(DiscussionLoading());
      print("DiscussionUpdateHideStudentDiscussionCommentEvent :");

      final getGroup = await discussionUsecase.updateHideStudentGroupComment(
          event.token, event.request);
      getGroup.fold(
              (failure) => emit(DiscussionFailedState(failure.toString())), (data) {
        emit(DiscussionUpdateHideStudentDiscussionCommentState(data));
      });
    });
  }
}

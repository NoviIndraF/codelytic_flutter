part of 'discussion_bloc.dart';

@immutable
abstract class DiscussionEvent {}

class DiscussionChangesViewEvent extends DiscussionEvent{
  final int view;
  DiscussionChangesViewEvent(this.view);

  @override
  List<Object?> get props => [view];
}

class DiscussionRegisterStudentGroupByCodeEvent extends DiscussionEvent{
  final RegisterStudentGroupRequest request;
  final String token;
  DiscussionRegisterStudentGroupByCodeEvent(this.token, this.request);

  @override
  List<Object?> get props => [token, request];
}

class DiscussionGetGroupByCodeEvent extends DiscussionEvent{
  final GetGroupByCodeRequest request;
  final String token;
  DiscussionGetGroupByCodeEvent(this.token, this.request);

  @override
  List<Object?> get props => [token, request];
}

class DiscussionGetStudentGroupByRoomIdEvent extends DiscussionEvent{
  final GetStudentGroupByRoomIdRequest request;
  final String token;
  DiscussionGetStudentGroupByRoomIdEvent(this.token, this.request);

  @override
  List<Object?> get props => [token, request];
}

class DiscussionGetStudentGroupCommentByGroupIdEvent extends DiscussionEvent{
  final GetStudentGroupCommentByGroupIdRequest request;
  final String token;
  DiscussionGetStudentGroupCommentByGroupIdEvent(this.token, this.request);

  @override
  List<Object?> get props => [token, request];
}

class DiscussionSendStudentGroupCommentEvent extends DiscussionEvent{
  final SendStudentGroupCommentRequest request;
  final String token;
  DiscussionSendStudentGroupCommentEvent(this.token, this.request);

  @override
  List<Object?> get props => [token, request];
}

class DiscussionShowPopUpItemChatEvent extends DiscussionEvent{
  final bool isShow;
  DiscussionShowPopUpItemChatEvent(this.isShow);

  @override
  List<Object?> get props => [isShow];
}

class DiscussionUpdateHideStudentDiscussionCommentEvent extends DiscussionEvent{
  final UpdateHideStudentGroupCommentRequest request;
  final String token;
  DiscussionUpdateHideStudentDiscussionCommentEvent(this.request, this.token);

  @override
  List<Object?> get props => [request, token];
}
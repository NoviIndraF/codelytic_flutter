part of 'discussion_bloc.dart';

@immutable
abstract class DiscussionState {}

class DiscussionInitial extends DiscussionState {}
class DiscussionLoading extends DiscussionState{}

class DiscussionChangesViewState extends DiscussionState{
  final int view;
  DiscussionChangesViewState(this.view);

  @override
  List<Object?> get props => [view];
}

class DiscussionRegisterStudentGroupByCodeState extends DiscussionState{
  final RegisterStudentGroupEntity entity;
  DiscussionRegisterStudentGroupByCodeState(this.entity);

  @override
  List<Object?> get props => [entity];
}

class DiscussionGetGroupByCodeState extends DiscussionState{
  final GetGroupByCodeEntity entity;
  DiscussionGetGroupByCodeState(this.entity);

  @override
  List<Object?> get props => [entity];
}

class DiscussionGetStudentGroupByRoomIdState extends DiscussionState{
  final GetStudentGroupByRoomIdEntity entity;
  DiscussionGetStudentGroupByRoomIdState(this.entity);

  @override
  List<Object?> get props => [entity];
}

class DiscussionGetStudentGroupCommentByGroupIdState extends DiscussionState{
  final GetStudentGroupCommentByGroupIdEntity entity;
  DiscussionGetStudentGroupCommentByGroupIdState(this.entity);

  @override
  List<Object?> get props => [entity];
}

class DiscussionSendStudentGroupCommentState extends DiscussionState{
  final SendStudentGroupCommentEntity entity;
  DiscussionSendStudentGroupCommentState(this.entity);

  @override
  List<Object?> get props => [entity];
}

class DiscussionShowPopUpItemChatState extends DiscussionState{
  final bool isShow;
  DiscussionShowPopUpItemChatState(this.isShow);

  @override
  List<Object?> get props => [isShow];
}

class DiscussionUpdateHideStudentDiscussionCommentState extends DiscussionState{
  final UpdateHideStudentGroupCommentEntity entity;
  DiscussionUpdateHideStudentDiscussionCommentState(this.entity);

  @override
  List<Object?> get props => [entity];
}

class DiscussionFailedState extends DiscussionState{
  final String message;

  DiscussionFailedState(this.message);

  @override
  List<Object?> get props => [message];
}
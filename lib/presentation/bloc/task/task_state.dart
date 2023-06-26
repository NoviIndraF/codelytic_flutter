part of 'task_bloc.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState{}

class TaskGetTaskByRoomIdState extends TaskState{
  final GetTaskByRoomCodeResponseEntity getTaskByRoomCodeResponseEntity;
  TaskGetTaskByRoomIdState(this.getTaskByRoomCodeResponseEntity);

  @override
  List<Object?> get props => [getTaskByRoomCodeResponseEntity];
}

class TaskGetStudentTaskByRoomIdState extends TaskState{
  final GetStudentTaskByRoomIdEntity getStudentTaskByRoomIdEntity;
  TaskGetStudentTaskByRoomIdState(this.getStudentTaskByRoomIdEntity);

  @override
  List<Object?> get props => [getStudentTaskByRoomIdEntity];
}

class TaskSubmittedState extends TaskState {
  final SubmitTaskEntity result;

  TaskSubmittedState(this.result);

  @override
  List<Object?> get props => [result];
}

class TaskCheckSubmittedState extends TaskState {
  final bool result;

  TaskCheckSubmittedState(this.result);

  @override
  List<Object?> get props => [result];
}

class TaskFailedState extends TaskState{
  final String message;

  TaskFailedState(this.message);

  @override
  List<Object?> get props => [message];
}
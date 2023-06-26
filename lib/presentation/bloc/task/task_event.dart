part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}
class TaskGetTaskByRoomIdEvent extends TaskEvent{
  final GetTaskByRoomIdRequest requestTask;
  final String token;
  TaskGetTaskByRoomIdEvent(this.requestTask, this.token);

  @override
  List<Object?> get props => [requestTask, token];
}

class TaskGetStudentTaskByRoomIdEvent extends TaskEvent{
  final GetStudentTaskByRoomIdRequest requestStudentTask;
  final String token;
  TaskGetStudentTaskByRoomIdEvent(this.requestStudentTask, this.token);

  @override
  List<Object?> get props => [requestStudentTask, token];
}

class TaskSubmitEvent extends TaskEvent{
  final String token;
  final SubmitTaskRequest request;
  TaskSubmitEvent(this.token, this.request);

  @override
  List<Object?> get props => [token, request];
}

class TaskCheckSubmittedEvent extends TaskEvent {
  final int task_id;

  TaskCheckSubmittedEvent(this.task_id);

  @override
  List<Object?> get props => [task_id];
}
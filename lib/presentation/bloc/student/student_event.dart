part of 'student_bloc.dart';

@immutable
abstract class StudentEvent {}
class StudentGetEvent extends StudentEvent{
  final String token;
  StudentGetEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class StudentUpdateEvent extends StudentEvent{
  final String token;
  final UpdateProfileRequest request;
  StudentUpdateEvent(this.token, this.request);

  @override
  List<Object?> get props => [token,request];
}
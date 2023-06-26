part of 'student_bloc.dart';

@immutable
abstract class StudentState {}

class StudentInitial extends StudentState {}
class StudentLoading extends StudentState{}

class StudentGetState extends StudentState{
  final GetStudentEntity getStudentEntity;
  StudentGetState(this.getStudentEntity);

  @override
  List<Object?> get props => [getStudentEntity];
}

class StudentFailedState extends StudentState{
  final String message;

  StudentFailedState(this.message);

  @override
  List<Object?> get props => [message];
}
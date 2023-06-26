part of 'student_bloc.dart';

@immutable
abstract class StudentEvent {}
class StudentGetEvent extends StudentEvent{
  final String token;
  StudentGetEvent(this.token);

  @override
  List<Object?> get props => [token];
}
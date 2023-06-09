part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeGetTokenAndCodeEvent extends HomeEvent{}
class HomeGetStudentEvent extends HomeEvent{
  final String token;
  HomeGetStudentEvent(this.token);

  @override
  List<Object?> get props => [token];
}

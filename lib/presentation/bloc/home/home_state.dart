part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}

class HomeErrorState extends HomeState{
  final String message;

  HomeErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

class HomeGetTokenAndCodeState extends HomeState{
  final String token;
  final String code;
  final String roomId;
  final String userId;

  HomeGetTokenAndCodeState({required this.token, required this.code, required this.roomId, required this.userId});

  @override
  List<Object?> get props => [token,code];
}

class HomeGetStudentState extends HomeState{
  final StudentEntity token;
  HomeGetStudentState(this.token);

  @override
  List<Object?> get props => [token];
}

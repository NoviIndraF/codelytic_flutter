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

  HomeGetTokenAndCodeState({required this.token, required this.code});

  @override
  List<Object?> get props => [token,code];
}


class HomeGetStudentState extends HomeState{
  final StudentEntity token;
  HomeGetStudentState(this.token);

  @override
  List<Object?> get props => [token];
}

class HomeGetAllDataByRoomCodeState extends HomeState{
  final StudentEntity studentEntity;
  final GetAllDataByRoomCodeEntity getAllDataByRoomCodeEntity;
  HomeGetAllDataByRoomCodeState(this.studentEntity,this.getAllDataByRoomCodeEntity);

  @override
  List<Object?> get props => [getAllDataByRoomCodeEntity];
}
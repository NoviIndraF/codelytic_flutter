part of 'room_bloc.dart';

@immutable
abstract class RoomState {}

class RoomInitial extends RoomState {}
class RoomLoading extends RoomState{}

class RoomGetByIdState extends RoomState{
  final GetRoomByIdEntity getRoomByIdEntity;
  RoomGetByIdState(this.getRoomByIdEntity);

  @override
  List<Object?> get props => [getRoomByIdEntity];
}

class RoomFailedState extends RoomState{
  final String message;

  RoomFailedState(this.message);

  @override
  List<Object?> get props => [message];
}
part of 'room_bloc.dart';

@immutable
abstract class RoomEvent {}
class RoomGetByIdEvent extends RoomEvent{
  final GetRoomByIdRequest request;
  final String token;
  RoomGetByIdEvent(this.token, this.request);

  @override
  List<Object?> get props => [token, request];
}
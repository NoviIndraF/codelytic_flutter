part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthRegisterEvent extends AuthEvent{
  final RegisterRequest request;
  AuthRegisterEvent(this.request);

  @override
  List<Object?> get props => [request];
}

class AuthRegisterRoomEvent extends AuthEvent{
  final String token;
  final RegisterRoomRequest request;
  AuthRegisterRoomEvent(this.token, this.request);

  @override
  List<Object?> get props => [token, request];
}

class AuthLoginEvent extends AuthEvent{
  final LoginRequest request;
  AuthLoginEvent(this.request);

  @override
  List<Object?> get props => [request];
}

class AuthCheckEvent extends AuthEvent{}

class AuthCheckCodeRoomEvent extends AuthEvent{}

class AuthGetRoomEvent extends AuthEvent{
  final String token;
  AuthGetRoomEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class AuthGetRoomByCodeEvent extends AuthEvent{
  final GetRoomByCodeRequest code;
  final String token;
  AuthGetRoomByCodeEvent(this.token, this.code);

  @override
  List<Object?> get props => [code];
}

class AuthSaveCodeRoomEvent extends AuthEvent{
  final String code;
  AuthSaveCodeRoomEvent(this.code);

  @override
  List<Object?> get props => [code];
}

class AuthLogoutEvent extends AuthEvent{}

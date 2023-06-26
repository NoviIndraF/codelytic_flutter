part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}


class AuthError extends AuthState {
  final String message;

  AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

class AuthFailed extends AuthState {
  final String message;

  AuthFailed(this.message);

  @override
  List<Object?> get props => [message];
}

class AuthGetRoom extends AuthState{
  final GetStudentRoomResponseEntity result;

  AuthGetRoom(this.result);

  @override
  List<Object?> get props => [result];
}

class AuthGetRoomByCode extends AuthState{
  final GetRoomByCodeResponseEntity result;

  AuthGetRoomByCode(this.result);

  @override
  List<Object?> get props => [result];
}

class AuthHasToken extends AuthState{
  final String result;

  AuthHasToken(this.result);

  @override
  List<Object?> get props => [result];
}

class AuthHasCodeRoom extends AuthState{
  final String result;

  AuthHasCodeRoom(this.result);

  @override
  List<Object?> get props => [result];
}

class AuthHasFirstState extends AuthState{
  final String result;

  AuthHasFirstState(this.result);

  @override
  List<Object?> get props => [result];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLogged extends AuthState {
  final AuthenticationEntity result;

  AuthLogged(this.result);

  @override
  List<Object?> get props => [result];
}

class AuthLogout extends AuthState {
  final AuthResponse result;

  AuthLogout(this.result);

  @override
  List<Object?> get props => [result];
}

class AuthRegistered extends AuthState {
  final AuthenticationEntity result;

  AuthRegistered(this.result);

  @override
  List<Object?> get props => [result];
}

class AuthRegisteredRoom extends AuthState {
  final AuthRegisterRoomResponseEntity result;

  AuthRegisteredRoom(this.result);

  @override
  List<Object?> get props => [result];
}

class AuthRegisterError extends AuthState {
  final String message;

  AuthRegisterError(this.message);

  @override
  List<Object?> get props => [message];
}

class AuthRegisterFailed extends AuthState {
  final String message;

  AuthRegisterFailed(this.message);

  @override
  List<Object?> get props => [message];
}

class AuthSavedCodeRoomState extends AuthState{
  final String result;

  AuthSavedCodeRoomState(this.result);

  @override
  List<Object?> get props => [result];
}

class AuthSavedFirstState extends AuthState{
  final String result;

  AuthSavedFirstState(this.result);

  @override
  List<Object?> get props => [result];
}

class AuthSavedRoomIdState extends AuthState{
  final String result;

  AuthSavedRoomIdState(this.result);

  @override
  List<Object?> get props => [result];
}



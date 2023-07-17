import 'package:bloc/bloc.dart';
import 'package:codelytic/common/constant.dart';
import 'package:codelytic/data/model/request/authentication/get_room_by_code_request.dart';
import 'package:codelytic/data/model/request/authentication/login_request.dart';
import 'package:codelytic/data/model/request/authentication/register_room_request.dart';
import 'package:codelytic/data/model/request/authentication/register_request.dart';
import 'package:codelytic/data/model/response/authentication/auth_response.dart';
import 'package:codelytic/domain/entities/authentication/auth_register_room_response_entity.dart';
import 'package:codelytic/domain/entities/authentication/get_student_room_response_entity.dart';
import 'package:codelytic/domain/entities/authentication/authentication_entity.dart';
import 'package:codelytic/domain/entities/authentication/get_room_by_code_response_entity.dart';
import 'package:codelytic/domain/usecase/authentication/auth_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUsecase authUseCase;

  AuthBloc(this.authUseCase) : super(AuthInitial()) {

    on<AuthCheckEvent>((event, emit) async {
      emit(AuthLoading());
      print("pulu login bloc");

      final hasToken = await authUseCase.hasToken();

      hasToken.fold((failure) => emit(AuthError(failure.toString())), (data) {
        if (data != "") {
          emit(AuthHasToken(data.toString()));
        } else {
          emit(AuthFailed(data.toString()));
        }
      });
    });
    on<AuthCheckCodeRoomEvent>((event, emit) async {
      emit(AuthLoading());
      print("pulu login bloc");
      final hasClass = await authUseCase.getToSharedPref(Constant.codeRoom);
      hasClass.fold(
              (failure) => emit(AuthError(failure.toString())),
              (data) {
            if (data != "") {
              emit(AuthHasCodeRoom(data));
            } else {
              emit(AuthFailed(data.toString()));
            }
          });
    });

    on<AuthCheckFirstEvent>((event, emit) async {
      emit(AuthLoading());
      print("AuthCheckFirstEvent:");
      final hasClass = await authUseCase.getToSharedPref("first");
      hasClass.fold(
              (failure) => emit(AuthError(failure.toString())),
              (data) {
            if (data != "") {
              emit(AuthHasFirstState(data));
            } else {
              emit(AuthHasFirstState(data));
            }
          });
    });

    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoading());
      print("pulu login bloc");
      final request = event.request;

      final result = await authUseCase.loginStudent(request);
      result.fold(
        (failure) {
          print("pulu error : " + failure.toString());
          if (failure == "Connection refused"){
            emit(AuthFailed("$failure, Login gagal. Silahkan coba lagi..."));
          } else{
            String statusCode =
            failure.substring(failure.indexOf("[") + 1, failure.indexOf(","));
            String message = failure.substring(
                failure.indexOf(", ") + 2, failure.indexOf("]"));

            int getStatusCode = int.parse(statusCode);
            if (getStatusCode >= 400) {
              emit(AuthFailed("$message, Login gagal. Silahkan coba lagi..."));
            } else {
              emit(AuthError(message));
            }
          }

        },
        (data) async {
          final token = "${data.tokenType} ${data.accessToken}";
          final userId = "${data.student.id}";
          emit(AuthHasToken(token));
          await authUseCase.setToken(token);
          await authUseCase.saveToSharedpref(Constant.userId, userId.toString());
        },
      );
    });
    on<AuthLogoutEvent>((event, emit) async {
      emit(AuthLoading());

      String token = '';
      final hasToken = await authUseCase.hasToken();
      hasToken.fold((failure) => emit(AuthError(failure.toString())),
              (data) async {
            if (data != "") {
              token = data;
            } else {
              emit(AuthFailed(data.toString()));
            }
          });

      final logOut = await authUseCase.logoutStudent(token);
      logOut.fold((failure) => emit(AuthFailed(failure.toString())), (data) {
        emit(AuthLogout(data));
      });
      await authUseCase.unsetToken();
      await authUseCase.deteleToSharedPref(Constant.codeRoom);
      await authUseCase.deteleToSharedPref(Constant.roomId);
      await authUseCase.deteleToSharedPref(Constant.userId);
    });

    on<AuthGetRoomEvent>((event, emit) async {
      emit(AuthLoading());
      print("pulu login bloc");
        final hasClass = await authUseCase.getStudentRoom(event.token);
        hasClass.fold(
          (failure) => emit(AuthError(failure.toString())),
          (data) {
          if (data != "") {
            emit(AuthGetRoom(data));
          } else {
            emit(AuthFailed(data.toString()));
          }
        });
    });
    on<AuthGetRoomByCodeEvent>((event, emit) async {
      emit(AuthLoading());
      print("pulu login bloc");
      final hasClass = await authUseCase.getRoomByCode(event.token, event.code);
      hasClass.fold(
              (failure) => emit(AuthError(failure.toString())),
              (data) {
            if (data != "") {
              emit(AuthGetRoomByCode(data));
            } else {
              emit(AuthFailed(data.toString()));
            }
          });
    });

    on<AuthRegisterEvent>((event, emit) async {
      emit(AuthLoading());
      print("pulu bloc");
      final request = event.request;
      final result = await authUseCase.registerStudent(request);

      result.fold((failure) {
        print("pulu error : " + failure.toString());
        String statusCode =
        failure.substring(failure.indexOf("[") + 1, failure.indexOf(","));
        String message =
        failure.substring(failure.indexOf(", ") + 2, failure.indexOf("]"));

        int getStatusCode = int.parse(statusCode);
        if (getStatusCode >= 400) {
          emit(AuthRegisterFailed(
              "$message, periksa kembali data anda dengan benar"));
        } else {
          emit(AuthRegisterError(message));
        }
      }, (data) => emit(AuthRegistered(data)));
    });
    on<AuthRegisterRoomEvent>((event, emit) async {
      emit(AuthLoading());
      print("pulu bloc");
      final result = await authUseCase.createStudentRoom(event.token, event.request);

      result.fold(
              (failure) => emit(AuthError(failure.toString())),
              (data) {
            if (data != "") {
              emit(AuthRegisteredRoom(data));
            } else {
              emit(AuthFailed(data.toString()));
            }
          });
    });

    on<AuthSaveCodeRoomEvent>((event, emit) async {
      emit(AuthLoading());
      print("pulu login bloc");
      final hasClass = await authUseCase.saveToSharedpref(Constant.codeRoom, event.code);
      hasClass.fold(
              (failure) => emit(AuthError(failure.toString())),
              (data) {
            if (data != "") {
              emit(AuthSavedCodeRoomState(data));
            } else {
              emit(AuthFailed(data.toString()));
            }
          });
    });

    on<AuthSaveFirstEvent>((event, emit) async {
      emit(AuthLoading());
      print("pulu login bloc");
      final hasClass = await authUseCase.saveToSharedpref("first", event.first);
      hasClass.fold(
              (failure) => emit(AuthError(failure.toString())),
              (data) {
            if (data != "") {
              emit(AuthSavedFirstState(data));
            } else {
              emit(AuthFailed(data.toString()));
            }
          });
    });

    on<AuthSaveRoomIdEvent>((event, emit) async {
      emit(AuthLoading());
      print("pulu login bloc");
      final hasClass = await authUseCase.saveToSharedpref(Constant.roomId, event.roomId);
      hasClass.fold(
              (failure) => emit(AuthError(failure.toString())),
              (data) {
            if (data != "") {
              emit(AuthSavedRoomIdState(data));
            } else {
              emit(AuthFailed(data.toString()));
            }
          });
    });

  }
}

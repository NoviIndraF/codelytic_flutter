import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:codelytic/data/model/request/room/get_room_by_id_request.dart';
import 'package:codelytic/domain/entities/room/get_room_by_code_entity.dart';
import 'package:codelytic/domain/usecase/room/room_usecase.dart';
import 'package:meta/meta.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  final RoomUsecase RoomUseCase;

  RoomBloc(this.RoomUseCase) : super(RoomInitial()) {
    on<RoomEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<RoomGetByIdEvent>((event, emit) async {
      emit(RoomLoading());
      print("RoomGetByCodeEvent :");

      final getRoom =
      await RoomUseCase.getRoomByRoomCode(event.token, event.request);
      getRoom.fold(
              (failure) => emit(RoomFailedState(failure.toString())),
              (data) {
            emit(RoomGetByIdState(data));
          });
    });
  }
}

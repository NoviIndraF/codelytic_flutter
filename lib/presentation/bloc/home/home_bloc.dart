

import 'package:bloc/bloc.dart';
import 'package:codelytic/common/constant.dart';
import 'package:codelytic/data/model/request/home/get_materi_by_room_code_request.dart';
import 'package:codelytic/domain/entities/authentication/authentication_entity.dart';
import 'package:codelytic/domain/entities/home/get_all_data_by_room_code_entity.dart';
import 'package:codelytic/domain/usecase/home/home_usecase.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUsecase homeUseCase;


  HomeBloc(this.homeUseCase) : super(HomeInitial()) {

    on<HomeGetTokenAndCodeEvent>((event, emit) async {
      emit(HomeLoading());
      print("HomeGetCodeEvent :");
      String code = "";
      String token = "";

      final getcode = await homeUseCase.getToSharedPref(Constant.codeRoom);

      getcode.fold((failure) => emit(HomeErrorState(failure.toString())), (data) {
        if (data != "") {
          code = data;
        } else {
          emit(HomeErrorState(data.toString()));
        }
      });

      final getToken = await homeUseCase.getToSharedPref(Constant.token);

      getToken.fold((failure) => emit(HomeErrorState(failure.toString())), (data) {
        if (data != "") {
          token = data;
        } else {
          emit(HomeErrorState(data.toString()));
        }
      });

      if (code != "" && token != ""){
        emit(HomeGetTokenAndCodeState(token: token, code: code));
      }
    });

    on<HomeGetStudentEvent>((event, emit) async {
      emit(HomeLoading());
      print("HomeGetStudentEvent :");

      final token = await homeUseCase.getStudent(event.token);

      token.fold((failure) => emit(HomeErrorState(failure.toString())), (data) {
        if (data != "") {
          emit(HomeGetStudentState(data));
        } else {
          emit(HomeErrorState(data.toString()));
        }
      });
    });

    on<HomeGetAllDataByRoomCodeEvent>((event, emit) async {
      emit(HomeLoading());
      print("HomeGetAllDataByRoomCodeEvent :");

      StudentEntity studentEntity= StudentEntity();
      GetAllDataByRoomCodeEntity getAllDataByRoomCodeEntity = GetAllDataByRoomCodeEntity();

      final getStudent = await homeUseCase.getStudent(event.token);
      getStudent.fold((failure) => emit(HomeErrorState(failure.toString())), (data) {
        if (data != "") {
          studentEntity = data;
        } else {
          emit(HomeErrorState(data.toString()));
        }
      });

      final getAllDAta = await homeUseCase.getAllDataByRoomCode(event.token, event.getAllDataByRoomCodeRequest);
      getAllDAta.fold((failure) => emit(HomeErrorState(failure.toString())), (data) {
        if (data != "") {
          getAllDataByRoomCodeEntity = data;
        } else {
          emit(HomeErrorState(data.toString()));
        }
      });

      if(studentEntity.id != null && getAllDataByRoomCodeEntity.id !=null){
        emit(HomeGetAllDataByRoomCodeState(studentEntity,getAllDataByRoomCodeEntity));
      }

    });

  }
}

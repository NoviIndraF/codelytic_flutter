import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:codelytic/domain/entities/student/get_student_entity.dart';
import 'package:codelytic/domain/usecase/student/student_usecase.dart';
import 'package:meta/meta.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final StudentUsecase studentUseCase;

  StudentBloc(this.studentUseCase) : super(StudentInitial()) {
    on<StudentEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<StudentGetEvent>((event, emit) async {
      emit(StudentLoading());
      print("StudentGetEvent :");

      final getStudent =
      await studentUseCase.getStudent(event.token);
      getStudent.fold(
              (failure) => emit(StudentFailedState(failure.toString())),
              (data) {
            emit(StudentGetState(data));
          });
    });
  }
}

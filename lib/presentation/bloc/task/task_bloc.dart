import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:codelytic/data/model/request/task/get_student_task_by_room_id_request.dart';
import 'package:codelytic/data/model/request/task/get_task_by_room_code_request.dart';
import 'package:codelytic/data/model/request/task/submit_task_request.dart';
import 'package:codelytic/data/model/response/task/get_student_task_by_room_id.dart';
import 'package:codelytic/domain/entities/task/get_student_task_by_room_id_entity.dart';
import 'package:codelytic/domain/entities/task/get_task_by_room_code_entity.dart';
import 'package:codelytic/domain/entities/task/submit_task_entity.dart';
import 'package:codelytic/domain/usecase/task/task_usecase.dart';
import 'package:meta/meta.dart';

import '../../../data/model/response/task/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskUsecase taskUseCase;

  List<Task>? taskList = [];
  List<StudentTask>? studentTaskList = [];
  TaskBloc(this.taskUseCase) : super(TaskInitial()) {
    on<TaskEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<TaskGetTaskByRoomIdEvent>((event, emit) async {
      emit(TaskLoading());
      print("TaskGetTaskByRoomCodeEvent :");

      final getTask =
          await taskUseCase.getTaskByRoomId(event.token, event.requestTask);
      getTask.fold((failure) => emit(TaskFailedState(failure.toString())),
          (data) {
        if (data.task!.isNotEmpty) {
          data.task?.sort((a, b) => a.deadline!.compareTo(b.deadline!));

          for (Task task in data.task!) {
            if (studentTaskList!.any((studentTask) => studentTask.taskId == task.id)) {
              task.checked = true;
            }
          }

        }
        return emit(TaskGetTaskByRoomIdState(data));
      });
    });

    on<TaskGetStudentTaskByRoomIdEvent>((event, emit) async {
      emit(TaskLoading());
      print("TaskGetStudentTaskByRoomIdEvent");
      final result = await taskUseCase.getStudentTask(event.token, event.requestStudentTask);

      result.fold((failure) => emit(TaskFailedState(failure.toString())),
              (data) {
            if (data != "") {
              data.studentTask?.sort((a, b) => a.id!.compareTo(b.id!));
              studentTaskList = data.studentTask;
              emit(TaskGetStudentTaskByRoomIdState(data));
            } else {
              emit(TaskFailedState(data.toString()));
            }
          });
    });

    on<TaskSubmitEvent>((event, emit) async {
      emit(TaskLoading());
      print("TaskSubmitEvent");
      final result = await taskUseCase.submitTask(event.token, event.request);

      result.fold((failure) => emit(TaskFailedState(failure.toString())),
          (data) {
        if (data != "") {
          emit(TaskSubmittedState(data));
        } else {
          emit(TaskFailedState(data.toString()));
        }
      });
    });

    on<TaskCheckSubmittedEvent>((event, emit)async{

      bool isIdExist = studentTaskList!.any((studentTask) => studentTask.taskId == event.task_id);
      emit(TaskCheckSubmittedState(isIdExist));
      print("TaskCheckSubmittedEvent : $isIdExist");
    });
  }
}

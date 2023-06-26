import 'package:codelytic/data/model/request/task/get_student_task_by_room_id_request.dart';
import 'package:codelytic/data/model/request/task/get_task_by_room_code_request.dart';
import 'package:codelytic/data/model/request/task/submit_task_request.dart';
import 'package:codelytic/data/model/response/task/get_student_task_by_room_id.dart';
import 'package:codelytic/data/model/response/task/get_task_by_room_code_response.dart';
import 'package:codelytic/data/model/response/task/list_student_task.dart';
import 'package:codelytic/data/model/response/task/submit_task_response.dart';

abstract class TaskRemoteDataSource{
  Future<GetTaskByRoomCodeResponse> getTaskByRoomId(String token, GetTaskByRoomIdRequest request);
  Future<GetStudentTaskByRoomIdResponse> getStudentTask(String token, GetStudentTaskByRoomIdRequest request);

  Future<SubmitTaskResponse> submitTask(String token, SubmitTaskRequest request);
}
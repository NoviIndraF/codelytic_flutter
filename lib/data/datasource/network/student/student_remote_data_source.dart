import 'package:codelytic/data/model/request/quiz/get_quiz_by_room_id_request.dart';
import 'package:codelytic/data/model/response/quiz/get_quiz_by_room_id_response.dart';
import 'package:codelytic/data/model/response/student/get_student_response.dart';

abstract class StudentRemoteDataSource{
  Future<GetStudentResponse> getStudent(String token);

}
import 'package:codelytic/data/model/request/profile/update_profile_request.dart';
import 'package:codelytic/data/model/response/authentication/authentication.dart';
import 'package:codelytic/data/model/response/student/get_student_response.dart';

abstract class StudentRemoteDataSource{
  Future<GetStudentResponse> getStudent(String token);
  Future<Student> updateStudent(String token, UpdateProfileRequest request);


}
import 'dart:convert';

import 'package:codelytic/domain/entities/quiz/get_student_quiz_by_room_id_entity.dart';
import 'package:equatable/equatable.dart';

import 'get_student_quiz_by_id_response.dart';

GetStudentQuizByRoomIdResponse getQuizByRoomdFromJson(String str) => GetStudentQuizByRoomIdResponse.fromJson(json.decode(str));
class GetStudentQuizByRoomIdResponse extends Equatable{
  List<StudentQuiz>? studentQuiz;

  GetStudentQuizByRoomIdResponse({
    this.studentQuiz,
  });

  factory GetStudentQuizByRoomIdResponse.fromJson(Map<String, dynamic> json) => GetStudentQuizByRoomIdResponse(
    studentQuiz: json["data"] == null ? [] : List<StudentQuiz>.from(json["data"]!.map((x) => StudentQuiz.fromJson(x))),
  );

  GetStudentQuizByRoomIdEntity toEntity()=> GetStudentQuizByRoomIdEntity(studentQuiz: studentQuiz);

  @override
  List<Object?> get props => [studentQuiz];

}
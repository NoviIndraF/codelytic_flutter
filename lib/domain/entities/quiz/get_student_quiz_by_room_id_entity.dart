import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../data/model/response/quiz/get_student_quiz_by_id_response.dart';

GetStudentQuizByRoomIdEntity getQuizByRoomIdFromJson(String str) => GetStudentQuizByRoomIdEntity.fromJson(json.decode(str));
class GetStudentQuizByRoomIdEntity extends Equatable{
  List<StudentQuiz>? studentQuiz;

  GetStudentQuizByRoomIdEntity({
    this.studentQuiz,
  });

  factory GetStudentQuizByRoomIdEntity.fromJson(Map<String, dynamic> json) => GetStudentQuizByRoomIdEntity(
    studentQuiz: json["data"] == null ? [] : List<StudentQuiz>.from(json["data"]!.map((x) => StudentQuiz.fromJson(x))),
  );

  @override
  List<Object?> get props => [studentQuiz];

}

class StudentQuizEntity extends Equatable{
  int? id;
  int? score;
  String? sended;
  int? studentId;
  int? quizId;
  int? roomId;
  String? createdAt;
  String? updatedAt;
  Quiz? quiz;

  StudentQuizEntity({
    this.id,
    this.score,
    this.sended,
    this.studentId,
    this.quizId,
    this.roomId,
    this.createdAt,
    this.updatedAt,
    this.quiz,
  });

  factory StudentQuizEntity.fromJson(Map<String, dynamic> json) => StudentQuizEntity(
    id: json["id"],
    score: json["score"],
    sended: json["sended"],
    studentId: json["student_id"],
    quizId: json["quiz_id"],
    roomId: json["room_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    quiz: json["quiz"] == null ? null : Quiz.fromJson(json["quiz"]),
  );

  @override
  List<Object?> get props => [id, score, sended, studentId, quizId, roomId, createdAt, updatedAt, quiz];
}

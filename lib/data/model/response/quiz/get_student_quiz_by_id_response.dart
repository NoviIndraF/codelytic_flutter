import 'dart:convert';

import 'package:codelytic/domain/entities/quiz/get_student_quiz_by_id_entity.dart';
import 'package:codelytic/domain/entities/student/get_student_entity.dart';
import 'package:equatable/equatable.dart';

GetStudentQuizByIdResponse getQuizByIdFromJson(String str) => GetStudentQuizByIdResponse.fromJson(json.decode(str));
class GetStudentQuizByIdResponse extends Equatable{
  List<StudentQuiz>? studentQuiz;

  GetStudentQuizByIdResponse({
    this.studentQuiz,
  });

  factory GetStudentQuizByIdResponse.fromJson(Map<String, dynamic> json) => GetStudentQuizByIdResponse(
    studentQuiz: json["data"] == null ? [] : List<StudentQuiz>.from(json["data"]!.map((x) => StudentQuiz.fromJson(x))),
  );

  GetStudentQuizByIdEntity toEntity()=> GetStudentQuizByIdEntity(studentQuiz: studentQuiz);

  @override
  List<Object?> get props => [studentQuiz];

}

class StudentQuiz extends Equatable{
  int? id;
  int? score;
  String? sended;
  int? studentId;
  int? quizId;
  int? roomId;
  String? createdAt;
  String? updatedAt;
  Quiz? quiz;

  StudentQuiz({
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

  factory StudentQuiz.fromJson(Map<String, dynamic> json) => StudentQuiz(
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

  StudentQuizEntity toEntity()=> StudentQuizEntity(id: id, score: score, sended: sended, studentId: studentId, quizId: quizId, roomId: roomId, createdAt: createdAt, updatedAt: updatedAt, quiz: quiz);

  @override
  List<Object?> get props => [id, score, sended, studentId, quizId, roomId, createdAt, updatedAt, quiz];
}

class Quiz extends Equatable{
  int? id;
  String? slug;
  String? title;
  String? description;
  int? level;
  int? status;
  String? createdAt;
  String? updatedAt;

  Quiz({
    this.id,
    this.slug,
    this.title,
    this.description,
    this.level,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
    id: json["id"],
    slug: json["slug"],
    title: json["title"],
    description: json["description"],
    level: json["level"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  QuizEntity toEntity()=> QuizEntity(id: id, slug: slug, title: title, description: description, level: level, status: status, createdAt: createdAt, updatedAt: updatedAt);

  @override
  List<Object?> get props => [id, slug, title, description, level, status, createdAt, updatedAt];
}

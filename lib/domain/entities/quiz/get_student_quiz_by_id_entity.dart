import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../data/model/response/quiz/get_student_quiz_by_id_response.dart';

GetStudentQuizByIdEntity getQuizByIdFromJson(String str) => GetStudentQuizByIdEntity.fromJson(json.decode(str));
class GetStudentQuizByIdEntity extends Equatable{
  List<StudentQuiz>? studentQuiz;

  GetStudentQuizByIdEntity({
    this.studentQuiz,
  });

  factory GetStudentQuizByIdEntity.fromJson(Map<String, dynamic> json) => GetStudentQuizByIdEntity(
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

class QuizEntity extends Equatable{
  int? id;
  String? slug;
  String? title;
  String? description;
  int? level;
  String? status;
  String? createdAt;
  String? updatedAt;

  QuizEntity({
    this.id,
    this.slug,
    this.title,
    this.description,
    this.level,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory QuizEntity.fromJson(Map<String, dynamic> json) => QuizEntity(
    id: json["id"],
    slug: json["slug"],
    title: json["title"],
    description: json["description"],
    level: json["level"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  @override
  List<Object?> get props => [id, slug, title, description, level, status, createdAt, updatedAt];
}

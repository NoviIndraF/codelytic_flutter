import 'dart:convert';

import 'package:codelytic/data/model/response/quiz/get_quiz_by_level_and_room_id.dart';
import 'package:equatable/equatable.dart';

GetQuizByLevelAndRoomIdEntity getQuizByLevelAndRoomFromJson(String str) => GetQuizByLevelAndRoomIdEntity.fromJson(json.decode(str));

class GetQuizByLevelAndRoomIdEntity extends Equatable {
  List<Quiz>? quiz;

  GetQuizByLevelAndRoomIdEntity({
    this.quiz,
  });

  factory GetQuizByLevelAndRoomIdEntity.fromJson(Map<String, dynamic> json) => GetQuizByLevelAndRoomIdEntity(
    quiz: json["data"] == null ? [] : List<Quiz>.from(json["data"]!.map((x) => Quiz.fromJson(x))),
  );

  @override
  // TODO: implement props
  List<Object?> get props => [quiz];

}

class QuestionEntity extends Equatable{
  int? id;
  String? slug;
  String? title;
  String? description;
  String? content;
  String? note;
  String? answerCorrect;
  int? quizId;
  String? createdAt;
  String? updatedAt;
  Quiz? quiz;

  QuestionEntity({
    this.id,
    this.slug,
    this.title,
    this.description,
    this.content,
    this.note,
    this.answerCorrect,
    this.quizId,
    this.createdAt,
    this.updatedAt,
    this.quiz,
  });

  factory QuestionEntity.fromJson(Map<String, dynamic> json) => QuestionEntity(
    id: json["id"],
    slug: json["slug"],
    title: json["title"],
    description: json["description"],
    content: json["content"],
    note: json["note"],
    answerCorrect: json["answer_correct"],
    quizId: json["quiz_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    quiz: json["quiz"] == null ? null : Quiz.fromJson(json["quiz"]),
  );

  @override
  List<Object?> get props => [
    id,
    slug,
    title,
    description,
    content,
    note,
    answerCorrect,
    quizId,
    createdAt,
    updatedAt,
  ];
}

class QuizEntity extends Equatable{
  int? id;
  String? slug;
  String? title;
  String? description;
  int? level;
  int? status;
  String? createdAt;
  String? updatedAt;
  List<Question>? question;

  QuizEntity({
    this.id,
    this.slug,
    this.title,
    this.description,
    this.level,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.question,
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
    question: json["question"] == null ? [] : List<Question>.from(json["question"]!.map((x) => Question.fromJson(x))),
  );

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    slug,
    title,
    description,
    level,
    status,
    createdAt,
    updatedAt,
    question,
  ];
}


import 'dart:convert';

import 'package:codelytic/data/model/response/home/get_all_data_by_room_code_response.dart';
import 'package:codelytic/domain/entities/quiz/get_quiz_by_level_and_room_id_entity.dart';
import 'package:equatable/equatable.dart';

GetQuizByLevelAndRoomIdResponse getQuizByLevelAndRoomFromJson(String str) => GetQuizByLevelAndRoomIdResponse.fromJson(json.decode(str));

class GetQuizByLevelAndRoomIdResponse extends Equatable {
  List<Quiz>? quiz;

  GetQuizByLevelAndRoomIdResponse({
    this.quiz,
  });

  factory GetQuizByLevelAndRoomIdResponse.fromJson(Map<String, dynamic> json) => GetQuizByLevelAndRoomIdResponse(
    quiz: json["data"] == null ? [] : List<Quiz>.from(json["data"]!.map((x) => Quiz.fromJson(x))),
  );

  GetQuizByLevelAndRoomIdEntity toEntity()=> GetQuizByLevelAndRoomIdEntity(quiz: quiz);

  @override
  // TODO: implement props
  List<Object?> get props => [quiz];

}

class Question extends Equatable{
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

  Question({
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

  factory Question.fromJson(Map<String, dynamic> json) => Question(
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

  QuestionEntity toEntity() => QuestionEntity(id: id, slug: slug, title: title, description: description, content: content, note: note, answerCorrect: answerCorrect, quiz: quiz, createdAt: createdAt, updatedAt: updatedAt, quizId: quizId);

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

class Quiz extends Equatable{
  int? id;
  String? slug;
  String? title;
  String? description;
  int? level;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<Question>? question;

  Quiz({
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

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
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

  QuizEntity toEntity() => QuizEntity(id: id, slug: slug, title: title, description: description, level: level, status: status, createdAt: createdAt, updatedAt: updatedAt, question: question);

  @override
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


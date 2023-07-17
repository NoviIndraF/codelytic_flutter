
import 'package:codelytic/data/model/response/quiz/get_quiz_by_level_and_room_id.dart';
import 'package:equatable/equatable.dart';

class GetQuizByRoomIdEntity extends Equatable{
  int? id;
  String? code;
  String? slug;
  String? name;
  String? major;
  String? description;
  String? createdAt;
  String? updatedAt;
  List<Quiz>? quiz;

  GetQuizByRoomIdEntity({
    this.id,
    this.code,
    this.slug,
    this.name,
    this.major,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.quiz,
  });

  factory GetQuizByRoomIdEntity.fromJson(Map<String, dynamic> json) => GetQuizByRoomIdEntity(
    id: json["id"],
    code: json["code"],
    slug: json["slug"],
    name: json["name"],
    major: json["major"],
    description: json["description"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    quiz: json["quiz"] == null ? [] : List<Quiz>.from(json["quiz"]!.map((x) => Quiz.fromJson(x))),
  );

  @override
  List<Object?> get props => [id, code, slug, name, major, description, createdAt, updatedAt, quiz];
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

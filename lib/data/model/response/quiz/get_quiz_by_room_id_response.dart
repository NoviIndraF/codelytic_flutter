
import 'package:codelytic/data/model/response/quiz/get_quiz_by_level_and_room_id.dart';
import 'package:codelytic/domain/entities/quiz/get_quiz_by_room_code_entity.dart';
import 'package:equatable/equatable.dart';

class GetQuizByRoomIdResponse extends Equatable{
  int? id;
  String? code;
  String? slug;
  String? name;
  String? major;
  String? description;
  String? createdAt;
  String? updatedAt;
  List<Quiz>? quiz;

  GetQuizByRoomIdResponse({
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

  factory GetQuizByRoomIdResponse.fromJson(Map<String, dynamic> json) => GetQuizByRoomIdResponse(
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

  GetQuizByRoomIdEntity toEntity() => GetQuizByRoomIdEntity(id: id, code: code, slug: slug, name: name, major: major, description: description, createdAt: createdAt, updatedAt: updatedAt, quiz: quiz);

  @override
  List<Object?> get props => [id, code, slug, name, major, description, createdAt, updatedAt, quiz];
}

import 'package:codelytic/domain/entities/authentication/get_room_by_code_response_entity.dart';
import 'package:codelytic/domain/entities/materi/get_chapter_by_materi_id_entity.dart';
import 'package:equatable/equatable.dart';

class GetChapterByMateriIdResponse extends Equatable{
  int? id;
  String? slug;
  String? title;
  String? description;
  int? status;
  String? createdAt;
  String? updatedAt;
  List<Chapter>? chapter;

  GetChapterByMateriIdResponse({
    this.id,
    this.slug,
    this.title,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.chapter,
  });

  factory GetChapterByMateriIdResponse.fromJson(Map<String, dynamic> json) => GetChapterByMateriIdResponse(
    id: json["id"],
    slug: json["slug"],
    title: json["title"],
    description: json["description"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    chapter: json["chapter"] == null ? [] : List<Chapter>.from(json["chapter"]!.map((x) => Chapter.fromJson(x))),
  );

  GetChapterByMateriIdEntity toEntity()=> GetChapterByMateriIdEntity(id: id, slug: slug, title: title, description: description, status: status, createdAt: createdAt, updatedAt: updatedAt, chapter: chapter);

  @override
  List<Object?> get props => [id, slug, title, description, status, createdAt, updatedAt, chapter];
}
class Chapter extends Equatable{
  int? id;
  String? slug;
  String? index;
  String? title;
  String? description;
  String? content;
  String? createdAt;
  String? updatedAt;

  Chapter({
    this.id,
    this.slug,
    this.index,
    this.title,
    this.description,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
    id: json["id"],
    slug: json["slug"],
    index: json["index"],
    title: json["title"],
    description: json["description"],
    content: json["content"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  ChapterEntity toEntity() => ChapterEntity(id: id, slug: slug, index: index, title: title, description: description, content: content, createdAt: createdAt, updatedAt: updatedAt);

  @override
  List<Object?> get props => [id, slug, index, title, description, content, createdAt, updatedAt];
}




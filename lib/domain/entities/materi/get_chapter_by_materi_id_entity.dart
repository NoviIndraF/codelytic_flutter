// To parse this JSON data, do
//
//     final getChapterByMateriId = getChapterByMateriIdFromJson(jsonString);

import 'dart:convert';

import 'package:codelytic/data/model/response/materi/get_chapter_by_materi_id.dart';
import 'package:equatable/equatable.dart';

class GetChapterByMateriIdEntity extends Equatable{
  int? id;
  String? slug;
  String? title;
  String? description;
  int? status;
  String? createdAt;
  String? updatedAt;
  List<Chapter>? chapter;

  GetChapterByMateriIdEntity({
    this.id,
    this.slug,
    this.title,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.chapter,
  });

  factory GetChapterByMateriIdEntity.fromJson(Map<String, dynamic> json) => GetChapterByMateriIdEntity(
    id: json["id"],
    slug: json["slug"],
    title: json["title"],
    description: json["description"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    chapter: json["chapter"] == null ? [] : List<Chapter>.from(json["chapter"]!.map((x) => Chapter.fromJson(x))),
  );

  @override
  List<Object?> get props => [id, slug, title, description, status, createdAt, updatedAt, chapter];
}
class ChapterEntity extends Equatable{
  int? id;
  String? slug;
  String? index;
  String? title;
  String? description;
  String? content;
  String? createdAt;
  String? updatedAt;

  ChapterEntity({
    this.id,
    this.slug,
    this.index,
    this.title,
    this.description,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  factory ChapterEntity.fromJson(Map<String, dynamic> json) => ChapterEntity(
    id: json["id"],
    slug: json["slug"],
    index: json["index"],
    title: json["title"],
    description: json["description"],
    content: json["content"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  @override
  List<Object?> get props => [id, slug, index, title, description, content, createdAt, updatedAt];
}




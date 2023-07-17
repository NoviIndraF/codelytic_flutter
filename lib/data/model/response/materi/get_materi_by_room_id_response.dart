import 'dart:convert';

import 'package:codelytic/domain/entities/materi/get_materi_by_room_code_entity.dart';
import 'package:equatable/equatable.dart';

class GetMateriByRoomIdResponse extends Equatable{
  int? id;
  String? code;
  String? slug;
  String? name;
  String? major;
  String? description;
  String? createdAt;
  String? updatedAt;
  List<Materi>? materi;

  GetMateriByRoomIdResponse({
    this.id,
    this.code,
    this.slug,
    this.name,
    this.major,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.materi,
  });

  factory GetMateriByRoomIdResponse.fromJson(Map<String, dynamic> json) => GetMateriByRoomIdResponse(
    id: json["id"],
    code: json["code"],
    slug: json["slug"],
    name: json["name"],
    major: json["major"],
    description: json["description"],
    createdAt: json["created_at"] == null ? null : (json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : (json["updated_at"]),
    materi: json["materi"] == null ? [] : List<Materi>.from(json["materi"]!.map((x) => Materi.fromJson(x))),
  );

  GetMateriByRoomIdResponseEntity toEntity() => GetMateriByRoomIdResponseEntity(id: id, code: code, slug: slug, name: name, major: major, description: description, createdAt: createdAt, updatedAt: updatedAt, materi: materi);

  @override
  // TODO: implement props
  List<Object?> get props => [id, code, slug, name, major, description, createdAt, updatedAt, materi];

}

class Materi extends Equatable{
  int? id;
  String? slug;
  String? title;
  String? description;
  int? status;
  String? createdAt;
  String? updatedAt;
  Materi({
    this.id,
    this.slug,
    this.title,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Materi.fromJson(Map<String, dynamic> json) => Materi(
    id: json["id"],
    slug: json["slug"],
    title: json["title"],
    description: json["description"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : (json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : (json["updated_at"]),
  );

  MateriEntity toEntity() => MateriEntity(id: id, slug: slug, title: title, description: description, status: status, createdAt: createdAt, updatedAt: updatedAt);

  @override
  List<Object?> get props => [id, slug, title, description, status, createdAt, updatedAt];
}


import 'dart:convert';

import 'package:codelytic/data/model/response/materi/get_materi_by_room_id_response.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class MateriEntity extends Equatable{
  int? id;
  String? slug;
  String? title;
  String? description;
  int? status;
  String? createdAt;
  String? updatedAt;
  MateriEntity({
    this.id,
    this.slug,
    this.title,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory MateriEntity.fromJson(Map<String, dynamic> json) => MateriEntity(
    id: json["id"],
    slug: json["slug"],
    title: json["title"],
    description: json["description"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : (json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : (json["updated_at"]),
  );

  @override
  // TODO: implement props
  List<Object?> get props => [id, slug, title, description, status, createdAt, updatedAt];
}

class GetMateriByRoomIdResponseEntity extends Equatable{
  int? id;
  String? code;
  String? slug;
  String? name;
  String? major;
  String? description;
  String? createdAt;
  String? updatedAt;
  List<Materi>? materi;

  GetMateriByRoomIdResponseEntity({
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

  factory GetMateriByRoomIdResponseEntity.fromJson(Map<String, dynamic> json) => GetMateriByRoomIdResponseEntity(
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

  @override
  // TODO: implement props
  List<Object?> get props => [id,code,slug,name,major,description,createdAt,updatedAt, materi];

}
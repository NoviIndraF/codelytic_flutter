import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable{
  int? id;
  String? slug;
  String? title;
  String? description;
  String? note;
  String? content;
  String? deadline;
  int? status;
  int? roomId;
  String? createdAt;
  String? updatedAt;

  TaskEntity({
    this.id,
    this.slug,
    this.title,
    this.description,
    this.note,
    this.content,
    this.deadline,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory TaskEntity.fromJson(Map<String, dynamic> json) => TaskEntity(
    id: json["id"],
    slug: json["slug"],
    title: json["title"],
    description: json["description"],
    note: json["note"],
    content: json["content"],
    deadline: json["deadline"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  @override
  // TODO: implement props
  List<Object?> get props => [id, slug, title, description, note, content, deadline, status, createdAt, updatedAt];
}
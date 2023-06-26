
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/task/task_entity.dart';

class Task extends Equatable{
  int? id;
  String? slug;
  String? title;
  String? description;
  String? note;
  String? content;
  String? deadline;
  String? status;
  int? roomId;
  bool? checked;
  String? createdAt;
  String? updatedAt;

  Task({
    this.id,
    this.slug,
    this.title,
    this.description,
    this.note,
    this.content,
    this.deadline,
    this.status,
    this.checked,
    this.createdAt,
    this.updatedAt,
  });

  TaskEntity toEntity() => TaskEntity(id: id, slug: slug, title: title, description: description, note: note, deadline: deadline, content: content, status: status, createdAt: createdAt, updatedAt: updatedAt);

  factory Task.fromJson(Map<String, dynamic> json) => Task(
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
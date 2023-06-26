
import 'package:codelytic/domain/entities/task/get_student_task_by_room_id_entity.dart';
import 'package:equatable/equatable.dart';

class Task extends Equatable{
  int? id;
  String? slug;
  String? title;
  String? description;
  String? note;
  String? deadline;

  Task({
    this.id,
    this.slug,
    this.title,
    this.description,
    this.note,
    this.deadline,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["id"],
    slug: json["slug"],
    title: json["title"],
    description: json["description"],
    note: json["note"],
    deadline: json["deadline"],
  );

  TaskEntity toEntity()=> TaskEntity(id: id, slug: slug, title: title, description: description, note: note, deadline: description);

  @override
  List<Object?> get props => [id, slug, title, description, note,deadline];
}
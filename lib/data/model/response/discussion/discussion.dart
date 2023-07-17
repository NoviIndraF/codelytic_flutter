
import 'package:codelytic/domain/entities/discussion/discussion_entity.dart';
import 'package:equatable/equatable.dart';

class Discussion extends Equatable{
  int? id;
  String? slug;
  String? title;
  String? description;
  String? content;
  int? status;
  int? roomId;
  String? createdAt;
  String? updatedAt;

  Discussion({
    this.id,
    this.slug,
    this.title,
    this.description,
    this.content,
    this.status,
    this.roomId,
    this.createdAt,
    this.updatedAt,
  });

  factory Discussion.fromJson(Map<String, dynamic> json) => Discussion(
    id: json["id"],
    slug: json["slug"],
    title: json["title"],
    description: json["description"],
    content: json["content"],
    status: json["status"],
    roomId: json["room_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  DiscussionEntity toEntity()=> DiscussionEntity(id: id, slug: slug, title: title, description: description, content: content, status: status, roomId: roomId, createdAt: createdAt, updatedAt: updatedAt);

  @override
  List<Object?> get props => [id, slug, title, description, content, status, roomId, createdAt, updatedAt];
}
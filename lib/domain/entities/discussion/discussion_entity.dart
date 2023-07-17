
import 'package:equatable/equatable.dart';

class DiscussionEntity extends Equatable{
  int? id;
  String? slug;
  String? title;
  String? description;
  String? content;
  int? status;
  int? roomId;
  String? createdAt;
  String? updatedAt;

  DiscussionEntity({
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

  factory DiscussionEntity.fromJson(Map<String, dynamic> json) => DiscussionEntity(
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

  @override
  // TODO: implement props
  List<Object?> get props => [id, slug, title, description, content, status, roomId, createdAt, updatedAt];
}
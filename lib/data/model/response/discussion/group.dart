import 'package:codelytic/domain/entities/discussion/group_entity.dart';
import 'package:equatable/equatable.dart';

import 'discussion.dart';

class Group extends Equatable{
  int? id;
  String? code;
  String? slug;
  String? name;
  String? description;
  int? discussionId;
  String? createdAt;
  String? updatedAt;
  Discussion? discussion;

  Group({
    this.id,
    this.code,
    this.slug,
    this.name,
    this.description,
    this.discussionId,
    this.createdAt,
    this.updatedAt,
    this.discussion,
  });

  factory Group.fromJson(Map<String, dynamic> json) => Group(
    id: json["id"],
    code: json["code"],
    slug: json["slug"],
    name: json["name"],
    description: json["description"],
    discussionId: json["discussion_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    discussion: json["discussion"] == null ? null : Discussion.fromJson(json["discussion"]),
  );

  GroupEntity toEntity()=> GroupEntity(id: id, code: code, slug: slug, name: name, description: description, discussion: discussion, createdAt: createdAt, updatedAt: updatedAt, discussionId: discussionId);

  @override
  // TODO: implement props
  List<Object?> get props => [id, code, slug, name, description, discussion, discussionId, createdAt, updatedAt, discussion];
}

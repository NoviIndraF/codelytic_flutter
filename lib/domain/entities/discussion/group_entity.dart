
import 'package:codelytic/data/model/response/discussion/discussion.dart';
import 'package:equatable/equatable.dart';

class GroupEntity extends Equatable{
  int? id;
  String? code;
  String? slug;
  String? name;
  String? description;
  int? discussionId;
  String? createdAt;
  String? updatedAt;
  Discussion? discussion;

  GroupEntity({
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

  factory GroupEntity.fromJson(Map<String, dynamic> json) => GroupEntity(
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

  @override
  // TODO: implement props
  List<Object?> get props => [id, code, slug, name, description, discussion, discussionId, createdAt, updatedAt, discussion];
}
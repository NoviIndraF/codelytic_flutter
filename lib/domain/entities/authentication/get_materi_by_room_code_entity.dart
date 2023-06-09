import 'package:equatable/equatable.dart';

class GetMateriByRoomCodeEntity extends Equatable{
  GetMateriByRoomCodeEntity({
    required this.id,
    required this.slug,
    required this.title,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String slug;
  late final String title;
  late final String description;
  late final String status;
  late final String createdAt;
  late final String updatedAt;

  GetMateriByRoomCodeEntity.fromJson(Map<String, dynamic> json){
    id = json['id'];
    slug = json['slug'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['slug'] = slug;
    _data['title'] = title;
    _data['description'] = description;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, slug, title, description, status, createdAt, updatedAt];
}
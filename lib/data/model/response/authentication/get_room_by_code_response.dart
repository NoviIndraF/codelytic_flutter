import 'package:codelytic/domain/entities/authentication/get_room_by_code_response_entity.dart';
import 'package:equatable/equatable.dart';

class GetRoomByCodeResponse extends Equatable{
  GetRoomByCodeResponse({
     this.id,
     this.code,
     this.slug,
     this.name,
     this.major,
     this.description,
     this.user,
  });
    int? id;
    String? code;
    String? slug;
    String? name;
    String? major;
    String? description;
    User? user;

  GetRoomByCodeResponse.fromJson(Map<String, dynamic> json){
    id = json['id'];
    code = json['code'];
    slug = json['slug'];
    name = json['name'];
    major = json['major'];
    description = json['description'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['code'] = code;
    _data['slug'] = slug;
    _data['name'] = name;
    _data['major'] = major;
    _data['description'] = description;
    _data['user'] = user?.toJson();
    return _data;
  }

  GetRoomByCodeResponseEntity toEntity() => GetRoomByCodeResponseEntity(id: id, code: code, slug: slug, name: name, major: major, description: description, user: user);

  @override
  // TODO: implement props
  List<Object?> get props => [id, code, slug, name, major, description, user];
}

class User extends Equatable{
  User({
     this.id,
     this.name,
     this.username,
     this.email,
     this.status,
     this.showingStatus,
  });
    int?id;
   String? name;
    String? username;
    String? email;
    String? status;
    String? showingStatus;

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    status = json['status'];
    showingStatus = json['showing_status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['username'] = username;
    _data['email'] = email;
    _data['status'] = status;
    _data['showing_status'] = showingStatus;
    return _data;
  }

  UserEntity toEntity() => UserEntity(id: id, name: name, username: username, email: email, status: status, showingStatus: showingStatus);
  @override
  // TODO: implement props
  List<Object?> get props => [id, name, username, email, status, showingStatus];
}
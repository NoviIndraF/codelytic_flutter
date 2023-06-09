import 'package:codelytic/data/model/response/authentication/get_room_by_code_response.dart';
import 'package:equatable/equatable.dart';

class GetRoomByCodeResponseEntity extends Equatable{
  GetRoomByCodeResponseEntity({
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

  GetRoomByCodeResponseEntity.fromJson(Map<String, dynamic> json){
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

  @override
  // TODO: implement props
  List<Object?> get props => [id, code, slug, name, major, description, user];
}

class UserEntity extends Equatable{
  UserEntity({
     this.id,
     this.name,
     this.username,
     this.email,
     this.status,
     this.showingStatus,
  });
    int? id;
    String? name;
    String? username;
    String? email;
    String? status;
    String? showingStatus;

  UserEntity.fromJson(Map<String, dynamic> json){
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

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, username, email, status, showingStatus];
}
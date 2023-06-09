import 'package:codelytic/data/model/response/authentication/get_student_room_response.dart';
import 'package:equatable/equatable.dart';

class GetStudentRoomResponseEntity extends Equatable{
  GetStudentRoomResponseEntity({
    required this.meta,
    required this.data,
  });
  late final Meta meta;
  late final List<Data> data;

  GetStudentRoomResponseEntity.fromJson(Map<String, dynamic> json){
    meta = Meta.fromJson(json['meta']);
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  @override
  List<Object?> get props => [meta, data];
}

class MetaEntity extends Equatable{
  MetaEntity({
    required this.code,
    required this.status,
    required this.message,
  });
  late final int code;
  late final String status;
  late final String message;

  MetaEntity.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
    message = json['message'];
  }

  @override
  List<Object?> get props => [code, status, message];
}

class DataEntity extends Equatable{
  DataEntity({
    required this.id,
    required this.code,
    required this.studentId,
    required this.roomId,
    required this.room,
  });
  late final int id;
  late final String code;
  late final int studentId;
  late final int roomId;
  late final Room room;

  DataEntity.fromJson(Map<String, dynamic> json){
    id = json['id'];
    code = json['code'];
    studentId = json['student_id'];
    roomId = json['room_id'];
    room = Room.fromJson(json['room']);
  }

  @override
  List<Object?> get props => [id, code, studentId, roomId, room];
}

class RoomEntity extends Equatable{
  RoomEntity({
    required this.id,
    required this.code,
    required this.slug,
    required this.name,
    required this.major,
    required this.description,
    required this.userId,
    required this.user,
  });
  late final int id;
  late final String code;
  late final String slug;
  late final String name;
  late final String major;
  late final String description;
  late final int userId;
  late final User user;

  RoomEntity.fromJson(Map<String, dynamic> json){
    id = json['id'];
    code = json['code'];
    slug = json['slug'];
    name = json['name'];
    major = json['major'];
    description = json['description'];
    userId = json['user_id'];
    user = User.fromJson(json['user']);
  }

  @override
  List<Object?> get props => [id, code, slug, name, major, description, userId,user];
}

class UserEntity extends Equatable{
  UserEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.status,
    required this.showingStatus,
  });
  late final int id;
  late final String name;
  late final String username;
  late final String status;
  late final String showingStatus;

  UserEntity.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    username = json['username'];
    status = json['status'];
    showingStatus = json['showing_status'];
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, username, status, showingStatus];
}
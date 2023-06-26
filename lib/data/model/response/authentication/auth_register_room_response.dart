import 'package:codelytic/domain/entities/authentication/auth_register_room_response_entity.dart';
import 'package:equatable/equatable.dart';

class AuthRegisterRoomResponse extends Equatable{
  AuthRegisterRoomResponse({
    this.room_id,
  });
  int? room_id;

  AuthRegisterRoomResponse.fromJson(Map<String, dynamic> json){
    room_id = json['room_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['room_id'] = room_id;
    return _data;
  }

  AuthRegisterRoomResponseEntity toEntity() => AuthRegisterRoomResponseEntity(room_id: room_id);

  @override
  List<Object?> get props => [room_id];
}
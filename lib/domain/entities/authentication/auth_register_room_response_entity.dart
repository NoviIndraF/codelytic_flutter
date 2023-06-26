import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class AuthRegisterRoomResponseEntity extends Equatable{
  AuthRegisterRoomResponseEntity({
    this.room_id,
  });
  int? room_id;

  AuthRegisterRoomResponseEntity.fromJson(Map<String, dynamic> json){
    room_id = json['room_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['room_id'] = room_id;
    return _data;
  }

  @override
  List<Object?> get props => [room_id];
}
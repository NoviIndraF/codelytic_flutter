import 'package:codelytic/domain/entities/authentication/auth_register_room_response_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class AuthRegisterRoomResponse extends Equatable{
  AuthRegisterRoomResponse({
    this.code,
  });
  String? code;

  AuthRegisterRoomResponse.fromJson(Map<String, dynamic> json){
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    return _data;
  }

  AuthRegisterRoomResponseEntity toEntity() => AuthRegisterRoomResponseEntity(code: code);

  @override
  List<Object?> get props => [code];
}
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class AuthRegisterRoomResponseEntity extends Equatable{
  AuthRegisterRoomResponseEntity({
    this.code,
  });
  String? code;

  AuthRegisterRoomResponseEntity.fromJson(Map<String, dynamic> json){
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    return _data;
  }

  @override
  List<Object?> get props => [code];
}
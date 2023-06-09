import 'package:codelytic/domain/entities/authentication/auth_response.dart';
import 'package:equatable/equatable.dart';

class AuthResponse extends Equatable{
  AuthResponse({
    required this.meta,
    required this.data,
  });
  late final Meta meta;
  late final bool data;

  AuthResponse.fromJson(Map<String, dynamic> json){
    meta = Meta.fromJson(json['meta']);
    data = json['data'];
  }

  AuthResponseEntity toEntity()=>AuthResponseEntity(meta: meta, data: data);

  @override
  List<Object?> get props => [meta, data];
}

class Meta extends Equatable{
  Meta({
    required this.code,
    required this.status,
    required this.message,
  });
  late final int code;
  late final String status;
  late final String message;

  Meta.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
    message = json['message'];
  }

  MetaEntity toEntity() => MetaEntity(code: code, status: status, message: message);

  @override
  List<Object?> get props => [code, status, message];
}
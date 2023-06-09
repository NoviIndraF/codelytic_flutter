import 'package:codelytic/data/model/response/authentication/auth_response.dart';
import 'package:equatable/equatable.dart';

class AuthResponseEntity extends Equatable{
  AuthResponseEntity({
    required this.meta,
    required this.data,
  });
  late final Meta meta;
  late final bool data;

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

  @override
  // TODO: implement props
  List<Object?> get props => [code, status, message];
}
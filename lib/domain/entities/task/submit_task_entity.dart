import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class SubmitTaskEntity extends Equatable{
  SubmitTaskEntity({
    this.answer,
  });
  String? answer;

  SubmitTaskEntity.fromJson(Map<String, dynamic> json){
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['answer'] = answer;
    return _data;
  }

  @override
  List<Object?> get props => [answer];
}
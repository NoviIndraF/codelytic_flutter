import 'package:codelytic/domain/entities/task/submit_task_entity.dart';
import 'package:equatable/equatable.dart';

class SubmitTaskResponse extends Equatable{
  SubmitTaskResponse({
    this.answer,
  });
  String? answer;

  SubmitTaskResponse.fromJson(Map<String, dynamic> json){
    answer = json['answer'];
  }


  SubmitTaskEntity toEntity() => SubmitTaskEntity(answer: answer);

  @override
  List<Object?> get props => [answer];
}
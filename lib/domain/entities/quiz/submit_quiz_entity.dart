import 'package:equatable/equatable.dart';

class SubmitQuizEntity extends Equatable{
  SubmitQuizEntity({
    this.score,
  });
  String? score;

  SubmitQuizEntity.fromJson(Map<String, dynamic> json){
    score = json['score'];
  }

  @override
  List<Object?> get props => [score];
}
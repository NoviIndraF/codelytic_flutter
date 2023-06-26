import 'package:codelytic/domain/entities/quiz/submit_quiz_entity.dart';
import 'package:equatable/equatable.dart';

class SubmitQuizResponse extends Equatable{
  SubmitQuizResponse({
    this.score,
  });
  String? score;

  SubmitQuizResponse.fromJson(Map<String, dynamic> json){
    score = json['score'];
  }


  SubmitQuizEntity toEntity() => SubmitQuizEntity(score: score);

  @override
  List<Object?> get props => [score];
}
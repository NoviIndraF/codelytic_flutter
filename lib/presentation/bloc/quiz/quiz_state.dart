part of 'quiz_bloc.dart';

@immutable
abstract class QuizState {}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState{}

class QuizGetQuizByRoomIdState extends QuizState{
  final GetQuizByRoomIdEntity getQuizByRoomIdEntity;
  QuizGetQuizByRoomIdState(this.getQuizByRoomIdEntity);

  @override
  List<Object?> get props => [getQuizByRoomIdEntity];
}

class QuizGetQuizByLevelAndRoomIdState extends QuizState{
  final GetQuizByLevelAndRoomIdEntity getQuizByLevelAndRoomIdEntity;
  QuizGetQuizByLevelAndRoomIdState(this.getQuizByLevelAndRoomIdEntity);

  @override
  List<Object?> get props => [getQuizByLevelAndRoomIdEntity];
}

class QuizFailedState extends QuizState{
  final String message;

  QuizFailedState(this.message);

  @override
  List<Object?> get props => [message];
}

class QuizSetQuestionState extends QuizState{}
class QuizSetAnswerState extends QuizState{}

class QuizPrevQuestionButton extends QuizState{
  final bool prevButton;
  final String answer;

  QuizPrevQuestionButton(this.prevButton, this.answer);
}

class QuizNextQuestionButton extends QuizState{
  final bool nextButton;
  final String answer;

  QuizNextQuestionButton(this.nextButton, this.answer);
}

class QuizCalculateAnswerState extends QuizState{
  final int score;
  final int quiz_id;
  final List<AnswerDetail> answerDetail;

  QuizCalculateAnswerState(this.score, this.quiz_id,  this.answerDetail);
}

class QuizChangesQuestionState extends QuizState{
  final Question question;
  final int currentIndex;

  QuizChangesQuestionState(this.question, this.currentIndex);
}

class QuizGetStudentQuizByIdState extends QuizState{
  final GetStudentQuizByIdEntity response;
  QuizGetStudentQuizByIdState(this.response);

  @override
  List<Object?> get props => [response];
}

class QuizGetStudentQuizByRoomIdState extends QuizState{
  final GetStudentQuizByRoomIdEntity response;
  QuizGetStudentQuizByRoomIdState(this.response);

  @override
  List<Object?> get props => [response];
}

class QuizSubmittedState extends QuizState {
  final SubmitQuizEntity result;

  QuizSubmittedState(this.result);

  @override
  List<Object?> get props => [result];
}
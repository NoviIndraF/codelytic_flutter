part of 'quiz_bloc.dart';

@immutable
abstract class QuizEvent {}
class QuizGetQuizByRoomCodeEvent extends QuizEvent{
  final GetQuizByRoomIdRequest request;
  final String token;
  QuizGetQuizByRoomCodeEvent(this.token, this.request);

  @override
  List<Object?> get props => [token, request];
}

class QuizSetQuestionEvent extends QuizEvent{
  final int quizId;
  final List<Question> questionList;
  QuizSetQuestionEvent(this.questionList, this.quizId);

  @override
  List<Object?> get props => [questionList];
}

class QuizResetAnswertEvent extends QuizEvent{}

class QuizSetAnswertEvent extends QuizEvent{
  final int question_id;
  final String answer;
  final int index;
  QuizSetAnswertEvent(this.question_id, this.answer, this.index);

  @override
  List<Object?> get props => [question_id, answer];
}

class QuizCalculateAnswertEvent extends QuizEvent{}

class QuizGetQuizByLevelAndRoomIdEvent extends QuizEvent{
  final GetQuizByLevelAndRoomIdRequest request;
  final String token;
  QuizGetQuizByLevelAndRoomIdEvent(this.token, this.request);

  @override
  List<Object?> get props => [token, request];
}

class QuizGetStudentQuizByIdEvent extends QuizEvent{
  final String token;
  final GetStudentQuizByIdRequest request;
  QuizGetStudentQuizByIdEvent(this.token, this.request);

  @override
  List<Object?> get props => [token, request];
}

class QuizGetStudentQuizByRoomIdEvent extends QuizEvent{
  final String token;
  final GetStudentQuizByRoomIdRequest request;
  QuizGetStudentQuizByRoomIdEvent(this.token, this.request);

  @override
  List<Object?> get props => [token, request];
}

class QuizChangesQuestionEvent extends QuizEvent{
  final int index;
  final bool isNext;
  final bool isPrev;
  QuizChangesQuestionEvent(this.index, this.isNext, this.isPrev);

  @override
  List<Object?> get props => [index];
}

class QuizSubmitEvent extends QuizEvent{
  final String token;
  final SubmitQuizRequest request;
  QuizSubmitEvent(this.token, this.request);

  @override
  List<Object?> get props => [token, request];
}
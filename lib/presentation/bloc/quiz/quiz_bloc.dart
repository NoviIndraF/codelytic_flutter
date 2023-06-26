import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:codelytic/data/model/request/quiz/answer.dart';
import 'package:codelytic/data/model/request/quiz/answer_detail.dart';
import 'package:codelytic/data/model/request/quiz/get_quiz_by_level_and_room_id_request.dart';
import 'package:codelytic/data/model/request/quiz/get_quiz_by_room_id_request.dart';
import 'package:codelytic/data/model/request/quiz/get_student_quiz_by_id_request.dart';
import 'package:codelytic/data/model/request/quiz/get_student_quiz_by_room_id.dart';
import 'package:codelytic/data/model/request/quiz/submit_quiz_request.dart';
import 'package:codelytic/data/model/response/quiz/get_quiz_by_level_and_room_id.dart';
import 'package:codelytic/domain/entities/quiz/get_quiz_by_level_and_room_id_entity.dart';
import 'package:codelytic/domain/entities/quiz/get_quiz_by_room_code_entity.dart';
import 'package:codelytic/domain/entities/quiz/get_student_quiz_by_id_entity.dart';
import 'package:codelytic/domain/entities/quiz/get_student_quiz_by_room_id_entity.dart';
import 'package:codelytic/domain/entities/quiz/submit_quiz_entity.dart';
import 'package:codelytic/domain/usecase/quiz/quiz_usecase.dart';
import 'package:meta/meta.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final QuizUsecase quizUseCase;

  List<Question>? listQuestion = [];
  List<Answer>? listAnswer = [];
  int quizId =0;
  QuizBloc(this.quizUseCase) : super(QuizInitial()) {
    on<QuizEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<QuizGetQuizByRoomCodeEvent>((event, emit) async {
      emit(QuizLoading());
      print("QuizGetQuizByRoomCodeEvent :");

      final getQuiz =
          await quizUseCase.getQuizByRoomCode(event.token, event.request);
      getQuiz.fold((failure) => emit(QuizFailedState(failure.toString())),
          (data) {
        emit(QuizGetQuizByRoomIdState(data));
      });
    });

    on<QuizGetQuizByLevelAndRoomIdEvent>((event, emit) async {
      emit(QuizLoading());
      print("QuizGetQuizByLevelAndRoomIdEvent :");

      final getQuiz =
          await quizUseCase.getQuizByLevelAndRoomId(event.token, event.request);
      getQuiz.fold((failure) => emit(QuizFailedState(failure.toString())),
          (data) {
        emit(QuizGetQuizByLevelAndRoomIdState(data));
      });
    });

    on<QuizSetQuestionEvent>((event, emit) async {
      print("QuizSetQuestionEvent :");
      quizId = event.quizId;
      if (listQuestion == null || listQuestion!.isEmpty) {
        listQuestion = event.questionList;
      } else {
        listQuestion = event.questionList;
      }
      Random random = Random();
      listQuestion?.shuffle(random);
      emit(QuizSetQuestionState());
    });

    on<QuizChangesQuestionEvent>((event, emit) async {
      emit(QuizLoading());
      print("QuizChangesQuestionEvent :");

      Question question = Question();
      int index = 0;
      if (event.isNext) {
        index = event.index + 1;
        question = listQuestion![index];
        String? answer = listAnswer
            ?.firstWhere((answer) => answer.question_id == question.id,
                orElse: () => Answer())
            .answer
            .toString();
        if (answer == "null") {
          answer = "";
        }
        if (index + 1 == listQuestion!.length) {
          emit(QuizNextQuestionButton(false, answer ?? ""));
          emit(QuizPrevQuestionButton(true, answer ?? ""));
        } else {
          emit(QuizNextQuestionButton(true, answer ?? ""));
          emit(QuizPrevQuestionButton(true, answer ?? ""));
        }
      } else if (event.isPrev) {
        index = event.index - 1;
        question = listQuestion![index];
        String? answer = listAnswer
            ?.firstWhere((answer) => answer.question_id == question.id,
                orElse: () => Answer())
            .answer
            .toString();
        if (answer == "null") {
          answer = "";
        }
        if (index == 0) {
          emit(QuizPrevQuestionButton(false, answer ?? ""));
          emit(QuizNextQuestionButton(true, answer ?? ""));
        } else {
          emit(QuizPrevQuestionButton(true, answer ?? ""));
          emit(QuizNextQuestionButton(true, answer ?? ""));
        }
      } else if (!event.isPrev && !event.isNext) {
        index = event.index;
        question = listQuestion![index];
        String? answer = listAnswer
            ?.firstWhere((answer) => answer.question_id == question.id,
                orElse: () => Answer())
            .answer
            .toString();
        if (answer == "null") {
          answer = "";
        }
        ;
        if (index + 1 == listQuestion!.length) {
          emit(QuizPrevQuestionButton(true, answer ?? ""));
          emit(QuizNextQuestionButton(false, answer ?? ""));
        } else if (index == 0) {
          emit(QuizPrevQuestionButton(false, answer ?? ""));
          emit(QuizNextQuestionButton(true, answer ?? ""));
        } else {
          emit(QuizNextQuestionButton(true, answer ?? ""));
          emit(QuizPrevQuestionButton(true, answer ?? ""));
        }
      }
      emit(QuizChangesQuestionState(question, index));
    });

    on<QuizResetAnswertEvent>((event, emit) async {
      print("QuizResetAnswertEvent :");
      listAnswer=[];
      quizId=0;
    });

    on<QuizSetAnswertEvent>((event, emit) async {
      print("QuizSetAnswertEvent :");
      int index = event.index;
      int lengthAnswer = listAnswer?.length??0;
      Answer answer =
          Answer(question_id: event.question_id, answer: event.answer);

     if (index >= 0 && index < lengthAnswer) {
        if (listAnswer?[index].answer != answer.answer) {
          listAnswer?[index] = answer; // Ganti nilai jika index sudah ada
        }
      } else {
        listAnswer?.insert(index, answer); // Tambahkan nilai jika index belum ada
      }

      emit(QuizSetAnswerState());
      listAnswer;
    });

    on<QuizCalculateAnswertEvent>((event, emit) async {
      print("QuizCalculateAnswertEvent :");

      int score = 0;
      int? lenght = listAnswer?.length;
      List<AnswerDetail> answerDetail = [];
      for (Question question in listQuestion!) {
        for (Answer answer in listAnswer!) {
          if (question.id == answer.question_id) {
            answer.answer?.toLowerCase();
            question.answerCorrect?.toLowerCase();
            if (answer.answer.toString() == question.answerCorrect.toString()) {
              score += 1;
              answerDetail.add(AnswerDetail(
                  question_id: question.id,
                  titleQuestion: question.title,
                  answer: answer.answer,
                  answerCorrect: question.answerCorrect,
                  correct: true));
            } else {
              answerDetail.add(AnswerDetail(
                  question_id: question.id,
                  titleQuestion: question.title,
                  answer: answer.answer,
                  answerCorrect: question.answerCorrect,
                  correct: false));
            }
          }
        }
      }

      double result = (score / lenght!) * 100;
      listAnswer = [];
      emit(QuizCalculateAnswerState(result.round(), quizId,answerDetail));
    });

    on<QuizGetStudentQuizByIdEvent>((event, emit) async {
      emit(QuizLoading());
      print("QuizGetStudentQuizByIdEvent :");

      final getQuiz =
      await quizUseCase.getStudentQuizById(event.token, event.request);
      getQuiz.fold((failure) => emit(QuizFailedState(failure.toString())),
              (data) {
            emit(QuizGetStudentQuizByIdState(data));
          });
    });

    on<QuizGetStudentQuizByRoomIdEvent>((event, emit) async {
      emit(QuizLoading());
      print("QuizGetStudentQuizByRoomIdEvent :");

      final getQuiz =
      await quizUseCase.getStudentQuizByRoomId(event.token, event.request);
      getQuiz.fold((failure) => emit(QuizFailedState(failure.toString())),
              (data) {
            emit(QuizGetStudentQuizByRoomIdState(data));
          });
    });

    on<QuizSubmitEvent>((event, emit) async {
      emit(QuizLoading());
      print("QuizSubmitEvent");
      final result = await quizUseCase.submitQuiz(event.token, event.request);

      result.fold((failure) => emit(QuizFailedState(failure.toString())),
              (data) {
            if (data != "") {
              emit(QuizSubmittedState(data));
            } else {
              emit(QuizFailedState(data.toString()));
            }
          });
    });
  }
}

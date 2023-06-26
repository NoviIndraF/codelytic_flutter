import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/constant.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/text_app.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/data/model/request/quiz/get_student_quiz_by_id_request.dart';
import 'package:codelytic/data/model/request/task/get_student_task_by_room_id_request.dart';
import 'package:codelytic/data/model/response/quiz/get_quiz_by_level_and_room_id.dart';
import 'package:codelytic/presentation/bloc/quiz/quiz_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class QuizDetailPage extends StatelessWidget {
  QuizDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Quiz routes = ModalRoute.of(context)!.settings.arguments as Quiz;
    GetStudentQuizByIdRequest request = GetStudentQuizByIdRequest(
        room_id: Constant.getRoomId(), quiz_id: routes.id ?? 0);
    context
        .read<QuizBloc>()
        .add(QuizGetStudentQuizByIdEvent(Constant.getToken(), request));
    return BlocListener<QuizBloc, QuizState>(
      listener: (context, state) {
        if (state is QuizSetQuestionState) {
          Navigator.pushNamed(context, AppRoute.questionPage);
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                height: Dimens.heighMax(context),
                width: Dimens.widthMax(context),
                color: accentColor3,
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                    height: 80,
                    width: Dimens.widthMax(context),
                    color: accentColor3,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Icon(
                              Icons.arrow_back,
                              color: secondaryColor,
                            ),
                          ),
                        ),
                        Text(
                          "Kuis Detail",
                          style: secondaryTextStyle.copyWith(fontSize: 20),
                        ),
                      ],
                    )),
              ),
              Positioned(
                bottom: 1,
                top: 1,
                left: 1,
                right: 1,
                child: Center(
                  child: Container(
                    child: Wrap(
                      children: [
                        Container(
                          height: Dimens.heighMax(context) * 0.6,
                          width: Dimens.widthMax(context) * 0.7,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimens.clipRounded),
                            color: bgColor3,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Dimens.clipRounded)),
                                  color: accentColor3,
                                ),
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(Dimens.clipRounded)),
                                    color: accentColor3,
                                  ),
                                  child: Container(
                                    child: SvgPicture.asset(
                                      'assets/icons/ic-quiz.svg',
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:
                                    List.generate(routes.level ?? 0, (index) {
                                  return Icon(
                                    Icons.star,
                                    color: startColor,
                                  );
                                }),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                "${routes.title}",
                                style: subtitleTextStyle.copyWith(fontSize: 16),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                "${routes.description}",
                                style: normalTextStyle.copyWith(
                                    fontWeight: medium),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                "Jumlah soal : ${routes.question?.length}",
                                style: normalTextStyle.copyWith(
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                              StartButton(context, routes.question?.length ?? 0,
                                  routes),
                              BlocBuilder<QuizBloc, QuizState>(
                                buildWhen: (context, state) {
                                  return state is QuizGetStudentQuizByIdState;
                                },
                                builder: (context, state) {
                                  if (state is QuizGetStudentQuizByIdState) {
                                    if (state.response.studentQuiz?.length !=0){
                                      return GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                AppRoute.quizHistory);
                                          },
                                          child: Text(
                                            "Lihat Histori",
                                            style: primaryTextStyle,
                                          ));
                                    }
                                    return SizedBox();
                                  } else {
                                    return SizedBox();
                                  }
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

StatelessWidget StartButton(BuildContext context, int subQuestion, Quiz quiz) {
  return Container(
    height: 50,
    width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    child: TextButton(
        onPressed: () {
          if (subQuestion != 0) {
            context
                .read<QuizBloc>()
                .add(QuizSetQuestionEvent(quiz.question!, quiz.id ?? 0));
          }
        },
        style: TextButton.styleFrom(
          backgroundColor: (subQuestion != 0) ? accentColor2 : disableColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          TextApp.btnStart,
          style: secondaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        )),
  );
}

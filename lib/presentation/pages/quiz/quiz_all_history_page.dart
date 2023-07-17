import 'package:codelytic/app.dart';
import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/constant.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/text_app.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/data/model/request/quiz/get_student_quiz_by_room_id.dart';
import 'package:codelytic/data/model/response/task/get_student_task_by_room_id.dart';
import 'package:codelytic/presentation/bloc/quiz/quiz_bloc.dart';
import 'package:codelytic/presentation/bloc/task/task_bloc.dart';
import 'package:codelytic/presentation/widgets/item_materi_widget.dart';
import 'package:codelytic/presentation/widgets/item_quiz_history_widget.dart';
import 'package:codelytic/presentation/widgets/item_task_history_widget.dart';
import 'package:codelytic/presentation/widgets/item_task_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizAllHistoryPage extends StatelessWidget {
  const QuizAllHistoryPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    GetStudentQuizByRoomIdRequest request = GetStudentQuizByRoomIdRequest(
        room_id: Constant.getRoomId());
    context
        .read<QuizBloc>()
        .add(QuizGetStudentQuizByRoomIdEvent(Constant.getToken(), request));

    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Container(
              height: Dimens.heighMax(context) * 0.3,
              color: accentColor3,
            ),
            Expanded(
              child: Container(
                color: bgColor3,
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
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
                        TextApp.titleQuizHistory,
                        style: secondaryTextStyle.copyWith(fontSize: 16),
                      ),
                      Spacer(),

                    ],
                  )),
              Container(
                  width: Dimens.widthMax(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimens.clipRounded),
                      topLeft: Radius.circular(Dimens.clipRounded),
                    ),
                    color: bgColor3,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 24, right: 24, left: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            height: 8,
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(Dimens.clipRounded),
                              ),
                              color: accentColor3,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 28,
                        ),
                        Text(
                          TextApp.subTitleQuizHistory,
                          style: subtitleTextStyle.copyWith(),
                        ),
                        Content(context),
                        SizedBox(
                          height: 28,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        )
      ]),
    ));
  }

  StatelessWidget Content(BuildContext context) {
    return Container(
      child: BlocBuilder<QuizBloc, QuizState>(
        buildWhen: (context, state) {
          return state is QuizGetStudentQuizByRoomIdState;
        },
        builder: (context, state) {
          if (state is QuizGetStudentQuizByRoomIdState) {
            if (state.response.studentQuiz!.isEmpty) {
              return Container(
                  height: 140,
                  margin: EdgeInsets.only(
                    left: Dimens.defaultMargin,
                  ),
                  child: Center(
                    child: Text(TextApp.nothingHistoryQuiz),
                  ));
            } else {
              return Column(
                children: state.response.studentQuiz!
                    .asMap()
                    .map((index, item) => MapEntry(
                          index,
                  ItemQuizHistoryWidget(
                            index,
                            item,
                          ),
                        ))
                    .values
                    .toList(),
              );
            }
          } else if (state is QuizLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
                height: 140,
                margin: EdgeInsets.only(
                  top: 12,
                  left: Dimens.defaultMargin,
                ),
                child: Center(
                  child: Text(TextApp.somethingWrong),
                ));
          }
        },
      ),
    );
  }
}

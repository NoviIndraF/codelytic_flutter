import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/constant.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/helper.dart';
import 'package:codelytic/common/text_app.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/data/model/request/quiz/answer_detail.dart';
import 'package:codelytic/data/model/request/quiz/submit_quiz_request.dart';
import 'package:codelytic/data/model/response/quiz/get_quiz_by_level_and_room_id.dart';
import 'package:codelytic/presentation/bloc/quiz/quiz_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnswerDetailPage extends StatelessWidget {
  AnswerDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<QuizBloc>().add(QuizCalculateAnswertEvent());

    return BlocListener<QuizBloc, QuizState>(
      listener: (context, state) {
        if (state is QuizCalculateAnswerState){
          SubmitQuizRequest request = SubmitQuizRequest(
            quiz_id: state.quiz_id,
            room_id: Constant.getRoomId(),
            score: state.score,
            sended: Helper.getDateTimeNow(true, true),
          );

          context.read<QuizBloc>().add(QuizSubmitEvent(
            Constant.getToken(),
            request,
          ));
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<QuizBloc, QuizState>(
            buildWhen: (prevState, state){
              return state is QuizCalculateAnswerState;
            },
            builder: (context, state) {
              return Stack(
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
                              "Score Detail",
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
                              width: Dimens.widthMax(context) * 0.8,
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
                                    child: Icon(
                                      Icons.star,
                                      color: secondaryColor,
                                    ),
                                  ),

                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    "Score Anda : ",
                                    style: subtitleTextStyle.copyWith(
                                        fontSize: 16),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  (state is QuizCalculateAnswerState)
                                      ? Text(
                                          "${state.score}",
                                          style: subtitleTextStyle.copyWith(
                                              fontSize: 28),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      : Text(
                                          "...",
                                          style: subtitleTextStyle.copyWith(
                                              fontSize: 28),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    "Detail Jawaban : ",
                                    style: normalTextStyle.copyWith(
                                        fontWeight: medium),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  (state is QuizCalculateAnswerState)
                                      ? Column(
                                          children: state.answerDetail!
                                              .asMap()
                                              .map((index, item) => MapEntry(
                                                    index,
                                                    DetailAnswer(
                                                        index + 1, item),
                                                  ))
                                              .values
                                              .toList(),
                                        )
                                      : SizedBox(),
                                  CloseButton(context),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

StatelessWidget CloseButton(
    BuildContext context) {
  return Container(
    height: 50,
    width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    child: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: TextButton.styleFrom(
          backgroundColor: accentColor2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          TextApp.btnClose,
          style: secondaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        )),
  );
}

StatelessWidget DetailAnswer(int index, AnswerDetail? item) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            "$index. ${item?.titleQuestion}",
            style: normalTextStyle.copyWith(),
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        SizedBox(width: 8,),
        Expanded(
          flex: 2,
          child: Text(
            "${item?.answer}",
            style: normalTextStyle.copyWith(),
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),Expanded(
            flex:1,
            child:
        (item?.correct ?? false)
            ? Icon(
                Icons.check_box_outlined,
                color: accentColor2,
              )
            : Icon(
                Icons.cancel_outlined,
                color: accentColor,
              )
        )
      ],
    ),
  );
}

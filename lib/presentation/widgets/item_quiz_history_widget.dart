import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/helper.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/data/model/response/quiz/get_student_quiz_by_id_response.dart';
import 'package:codelytic/data/model/response/task/get_student_task_by_room_id.dart';
import 'package:codelytic/data/model/response/task/student_task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemQuizHistoryWidget extends StatelessWidget {
  ItemQuizHistoryWidget(this.index,  this.quizTask, {Key? key}) : super(key: key);
int? index;
StudentQuiz? quizTask;
  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: const EdgeInsets.only(
          top: 8),
      child: GestureDetector(
        onTap: (){

        },
        child: Container(
          height: 128,
          padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10
          ),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${quizTask?.quiz?.title}",
                              style: subtitleTextStyle2.copyWith(
                                  fontSize: 16
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Spacer(),
                            Text(
                              "${quizTask?.sended??"" }",
                              style: accentTextStyle.copyWith(
                                color: accentColor3,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Text(
                          "Score :",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "${quizTask?.score}",
                          style: normalTextStyle.copyWith(
                            fontSize: 28,
                            fontWeight: FontWeight.bold
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: 2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(Dimens.clipRounded),
                    ),
                    color: Colors.grey,
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

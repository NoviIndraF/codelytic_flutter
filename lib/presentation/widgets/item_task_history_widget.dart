import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/helper.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/data/model/response/task/get_student_task_by_room_id.dart';
import 'package:codelytic/data/model/response/task/student_task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemTaskHistoryWidget extends StatelessWidget {
  ItemTaskHistoryWidget(this.index,  this.studentTask, {Key? key}) : super(key: key);
int? index;
StudentTask? studentTask;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 8),
      child: GestureDetector(
        onTap: (){

        },
        child: Container(
          height: 140,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${studentTask?.task?.title}",
                              style: subtitleTextStyle2.copyWith(
                                  fontSize: 14
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "Jawaban :",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),Text(
                              "${studentTask?.answer}",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Spacer(),
                            Text(
                              "Dikirim: ${studentTask?.sended??"" }",
                              style: accentTextStyle.copyWith(
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
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(Dimens.clipRounded)
                        ),
                        color: accentColor,
                      ),
                      child: Icon(
                        Icons.book,
                        color: secondaryColor,
                      ),
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

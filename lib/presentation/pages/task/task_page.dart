import 'package:codelytic/app.dart';
import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/constant.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/text_app.dart';
import 'package:codelytic/common/theme.dart';
import 'package:codelytic/data/model/request/task/get_student_task_by_room_id_request.dart';
import 'package:codelytic/data/model/request/task/get_task_by_room_code_request.dart';
import 'package:codelytic/presentation/bloc/task/task_bloc.dart';
import 'package:codelytic/presentation/widgets/item_materi_widget.dart';
import 'package:codelytic/presentation/widgets/item_task_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetTaskByRoomIdRequest requestTask =
        GetTaskByRoomIdRequest(room_id: Constant.getRoomId());
    context
        .read<TaskBloc>()
        .add(TaskGetTaskByRoomIdEvent(requestTask, Constant.getToken()));

    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Container(
              height: Dimens.heighMax(context) * 0.3,
              color: accentColor,
            ),
            Expanded(
              child: Container(
                color: bgColor1,
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
                  color: accentColor,
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
                        "Tugas",
                        style: secondaryTextStyle.copyWith(fontSize: 20),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          GetStudentTaskByRoomIdRequest
                              getStudentTaskByRoomIdRequest =
                              GetStudentTaskByRoomIdRequest(
                                  room_id: Constant.getRoomId());
                          context.read<TaskBloc>().add(
                              TaskGetStudentTaskByRoomIdEvent(
                                  getStudentTaskByRoomIdRequest,
                                  Constant.getToken()));
                          Navigator.pushNamed(context, AppRoute.taskHistory);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Icon(
                            Icons.history,
                            color: secondaryColor,
                            size: 32,
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: Dimens.widthMax(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimens.clipRounded),
                      topLeft: Radius.circular(Dimens.clipRounded),
                    ),
                    color: bgColor1,
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
                              color: accentColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 28,
                        ),
                        Text(
                          "List Tugas",
                          style: subtitleTextStyle,
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
      child: BlocBuilder<TaskBloc, TaskState>(
        buildWhen: (context, state) {
          return state is TaskGetTaskByRoomIdState;
        },
        builder: (context, state) {
          if (state is TaskGetTaskByRoomIdState) {
            if (state.getTaskByRoomCodeResponseEntity.task!.isEmpty) {
              return Container(
                  height: 140,
                  margin: EdgeInsets.only(
                    left: Dimens.defaultMargin,
                  ),
                  child: Center(
                    child: Text(TextApp.nothingTask),
                  ));
            } else {
              return Column(
                children: state.getTaskByRoomCodeResponseEntity.task!
                    .asMap()
                    .map((index, item) => MapEntry(
                          index,
                          ItemTaskWidget(
                            index,
                            item,
                          ),
                        ))
                    .values
                    .toList(),
              );
            }
          } else if (state is TaskLoading) {
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

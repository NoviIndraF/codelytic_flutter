import 'package:codelytic/common/app_route.dart';
import 'package:codelytic/common/constant.dart';
import 'package:codelytic/common/dimens.dart';
import 'package:codelytic/common/text_app.dart';
import 'package:codelytic/data/model/request/discussion/get_student_group_by_room_id_request.dart';
import 'package:codelytic/data/model/request/materi/get_materi_by_room_id_request.dart';
import 'package:codelytic/data/model/request/quiz/get_quiz_by_room_id_request.dart';
import 'package:codelytic/data/model/request/room/get_room_by_id_request.dart';
import 'package:codelytic/data/model/request/task/get_student_task_by_room_id_request.dart';
import 'package:codelytic/data/model/request/task/get_task_by_room_code_request.dart';
import 'package:codelytic/data/model/response/discussion/get_student_group_by_room_id_response.dart';
import 'package:codelytic/presentation/bloc/discussion/discussion_bloc.dart';
import 'package:codelytic/presentation/bloc/home/home_bloc.dart';
import 'package:codelytic/presentation/bloc/materi/materi_bloc.dart';
import 'package:codelytic/presentation/bloc/quiz/quiz_bloc.dart';
import 'package:codelytic/presentation/bloc/room/room_bloc.dart';
import 'package:codelytic/presentation/bloc/student/student_bloc.dart';
import 'package:codelytic/presentation/bloc/task/task_bloc.dart';
import 'package:codelytic/presentation/widgets/item_new_discussion_widget.dart';
import 'package:codelytic/presentation/widgets/item_new_materi_widget.dart';
import 'package:codelytic/presentation/widgets/item_new_quiz_widget.dart';
import 'package:codelytic/presentation/widgets/item_new_task_widget.dart';
import 'package:codelytic/presentation/widgets/show_widget.dart';
import 'package:flutter/material.dart';
import 'package:codelytic/common/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeGetTokenAndCodeState) {
          getAllData(context, state.token, state.code, state.roomId, state.userId);
        }
        if (state is HomeErrorState) {
          ShowWidget.dialog(context, state.message);
        }
      },
      child: BlocListener<TaskBloc, TaskState>(
        listener: (context, state) {
          if (state is TaskGetStudentTaskByRoomIdState) {
            GetTaskByRoomIdRequest requestTask =
                GetTaskByRoomIdRequest(room_id: Constant.getRoomId());

            context.read<TaskBloc>().add(
                TaskGetTaskByRoomIdEvent(requestTask, Constant.getToken()));
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Stack(children: [
              Container(
                height: Dimens.heighMax(context),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [bgGd1, bgGd2],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              RefreshIndicator(
                onRefresh: () async {
                  context.read<HomeBloc>().add(HomeGetTokenAndCodeEvent());
                },
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 30.0,
                            left: 18.0,
                            right: 18.0,
                            bottom: 18.0,
                          ),
                          child: Container(
                              height: 250,
                              width: Dimens.widthMax(context),
                              child: Column(
                                children: [
                                  BlocBuilder<HomeBloc, HomeState>(
                                    builder: (context, state) {
                                      return Column(
                                        children: [
                                          BlocBuilder<StudentBloc,
                                              StudentState>(
                                            builder: (context, state) {
                                              if (state is StudentGetState) {
                                                return Header(
                                                    TextApp.welcome,
                                                    state.getStudentEntity
                                                            .name ??
                                                        ".....",
                                                  context
                                                );
                                              } else if (state is HomeLoading) {
                                                return Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              } else {
                                                return Header(
                                                  ".....",
                                                  ".....",
                                                  context
                                                );
                                              }
                                            },
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          BlocBuilder<RoomBloc, RoomState>(
                                            builder: (context, state) {
                                              if (state is RoomGetByIdState) {
                                                return ClassMenu(
                                                  context,
                                                  true,
                                                  state.getRoomByIdEntity
                                                          .name ??
                                                      ".....",
                                                  state.getRoomByIdEntity
                                                          .major ??
                                                      ".....",
                                                  state.getRoomByIdEntity
                                                          .code ??
                                                      "",
                                                );
                                              } else if (state is HomeLoading) {
                                                return Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              } else {
                                                return ClassMenu(
                                                  context,
                                                  false,
                                                  ".....",
                                                  ".....",
                                                  "",
                                                );
                                              }
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimens.clipRounded),
                              topLeft: Radius.circular(Dimens.clipRounded),
                            ),
                            color: secondaryColor,
                          ),
                          child: Content(context),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ]);
          },
        ),
      ),
    );
  }

  StatelessWidget ClassMenu(BuildContext context, bool stateGetAllData,
      String className, String classMajor, String code) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(Dimens.clipRounded),
        ),
        color: secondaryColor,
      ),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(Dimens.defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    "$className",
                    style: subtitleTextStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
              Expanded(
                  flex: 1,
                  child: Text(
                    "$classMajor",
                    style: linkTextStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ItemClassMenu(
                      TextApp.materi,
                      stateGetAllData,
                      context,
                      AppRoute.materi,
                      primaryColor,
                      'assets/icons/ic-materi.svg',
                      code),
                  ItemClassMenu(
                      TextApp.task,
                      stateGetAllData,
                      context,
                      AppRoute.task,
                      accentColor,
                      'assets/icons/ic-task.svg',
                      code),
                  ItemClassMenu(
                      TextApp.quiz,
                      stateGetAllData,
                      context,
                      AppRoute.quizCategory,
                      accentColor3,
                      'assets/icons/ic-quiz.svg',
                      code),
                  ItemClassMenu(
                      TextApp.disscussion,
                      stateGetAllData,
                      context,
                      AppRoute.disscussion,
                      accentColor2,
                      'assets/icons/ic-discuss.svg',
                      code),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  StatelessWidget ItemClassMenu(
      String title,
      bool stateGetAllData,
      BuildContext context,
      String route,
      Color color,
      String svgAddress,
      String code) {
    return GestureDetector(
      onTap: () {
        if (stateGetAllData) Navigator.pushNamed(context, route);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimens.clipRounded / 2)),
                color: color),
            child: Container(
              child: SvgPicture.asset(
                svgAddress,
                width: 20,
                height: 20,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                title,
                style: secondaryTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: stateGetAllData ? color : disableColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  StatelessWidget Content(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: Container(
              height: 8,
              width: MediaQuery.of(context).size.width / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(Dimens.clipRounded),
                ),
                color: disableColor,
              ),
            ),
          ),
        ),
        AnnouncementTitle(),
        NewMateriTitle(),
        NewMateris(),
        NewTugasTitle(),
        NewTasks(),
        NewDiscussionTitle(),
        NewDiscussions(),
        NewQuisTitle(),
        NewQuiz(),
        SizedBox(
          height: 20,
        )
      ],
    ));
  }

  StatelessWidget Header(String title, String name, BuildContext context) {
    return Container(
      width: Dimens.widthMax(context),
      child:
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 16,
              ),
              Container(
                height: 40,
                width: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: SvgPicture.asset(
                    'assets/icons/ic-student.svg',
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: secondaryTextStyle.copyWith(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "$name",
                        style: secondaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semibold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.notifications_active_outlined,
                    color: secondaryColor,
                  )),
            ],
          ),
    );
  }

  StatelessWidget AnnouncementTitle() {
    return Container(
      margin: EdgeInsets.only(
          top: 6, left: Dimens.defaultMargin, right: Dimens.defaultMargin),
    );
  }

  StatelessWidget NewMateriTitle() {
    return Container(
      margin: EdgeInsets.only(
          top: Dimens.defaultMargin,
          left: Dimens.defaultMargin,
          right: Dimens.defaultMargin),
      child: Text('Materi Terbaru', style: subtitleTextStyle),
    );
  }

  StatelessWidget NewMateris() {
    return Container(
      child: BlocBuilder<MateriBloc, MateriState>(
        buildWhen: (previousState, state) {
          return state is MateriGetMateriByRoomIdState;
        },
        builder: (context, state) {
          if (state is MateriGetMateriByRoomIdState) {
            print(state.toString());
            if (state.getMateriByRoomIdResponseEntity.materi!.isEmpty) {
              return Container(
                  height: 140,
                  margin: EdgeInsets.only(
                    left: Dimens.defaultMargin,
                  ),
                  child: Center(
                    child: Text(TextApp.nothingMateri),
                  ));
            } else {
              return Container(
                height: 120,
                margin: EdgeInsets.only(
                  left: Dimens.defaultMargin,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state.getMateriByRoomIdResponseEntity.materi!
                        .map((item) => ItemNewMateriWidget(
                              item.title,
                              item.description,
                              item.createdAt,
                              item.id,
                            ))
                        .toList(),
                  ),
                ),
              );
            }
          } else if (state is HomeLoading) {
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

  StatelessWidget NewTugasTitle() {
    return Container(
      margin: EdgeInsets.only(
          top: Dimens.defaultMargin / 2,
          left: Dimens.defaultMargin,
          right: Dimens.defaultMargin),
      child: Text('Tugas Terbaru', style: subtitleTextStyle),
    );
  }

  StatelessWidget NewTasks() {
    return Container(
      child: BlocBuilder<TaskBloc, TaskState>(
        buildWhen: (context, state) {
          return state is TaskGetTaskByRoomIdState;
        },
        builder: (context, states) {
          if (states is TaskGetTaskByRoomIdState) {
            if (states.getTaskByRoomCodeResponseEntity.task!.isEmpty) {
              return Container(
                  height: 120,
                  margin: EdgeInsets.only(
                    top: 12,
                    left: Dimens.defaultMargin,
                  ),
                  child: Center(
                    child: Text(TextApp.nothingTask),
                  ));
            }
            return Container(
              height: 120,
              margin: EdgeInsets.only(
                left: Dimens.defaultMargin,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                    height: 120,
                    child: Row(
                      children: states.getTaskByRoomCodeResponseEntity.task!
                          .asMap()
                          .map((index, item) {
                            return MapEntry(
                              index,
                              ItemNewTaskWidget(
                                item,
                                index,
                              ),
                            );
                          })
                          .values
                          .toList(),
                    )),
              ),
            );
          } else if (states is HomeLoading) {
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

  StatelessWidget NewDiscussionTitle() {
    return Container(
      margin: EdgeInsets.only(
          top: Dimens.defaultMargin / 2,
          left: Dimens.defaultMargin,
          right: Dimens.defaultMargin),
      child: Text('Diskusi Terbaru', style: subtitleTextStyle),
    );
  }

  StatelessWidget NewDiscussions() {
    return Container(
      child: BlocBuilder<DiscussionBloc, DiscussionState>(
        buildWhen: (context, state) {
          return state is DiscussionGetStudentGroupByRoomIdState;
        },
        builder: (context, states) {
          if (states is DiscussionGetStudentGroupByRoomIdState) {
            List<StudentGroup> studenGroup = states.entity.studentGroup??[];

            if (studenGroup.isEmpty) {
              return Container(
                  height: 120,
                  margin: EdgeInsets.only(
                    top: 12,
                    left: Dimens.defaultMargin,
                  ),
                  child: Center(
                    child: Text(TextApp.nothingDiscussion),
                  ));
            }
            return Container(
              height: 120,
              margin: EdgeInsets.only(
                left: Dimens.defaultMargin,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                    height: 120,
                    child: Row(
                      children: states.entity.studentGroup!
                          .asMap()
                          .map((index, item) {
                        return MapEntry(
                          index,
                          ItemNewDiscussionWidget(
                            item,
                          ),
                        );
                      })
                          .values
                          .toList(),
                    )),
              ),
            );
          } else if (states is HomeLoading) {
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

  StatelessWidget NewQuisTitle() {
    return Container(
      margin: EdgeInsets.only(
          top: Dimens.defaultMargin / 2,
          left: Dimens.defaultMargin,
          right: Dimens.defaultMargin),
      child: Text('Kuis Terbaru', style: subtitleTextStyle),
    );
  }

  StatelessWidget NewQuiz() {
    return Container(
      child: BlocBuilder<QuizBloc, QuizState>(
        buildWhen: (context, state) {
          return state is QuizGetQuizByRoomIdState;
        },
        builder: (context, state) {
          if (state is QuizGetQuizByRoomIdState) {
            if (state.getQuizByRoomIdEntity.quiz == null) {
              return Container(
                  height: 140,
                  margin: const EdgeInsets.only(
                    top: 12,
                    left: Dimens.defaultMargin,
                  ),
                  child: Center(
                    child: Text(TextApp.nothingQuiz),
                  ));
            }
            return Container(
              margin: EdgeInsets.only(
                top: 12,
                left: Dimens.defaultMargin,
              ),
              child: SingleChildScrollView(
                child: Container(
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: state.getQuizByRoomIdEntity.quiz!
                        .map((item) => ItemNewQuizWidget(item))
                        .toList(),
                  ),
                ),
              ),
            );
          } else if (state is HomeLoading) {
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

void getAllData(
    BuildContext context, String token, String code, String roomId, String userId) {
  Constant.setToken(token);
  Constant.setCode(code);
  Constant.setRoomId(int.parse(roomId));
  Constant.setUserId(int.parse(userId));

  GetRoomByIdRequest requestRoom = GetRoomByIdRequest(room_id: roomId);
  context.read<RoomBloc>().add(RoomGetByIdEvent(token, requestRoom));

  context.read<StudentBloc>().add(StudentGetEvent(token));

  GetMateriByRoomIdRequest requestMateri =
      GetMateriByRoomIdRequest(room_id: roomId);
  context
      .read<MateriBloc>()
      .add(MateriGetMateriByRoomIdEvent(token, requestMateri));

  GetStudentTaskByRoomIdRequest getStudentTaskByRoomIdRequest =
      GetStudentTaskByRoomIdRequest(room_id: Constant.getRoomId());
  context.read<TaskBloc>().add(TaskGetStudentTaskByRoomIdEvent(
      getStudentTaskByRoomIdRequest, Constant.getToken()));

  GetStudentGroupByRoomIdRequest getStudentGroupByRoomIdRequest =
  GetStudentGroupByRoomIdRequest(room_id: Constant.getRoomId());
  context.read<DiscussionBloc>().add(DiscussionGetStudentGroupByRoomIdEvent(Constant.getToken(),
    getStudentGroupByRoomIdRequest));

  GetQuizByRoomIdRequest requestQuiz = GetQuizByRoomIdRequest(room_id: roomId);
  context.read<QuizBloc>().add(QuizGetQuizByRoomCodeEvent(token, requestQuiz));
}
